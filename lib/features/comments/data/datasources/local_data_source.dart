// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/strings/app_strings.dart';
import '../models/comment_model.dart';

abstract class LocalDataSource {
  Future<Unit> saveComments(List<CommentModel> commentModel);
  Future<List<CommentModel>> getSavedComments();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<List<CommentModel>> getSavedComments() {
    final jsonString = sharedPreferences.getString(AppStrings.savedPosts);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<CommentModel> jsonToCommentModel = decodeJsonData
          .map<CommentModel>((e) => CommentModel.fromJson(e))
          .toList();
      return Future.value(jsonToCommentModel);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<Unit> saveComments(List<CommentModel> commentModel) {
    List commentModelToJson = commentModel
        .map<Map<String, dynamic>>((commentModel) => commentModel.toJson())
        .toList();
    sharedPreferences.setString(
        AppStrings.savedPosts, json.encode(commentModelToJson));
    return Future.value(unit);
  }
}
