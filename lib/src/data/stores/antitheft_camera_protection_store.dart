import 'package:flutter_triple/flutter_triple.dart';
import '../../domain/protection.dart';

class AntiTheftCameraProtectionStore extends Store<AntiTheftCameraProtection> {
  AntiTheftCameraProtectionStore() : super(AntiTheftCameraProtection.initial());

  void setProtection(AntiTheftCameraProtection protection) {
    update(protection);
  }

  final activate = RxNotifier(null);
  final deactivate = RxNotifier(null);
}
