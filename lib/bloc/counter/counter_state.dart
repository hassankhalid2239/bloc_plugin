import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CounterState extends Equatable {
  final int counter;
  final ThemeMode theme;

  const CounterState({this.counter = 0, this.theme = ThemeMode.light});

  CounterState copyWith({int? counter, ThemeMode? theme}) {
    return CounterState(
        counter: counter ?? this.counter, theme: theme ?? this.theme);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter, theme];
}
