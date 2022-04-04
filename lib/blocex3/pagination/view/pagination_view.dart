import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pagination_cubit.dart';
import '../pagination.dart';

class PaginationView extends StatelessWidget {
  const PaginationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: BlocBuilder<PaginationCubit, PaginationState>(
      //   builder: (context, state) {
      //     if (state is PaginationLoading) {
      //       return const Text("loading...");
      //     } else if (state is PaginationSuccess) {
      //       return PaginationScroll(
      //         size: 1,
      //         list: context.read<PaginationCubit>().cubitList,
      //         fetch: (val) => context.read<PaginationCubit>().fetchData(val, 1),
      //       );
      //     } else {
      //       return const Text("error");
      //     }
      //   },
      // ),

      body: PaginationScroll(
        size: 10,
        list: context.read<PaginationCubit>().cubitList,
        fetch: (val, size) async {
          return await context.read<PaginationCubit>().fetchData(val, size);
        },
      ),
    );
  }
}
