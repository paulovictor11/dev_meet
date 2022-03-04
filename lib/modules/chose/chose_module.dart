import 'package:devmeet/modules/chose/cubit/chose_cubit.dart';
import 'package:devmeet/modules/chose/presenter/page.dart';
import 'package:devmeet/modules/chose/repository/chose_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChoseModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ChoseRepository(i())),
        Bind.lazySingleton((i) => ChoseCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ChosePage()),
      ];
}
