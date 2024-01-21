import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'logink_event.dart';
part 'logink_state.dart';

class LoginkBloc extends Bloc<LoginkEvent, LoginkState> {
  LoginkBloc() : super(LoginkInitial()) {
    on<LoginkEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
