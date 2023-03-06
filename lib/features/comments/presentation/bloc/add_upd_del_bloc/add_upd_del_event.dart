// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_upd_del_bloc.dart';

abstract class AddUpdDelBlocEvent extends Equatable {
  const AddUpdDelBlocEvent();

  @override
  List<Object> get props => [];
}

class AddCommentEvent extends AddUpdDelBlocEvent {
  final Comment comment;
  const AddCommentEvent({
    required this.comment,
  });
  @override
  List<Object> get props => [comment];
}

class UpdateCommentEvent extends AddUpdDelBlocEvent {
  final Comment comment;
  const UpdateCommentEvent({
    required this.comment,
  });
  @override
  List<Object> get props => [comment];
}

class DeleteCommentEvent extends AddUpdDelBlocEvent {
  final int postId;
  const DeleteCommentEvent({
    required this.postId,
  });
  @override
  List<Object> get props => [postId];
}
