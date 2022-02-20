import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

  class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin{
  ThemeBloc() : super(ThemeState(darkTheme: 0)) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(darkTheme: event.darkTheme));
    });
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    return state.toMap();
  }
}