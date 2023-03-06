// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsInitialState extends CommentsState {}

class CommentsLoadingState extends CommentsState {}

class CommentsSuccessState extends CommentsState {
  final List<Comment> comment;
  const CommentsSuccessState({
    required this.comment,
  });
  @override
  List<Object> get props => [comment];
}

class CommentsFailureState extends CommentsState {
  final String message;
  const CommentsFailureState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
