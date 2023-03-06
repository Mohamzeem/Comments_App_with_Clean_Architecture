// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_upd_del_bloc.dart';

abstract class AddUpdDelState extends Equatable {
  const AddUpdDelState();

  @override
  List<Object> get props => [];
}

class AddUpdDelInitialState extends AddUpdDelState {}

class AddUpdDelLoadingState extends AddUpdDelState {}

class AddUpdDelSuccessState extends AddUpdDelState {
  final String successMessage;
  const AddUpdDelSuccessState({
    required this.successMessage,
  });
  @override
  List<Object> get props => [successMessage];
}

class AddUpdDelFailureState extends AddUpdDelState {
  final String failedMessage;
  const AddUpdDelFailureState({
    required this.failedMessage,
  });
  @override
  List<Object> get props => [failedMessage];
}
