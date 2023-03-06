// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/comment.dart';
import '../repositories/comments_repository.dart';

class GetAllCommentsUseCase {
  final CommentsRepository commentsRepository;
  GetAllCommentsUseCase({
    required this.commentsRepository,
  });

  Future<Either<Failure, List<Comment>>> call() async {
    return await commentsRepository.getAllComments();
  }
}
