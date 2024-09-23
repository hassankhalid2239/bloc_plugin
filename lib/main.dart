import 'package:bloc_plugin/Views/home_screen.dart';
import 'package:bloc_plugin/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
        ],
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Bloc Plugin',
              themeMode: state.theme,
              theme: ThemeData(
                brightness: Brightness.light,
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                useMaterial3: true,
              ),
              home: const HomeScreen(),
            );
          },
        ));
  }
}
