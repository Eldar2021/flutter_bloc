import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(PaginationLoading());

  List<CharacterSummary> cubitList = [];

  Future<List<CharacterSummary>> getCharacterList(int offset, int limit,
      {String? searchTerm}) async {
    final url = Uri.parse(
        "https://www.breakingbadapi.com/api/characters/?offset=$offset&limit=$limit");

    final response = await http.get(url);

    return myFoodFromJson(response.body);
  }

  Future<List<CharacterSummary>> fetchData(int offset, int limit) async {
    emit(PaginationLoading());
    try {
      final List<CharacterSummary> list = await getCharacterList(offset, limit);
      cubitList = list;
      emit(PaginationSuccess(cubitList));
      return cubitList;
    } catch (e) {
      emit(PaginationError());
      return cubitList;
    }
  }
}
