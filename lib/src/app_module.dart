import 'package:atomic_state2/src/data/controllers/protection_progress_controller.dart';
import 'package:atomic_state2/src/data/controllers/tracking_protection_controller.dart';
import 'package:atomic_state2/src/data/controllers/transfer_protection_controller.dart';
import 'package:atomic_state2/src/data/stores/alarm_protection_store.dart';
import 'package:atomic_state2/src/data/stores/protection_progress_store.dart';
import 'package:atomic_state2/src/data/stores/tracking_protection_store.dart';
import 'package:atomic_state2/src/data/stores/transfer_protection_store.dart';
import 'package:atomic_state2/src/ui/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/controllers/alarm_protection_controller.dart';
import 'data/controllers/antitheft_camera_protection_controller.dart';
import 'data/controllers/data_blocking_protection_controller.dart';
import 'data/stores/antitheft_camera_protection_store.dart';
import 'data/stores/data_blocking_protection_store.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => ProtectionProgressStore()),
        Bind.lazySingleton((i) => TrackingProtectionStore()),
        Bind.lazySingleton((i) => AlarmProtectionStore()),
        Bind.lazySingleton((i) => AntiTheftCameraProtectionStore()),
        Bind.lazySingleton((i) => DataBlockingProtectionStore()),
        Bind.lazySingleton((i) => TransferProtectionStore()),
        Bind.singleton((i) => TrackingProtectionController(store: i())),
        Bind.singleton((i) => AlarmProtectionController(store: i())),
        Bind.singleton((i) => AntiTheftCameraProtectionController(store: i())),
        Bind.singleton((i) => DataBlockingProtectionController(store: i())),
        Bind.singleton((i) => TransferProtectionController(store: i())),
        Bind.singleton(
          (i) => ProtectionProgressController(
            progressStore: i(),
            trackingProtectionStore: i(),
            alarmProtectionStore: i(),
            antitheftCameraProtectionStore: i(),
            dataBlockingProtectionStore: i(),
            transferProtectionStore: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
