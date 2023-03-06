// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/comment.dart';
import '../../domain/repositories/comments_repository.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import '../models/comment_model.dart';

typedef AddOrUpdateOrDeleteComment = Future<Unit> Function();

class CommentsRepositoryImpl implements CommentsRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  CommentsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Comment>>> getAllComments() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComments = await remoteDataSource.getAllComments();
        await localDataSource.saveComments(remoteComments);
        return right(remoteComments);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final localComments = await localDataSource.getSavedComments();
        return right(localComments);
      } on CacheException {
        return left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addConment(Comment comment) async {
    final CommentModel commentModel = CommentModel(
        body: comment.body, email: comment.email, name: comment.name);

    return await getMessage(() => remoteDataSource.addConment(commentModel));
  }

  @override
  Future<Either<Failure, Unit>> updateComment(Comment comment) async {
    final CommentModel commentModel = CommentModel(
        id: comment.id,
        body: comment.body,
        email: comment.email,
        name: comment.name);

    return await getMessage(() => remoteDataSource.updateComment(commentModel));
  }

  @override
  Future<Either<Failure, Unit>> deleteConment(int id) async {
    return await getMessage(() => remoteDataSource.deleteComment(id));
  }

  Future<Either<Failure, Unit>> getMessage(
      AddOrUpdateOrDeleteComment addOrUpdateOrDeleteComment) async {
    if (await networkInfo.isConnected) {
      try {
        await addOrUpdateOrDeleteComment();
        return right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
