import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/protection.dart';
import '../stores/alarm_protection_store.dart';

class AlarmProtectionController extends RxReducer {
  final AlarmProtectionStore store;
  AlarmProtectionController({required this.store}) {
    on(() => [store.activate], activateProtection);
    on(() => [store.deactivate], deactivateProtection);
  }

  void activateProtection() {
    store.setProtection(AlarmProtection.active());
  }

  void deactivateProtection() {
    store.setProtection(AlarmProtection.inactive());
  }
}
