import 'package:devmeet/modules/chose/chose_module.dart';
import 'package:devmeet/modules/events/event_module.dart';
import 'package:devmeet/modules/greeting/greeting_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => Dio(BaseOptions(baseUrl: 'localhost:8000/api')),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: GreetingModule()),
        ModuleRoute('/chose', module: ChoseModule()),
        ModuleRoute('/events', module: EventModule()),
      ];
}
