import 'package:bloc_plugin/bloc/counter/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';
import '../bloc/counter/counter_state.dart';
import 'counter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Bloc Plugin',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return PopupMenuButton(
              padding: EdgeInsets.zero,
              tooltip: 'Light Theme',
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              position: PopupMenuPosition.under,
              color: Colors.white,
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: ThemeMode.light,
                  child: Text(
                    'Light Theme',
                    style: TextStyle(
                      color: state.theme==ThemeMode.light
                          ? Colors.redAccent
                          : Colors.black,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: ThemeMode.dark,
                  child: Text(
                    'Dark Theme',
                    style: TextStyle(
                      color: state.theme==ThemeMode.dark
                          ? Colors.redAccent
                          : Colors.black,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: ThemeMode.system,
                  child: Text(
                    'System',
                    style: TextStyle(
                      color: state.theme==ThemeMode.system
                          ? Colors.redAccent
                          : Colors.black,
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                print(value);
                context.read<CounterBloc>().add(ThemeEvent(theme: value));
              },
            );
          },)
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      const WidgetStatePropertyAll(Colors.redAccent),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CounterScreen()));
                  },
                  child: const Text(
                    'Counter App',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      const WidgetStatePropertyAll(Colors.redAccent),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const FavoriteScreen()));
                  },
                  child: const Text(
                    'List App',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
