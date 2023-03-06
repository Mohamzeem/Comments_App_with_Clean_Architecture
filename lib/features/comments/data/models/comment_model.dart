// ignore_for_file: must_be_immutable
import '../../domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel(
      {int? id,
      required String name,
      required String body,
      required String email})
      : super(body: body, id: id, name: name, email: email);

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        name: json["name"],
        body: json["body"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "body": body,
        "email": email,
      };
}



// class CommentModel extends Comment {
//   CommentModel({
//     required this.id,
//     required this.body,
//     required this.postId,
//     required this.user,
//   }) : super(id: id, username: user.username, body: body, postId: postId);

//   int id;
//   String body;
//   int postId;
//   User user;

//   factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
//         id: json["id"],
//         body: json["body"],
//         postId: json["postId"],
//         user: User.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "body": body,
//         "postId": postId,
//         "user": user.toJson(),
//       };
// }

// class User {
//   User({
//     required this.id,
//     required this.username,
//   });

//   int id;
//   String username;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         username: json["username"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//       };
// }
