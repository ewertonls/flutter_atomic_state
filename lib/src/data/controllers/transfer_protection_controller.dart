import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/protection.dart';
import '../stores/transfer_protection_store.dart';

class TransferProtectionController extends RxReducer {
  final TransferProtectionStore store;
  TransferProtectionController({required this.store}) {
    on(() => [store.activate], activateProtection);
    on(() => [store.deactivate], deactivateProtection);
  }

  void activateProtection() {
    store.setProtection(TransferProtection.active());
  }

  void deactivateProtection() {
    store.setProtection(TransferProtection.inactive());
  }
}
