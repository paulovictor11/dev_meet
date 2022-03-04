part of 'event_cubit.dart';

class EventState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<Event> events;
  final Event? event;

  const EventState({
    this.isLoading = false,
    this.error,
    this.events = const [],
    this.event,
  });

  copyWith({
    bool? isLoading,
    String? error,
    List<Event>? events,
    Event? event,
  }) {
    return EventState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      events: events ?? this.events,
      event: event ?? this.event,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        events,
        event,
      ];
}
