import 'package:devmeet/shared/models/event.dart';
import 'package:dio/dio.dart';

class EventRepository {
  final Dio? _dio;

  EventRepository(this._dio);

  List<Event> getEvents() {
    try {
      final List<Event> _events = [
        Event(
          date: '02/MAR',
          time: '19:00',
          title: 'Criando interfaces muito malucas com o Figma!',
          content:
              'Você pode criar interfaces malucas que dispertam sua criativade. Usando de recursos do próprio figma, como seus plugins.',
          by: 'Comunidade Ballerini',
          link: 'meet.google/evento-1',
        ),
        Event(
          date: '01/MAR',
          time: '10:00',
          title: 'Entendendo o Z-Pattern',
          content:
              'Conheça como o olho humano observa um website a partir dos conceitos hierarquicos do Z-Pattern.',
          by: 'Comunidade Ballerini',
          link: 'meet.google/evento-2',
        ),
      ];

      return _events;
    } on DioError catch (err) {
      throw err.message;
    }
  }
}
