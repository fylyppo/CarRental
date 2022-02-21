import 'package:flutter/material.dart';
import 'package:flutter_assignment/login/bloc/login_bloc.dart';
import 'package:flutter_assignment/models/car.dart';
import 'package:flutter_assignment/presentation/home/home_page.dart';
import 'package:flutter_assignment/presentation/offer/offer_page.dart';
import 'package:flutter_assignment/theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../category_page.dart';

class AppRouter {
  final ThemeBloc themeBloc = ThemeBloc();
  final LoginBloc _loginBloc = LoginBloc();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: themeBloc),
                    BlocProvider.value(value: _loginBloc),
                  ],
                  child: HomePage(),
                ));
      case '/offer':
        final car = settings.arguments as Car;
        return MaterialPageRoute(builder: (_) => OfferPage(car));
      case '/category':
        final category = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CategoryPage(category));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Nie ma takiej strony'),
                  ),
                ));
    }
  }

  void dispose() {
    themeBloc.close();
    _loginBloc.close();
  }
}
