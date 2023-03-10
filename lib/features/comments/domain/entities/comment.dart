// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  int? id;
  final String name;
  final String body;
  final String email;
  Comment({
    this.id,
    required this.name,
    required this.body,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, body, email];
}
