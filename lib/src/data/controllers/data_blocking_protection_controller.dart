import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/protection.dart';
import '../stores/data_blocking_protection_store.dart';

class DataBlockingProtectionController extends RxReducer {
  final DataBlockingProtectionStore store;
  DataBlockingProtectionController({required this.store}) {
    on(() => [store.activate], activateProtection);
    on(() => [store.deactivate], deactivateProtection);
  }

  void activateProtection() {
    store.setProtection(DataBlockingProtection.active());
  }

  void deactivateProtection() {
    store.setProtection(DataBlockingProtection.inactive());
  }
}
