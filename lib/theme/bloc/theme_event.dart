part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  final int darkTheme;
  const ThemeEvent(this.darkTheme);

  @override
  List<Object> get props => [darkTheme];
}
class ThemeChanged extends ThemeEvent {
  final int darkTheme;

  ThemeChanged({
    required this.darkTheme,
  }) : super(darkTheme);
}
