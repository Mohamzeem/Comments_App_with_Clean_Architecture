// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/strings/app_failure_messages.dart';
import '../../../domain/entities/comment.dart';
import '../../../domain/usecases/get_all_comments.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetAllCommentsUseCase getAllCommentsUseCase;
  CommentsBloc({required this.getAllCommentsUseCase})
      : super(CommentsInitialState()) {
    on<CommentsEvent>((event, emit) async {
      if (event is GetAllCommentsEvent) {
        emit(CommentsLoadingState());
        final failureOrComments = await getAllCommentsUseCase();
        emit(_mapFailureOrComments(failureOrComments));
      } else if (event is RefreshCommentsEvent) {
        emit(CommentsLoadingState());
        final failureOrComments = await getAllCommentsUseCase();
        emit(_mapFailureOrComments(failureOrComments));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppFailures.SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return AppFailures.EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return AppFailures.OFFLINE_FAILURE_MESSAGE;
      default:
        return AppFailures.UNEXCEPECTED_MESSAGE;
    }
  }

  CommentsState _mapFailureOrComments(Either<Failure, List<Comment>> either) {
    return either.fold(
        (failure) =>
            CommentsFailureState(message: _mapFailureToMessage(failure)),
        (comments) => CommentsSuccessState(comment: comments));
  }
}
