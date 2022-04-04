import 'package:bloc_education/blocex3/posts/bloc/post_bloc.dart';
import 'package:bloc_education/blocex3/posts/view/posts_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);
  final Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post List res api limit"),
      ),
      body: BlocProvider(
        create: (_) => PostBloc(),
        child: const PostList(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _fetchTests();
      }),
    );
  }

  Future<void> _fetchTests() async {
    try {
      final response = await dio.get(
          "https://test-docs.stores.kg/api/categories?page=1&itemsPerPage=1");
      // print(response.data);
      if (response.statusCode == 200) {
        // print(response.statusCode);
        // print(response.data);
      }
    } catch (e) {
      print("Error _fetching posts $e");
    }
  }
}
