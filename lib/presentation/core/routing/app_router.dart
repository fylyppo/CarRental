import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/car.dart';
import 'package:flutter_assignment/presentation/home/home_page.dart';
import 'package:flutter_assignment/presentation/offer/offer_page.dart';
import 'package:flutter_assignment/theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final ThemeBloc themeBloc = ThemeBloc();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => themeBloc,
            child: HomePage(),
          ),
        );
      case '/offer':
        final car = settings.arguments as Car;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => themeBloc,
                  child: OfferPage(car),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Nie ma takiej strony'),
                  ),
                ));
    }
  }
}
