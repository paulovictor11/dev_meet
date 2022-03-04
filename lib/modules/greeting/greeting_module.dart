import 'package:devmeet/modules/greeting/presenter/page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GreetingModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const GreetingPage()),
      ];
}
