import 'package:bloc/bloc.dart';
import 'package:devmeet/modules/events/repository/event_repository.dart';
import 'package:devmeet/shared/models/event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepository _repository;

  EventCubit(this._repository) : super(const EventState());

  void getEvents() {
    try {
      emit(state.copyWith(isLoading: true));

      final response = _repository.getEvents();

      emit(state.copyWith(
        isLoading: false,
        events: response,
      ));
    } catch (err) {
      emit(state.copyWith(
        isLoading: false,
        error: err.toString(),
      ));
    }
  }

  void selectEvent(Event event) {
    emit(state.copyWith(event: event));

    Modular.to.pushNamed('detail');
  }
}
