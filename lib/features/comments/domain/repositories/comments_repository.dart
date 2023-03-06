import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/comment.dart';

abstract class CommentsRepository {
  Future<Either<Failure, List<Comment>>> getAllComments();
  Future<Either<Failure, Unit>> addConment(Comment comment);
  Future<Either<Failure, Unit>> updateComment(Comment comment);
  Future<Either<Failure, Unit>> deleteConment(int id);
}
