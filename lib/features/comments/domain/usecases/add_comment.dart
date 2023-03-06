// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/comment.dart';
import '../repositories/comments_repository.dart';

class AddCommentUseCase {
  final CommentsRepository commentsRepository;
  AddCommentUseCase({
    required this.commentsRepository,
  });

  Future<Either<Failure, Unit>> call(Comment comment) async {
    return await commentsRepository.addConment(comment);
  }
}
