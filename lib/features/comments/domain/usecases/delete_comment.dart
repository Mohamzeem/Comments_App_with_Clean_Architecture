// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/comments_repository.dart';

class DeleteCommentUseCase {
  final CommentsRepository commentsRepository;
  DeleteCommentUseCase({
    required this.commentsRepository,
  });

  Future<Either<Failure, Unit>> call(int id) async {
    return await commentsRepository.deleteConment(id);
  }
}
