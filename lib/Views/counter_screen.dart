import 'package:bloc_plugin/bloc/counter/counter_bloc.dart';
import 'package:bloc_plugin/bloc/counter/counter_event.dart';
import 'package:bloc_plugin/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build......');
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Counter App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: const TextStyle(
                  fontSize: 50,
                ),
              );
            },)
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.redAccent,
          onPressed: () {
            context.read<CounterBloc>().add(IncrementCounter());
          },
          child: const Icon(
            Icons.add,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
