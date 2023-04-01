import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/protection.dart';
import '../stores/tracking_protection_store.dart';

class TrackingProtectionController extends RxReducer {
  final TrackingProtectionStore store;
  TrackingProtectionController({required this.store}) {
    on(() => [store.activate], activateProtection);
    on(() => [store.deactivate], deactivateProtection);
  }

  void activateProtection() {
    store.setProtection(TrackingProtection.active());
  }

  void deactivateProtection() {
    store.setProtection(TrackingProtection.inactive());
  }
}
