import 'package:bloc/bloc.dart';
import 'package:bloc_plugin/bloc/counter/counter_event.dart';
import 'package:bloc_plugin/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() :super(const CounterState()){
    on<IncrementCounter>(_increment);
    on<ThemeEvent>(_theme);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter +1));
  }

  void _theme(ThemeEvent event, Emitter<CounterState> emit){
    emit(state.copyWith(theme: event.theme));
  }
}