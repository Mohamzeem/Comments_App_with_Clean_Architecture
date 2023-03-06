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



// class Comment extends Equatable {
  // final int id;
  // final String username;
  // final String body;
  // final int postId;

//   const Comment(
//       {required this.id,
//       required this.username,
//       required this.body,
//       required this.postId});

//   @override
//   List<Object?> get props => [id, username, body, postId];
// }
