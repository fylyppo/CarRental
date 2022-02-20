import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/theme/app_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'presentation/core/routing/app_router.dart';
import 'theme/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(() {
    BlocOverrides.runZoned(
      () {
        runApp(MyApp());
      },
    );
  }, storage: storage);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _router.themeBloc,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            onGenerateRoute: _router.onGenerateRoute,
            theme: theme(state),
          );
        },
      ),
    );
  }

  ThemeData theme(ThemeState state){
    if(state.darkTheme == 1) return appThemeData[AppTheme.Dark]!;
    else return appThemeData[AppTheme.Light]!;
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }
}
