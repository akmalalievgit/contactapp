import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homek_event.dart';
part 'homek_state.dart';

class HomekBloc extends Bloc<HomekEvent, HomekState> {
  HomekBloc() : super(HomekInitial()) {
    on<HomekEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
