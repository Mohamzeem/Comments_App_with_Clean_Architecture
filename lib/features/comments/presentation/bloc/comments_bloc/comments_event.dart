part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class GetAllCommentsEvent extends CommentsEvent {}

class RefreshCommentsEvent extends CommentsEvent {}
