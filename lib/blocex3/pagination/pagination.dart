import 'package:bloc_education/blocex3/pagination/cubit/pagination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'remout_api.dart';


class PaginationScroll extends StatefulWidget {
  const PaginationScroll({
    Key? key,
    required this.fetch,
    required this.list,
    required this.size,
  }) : super(key: key);

  final Future<List<CharacterSummary>>Function(int, int) fetch;
  final List<dynamic> list;
  final int size;

  @override
  _PaginationScrollState createState() => _PaginationScrollState();
}

class _PaginationScrollState extends State<PaginationScroll> {
  final PagingController<int, CharacterSummary> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((key) {
      _fetchPage(key);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
     // final List<CharacterSummary> newItems =  await RemoteApi.getCharacterList(pageKey, widget.size);
      final List<CharacterSummary> newItems =  await widget.fetch(pageKey, widget.size);
      final isLastPage = newItems.length < widget.size;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, CharacterSummary>(
      shrinkWrap: true,
      primary: false,
      pagingController: _pagingController,
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   //childAspectRatio: 100 / 150,
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   crossAxisCount: 1,
      // ),
      builderDelegate: PagedChildBuilderDelegate<CharacterSummary>(
        itemBuilder: (context, item, index){
          print(item.id);
          return Card(
            child: Text(
              item.name,
              style: const TextStyle(fontSize: 50),
            ),
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
