import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addblock_event.dart';
part 'addblock_state.dart';

class AddblockBloc extends Bloc<AddblockEvent, AddblockState> {
  AddblockBloc() : super(AddblockInitial()) {
    on<AddblockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
