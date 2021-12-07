import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/post_model.dart';

part 'post_event.dart';

part 'post_state.dart';

const int _postLimit = 20;
const throttleDuration = Duration(microseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final Dio dio = Dio();

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(state.copyWith(
          posts: posts,
          status: PostStatus.success,
          hasReachedMax: false,
        ));
      }
      final posts = await _fetchPosts(state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: true,
              ),
            );
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
    final response = await dio.requestUri(Uri.https(
      "jsonplaceholder.typicode.com",
      "/posts",
      <String, String>{
        "_start": "$startIndex",
        "_limit": "$_postLimit",
      },
    ));
    if (response.statusCode == 200) {
      return (response.data as List).map((dynamic json) {
        return Post(
          id: json["id"] as int,
          title: json["title"] as String,
          body: json["body"] as String,
        );
      }).toList();
    }
    throw Exception("Error _fetching posts");
  }
}
