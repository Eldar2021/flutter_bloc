import 'package:bloc_education/blocex3/posts/bloc/post_bloc.dart';
import 'package:bloc_education/blocex3/posts/view/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

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
    );
  }
}
