import 'package:devmeet/modules/events/cubit/event_cubit.dart';
import 'package:devmeet/modules/events/presenter/detail.dart';
import 'package:devmeet/modules/events/presenter/page.dart';
import 'package:devmeet/modules/events/repository/event_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => EventRepository(i())),
        Bind.lazySingleton((i) => EventCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const EventsPage()),
        ChildRoute('/detail', child: (_, __) => const EventDetail()),
      ];
}
