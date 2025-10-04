import 'package:equatable/equatable.dart';

class AskyQuestionModel extends Equatable {
  const AskyQuestionModel({required this.query, required this.top_k});

  final String query;
  final int top_k;

  factory AskyQuestionModel.fromJson(Map<String, dynamic> json) {
    return AskyQuestionModel(query: json["query"], top_k: json["top_k"]);
  }

  Map<String, dynamic> toJson() => {"query": query, "top_k": 5};

  @override
  List<Object?> get props => [query, top_k];

  AskyQuestionModel copyWith({String? query, int? top_k}) {
    return AskyQuestionModel(
      query: query ?? this.query,
      top_k: top_k ?? this.top_k,
    );
  }
}
