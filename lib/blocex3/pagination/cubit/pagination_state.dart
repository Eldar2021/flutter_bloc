part of 'pagination_cubit.dart';

abstract class PaginationState extends Equatable {
  const PaginationState();
}

class PaginationLoading extends PaginationState {
  @override
  List<Object> get props => [];
}

class PaginationSuccess extends PaginationState {
  final List<CharacterSummary> list;

  const PaginationSuccess(this.list);

  @override
  List<Object> get props => [list];
}

class PaginationError extends PaginationState {
  @override
  List<Object> get props => [];
}


List<CharacterSummary> myFoodFromJson(String str) =>
    List<CharacterSummary>.from(json.decode(str).map((x) => CharacterSummary.fromJson(x)));

class CharacterSummary {
  CharacterSummary({
    required this.id,
    required this.name,
    required this.pictureUrl,
  });

  factory CharacterSummary.fromJson(Map<String, dynamic> json) =>
      CharacterSummary(
        id: json['char_id'],
        name: json['name'],
        pictureUrl: json['img'],
      );

  final int id;
  final String name;
  final String pictureUrl;
}