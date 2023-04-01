import 'package:flutter_triple/flutter_triple.dart';
import '../../domain/protection.dart';

class TrackingProtectionStore extends Store<TrackingProtection> {
  TrackingProtectionStore() : super(TrackingProtection.initial());

  void setProtection(TrackingProtection protection) {
    update(protection);
  }

  final activate = RxNotifier(null);
  final deactivate = RxNotifier(null);
}
