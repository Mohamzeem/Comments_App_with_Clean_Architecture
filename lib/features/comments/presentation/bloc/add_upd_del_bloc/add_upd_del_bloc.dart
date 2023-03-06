// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/strings/app_failure_messages.dart';
import '../../../../../core/strings/app_successe_messages.dart';
import '../../../domain/entities/comment.dart';
import '../../../domain/usecases/add_comment.dart';
import '../../../domain/usecases/delete_comment.dart';
import '../../../domain/usecases/update_comment.dart';

part 'add_upd_del_event.dart';
part 'add_upd_del_state.dart';

class AddUpdDelBloc extends Bloc<AddUpdDelBlocEvent, AddUpdDelState> {
  final AddCommentUseCase addCommentUseCase;
  final UpdateCommentUseCase updateCommentUseCase;
  final DeleteCommentUseCase deleteCommentUseCase;
  AddUpdDelBloc({
    required this.addCommentUseCase,
    required this.updateCommentUseCase,
    required this.deleteCommentUseCase,
  }) : super(AddUpdDelInitialState()) {
    on<AddUpdDelBlocEvent>((event, emit) async {
      if (event is AddCommentEvent) {
        emit(AddUpdDelLoadingState());
        final failureOrSuccessComment = await addCommentUseCase(event.comment);
        emit(_eitherSuccessOrFailedMsg(
            failureOrSuccessComment, AppMessages.ADD_SUCCESS_MESSAGE));
      } else if (event is UpdateCommentEvent) {
        emit(AddUpdDelLoadingState());
        final failureOrSuccessComment =
            await updateCommentUseCase(event.comment);
        emit(_eitherSuccessOrFailedMsg(
            failureOrSuccessComment, AppMessages.UPDATE_SUCCESS_MESSAGE));
      } else if (event is DeleteCommentEvent) {
        emit(AddUpdDelLoadingState());
        final failureOrSuccessComment =
            await deleteCommentUseCase(event.postId);
        emit(_eitherSuccessOrFailedMsg(
            failureOrSuccessComment, AppMessages.DELETE_SUCCESS_MESSAGE));
      }
    });
  }

  AddUpdDelState _eitherSuccessOrFailedMsg(
      Either<Failure, Unit> either, String msg) {
    return either.fold(
        (failure) =>
            AddUpdDelFailureState(failedMessage: _mapFailureToMessage(failure)),
        (success) => AddUpdDelSuccessState(successMessage: msg));
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
}
