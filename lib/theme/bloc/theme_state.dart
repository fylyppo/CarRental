part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final int darkTheme;
  const ThemeState({required this.darkTheme});
  
  
  @override
  List<Object> get props => [darkTheme];


  Map<String, dynamic> toMap() {
    return {
      'darkTheme': darkTheme,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      darkTheme: map['darkTheme'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeState.fromJson(String source) => ThemeState.fromMap(json.decode(source));
}