import 'package:bloc_plugin/Views/home_screen.dart';
import 'package:bloc_plugin/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> CounterBloc()),
      ],
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Plugin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    )
    );
  }
}
