// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitialState extends ThemeState {}

class ThemeSuccessState extends ThemeState {
  final ThemeData themeData;
  const ThemeSuccessState({
    required this.themeData,
  });
  @override
  List<Object> get props => [themeData];
}
