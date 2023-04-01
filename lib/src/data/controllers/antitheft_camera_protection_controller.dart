import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/protection.dart';
import '../stores/antitheft_camera_protection_store.dart';

class AntiTheftCameraProtectionController extends RxReducer {
  final AntiTheftCameraProtectionStore store;
  AntiTheftCameraProtectionController({required this.store}) {
    on(() => [store.activate], activateProtection);
    on(() => [store.deactivate], deactivateProtection);
  }

  void activateProtection() {
    store.setProtection(AntiTheftCameraProtection.active());
  }

  void deactivateProtection() {
    store.setProtection(AntiTheftCameraProtection.inactive());
  }
}
