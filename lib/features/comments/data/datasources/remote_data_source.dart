// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/comment_model.dart';

abstract class RemoteDataSource {
  Future<List<CommentModel>> getAllComments();
  Future<Unit> addConment(CommentModel commentModel);
  Future<Unit> updateComment(CommentModel commentModel);
  Future<Unit> deleteComment(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<CommentModel>> getAllComments() async {
    final response = await client.get(Uri.parse(EndPoints.url),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<CommentModel> commentModels = decodedJson
          .map<CommentModel>(
              (jsonCommentModel) => CommentModel.fromJson(jsonCommentModel))
          .toList();

      return commentModels;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<Unit> addConment(CommentModel commentModel) async {
    final body = {
      'name': commentModel.name,
      'body': commentModel.body,
      'email': commentModel.email
    };
    final response = await client.post(Uri.parse(EndPoints.url), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<Unit> updateComment(CommentModel commentModel) async {
    final commentId = commentModel.id.toString();
    final body = {
      'name': commentModel.name,
      'body': commentModel.body,
      'email': commentModel.email
    };
    final response = await client
        .patch(Uri.parse('${EndPoints.url}/$commentId'), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<Unit> deleteComment(int id) async {
    final response = await client.delete(Uri.parse('${EndPoints.url}/$id'),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw const ServerException();
    }
  }

  // final ApiConsumer apiConsumer;
  // RemoteDataSourceImpl({
  //   required this.apiConsumer,
  // });

  // @override
  // Future<List<CommentModel>> getAllComments() async {
  //   final response = await apiConsumer.get(EndPoints.url);
  //   final List decodejson = json.decode(response.body) as List;
  //   final List<CommentModel> commentModel =
  //       decodejson.map<CommentModel>((e) => CommentModel.fromJson(e)).toList();
  //   return commentModel;
  // }

  // @override
  // Future<Unit> addConment(CommentModel commentModel) async {
  //   final body = {
  //     'name': commentModel.name,
  //     'body': commentModel.body,
  //     'email': commentModel.email
  //   };
  //   await apiConsumer.post(EndPoints.url, body: body);
  //   return Future.value(unit);
  // }

  // @override
  // Future<Unit> updateComment(CommentModel commentModel) async {
  //   final body = {
  //     'name': commentModel.name,
  //     'body': commentModel.body,
  //     'email': commentModel.email
  //   };
  //   final commentId = commentModel.id.toString();
  //   await apiConsumer.put('${EndPoints.url}/$commentId', body: body);
  //   return Future.value(unit);
  // }

  // @override
  // Future<Unit> deleteComment(int id) async {
  //   await apiConsumer.delete(
  //     '${EndPoints.url}/${id.toString()}',
  //   );
  //   return Future.value(unit);
  // }
}
