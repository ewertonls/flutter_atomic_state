import 'package:flutter_triple/flutter_triple.dart';
import '../../domain/protection.dart';

class AlarmProtectionStore extends Store<AlarmProtection> {
  AlarmProtectionStore() : super(AlarmProtection.initial());

  void setProtection(AlarmProtection protection) {
    update(protection);
  }

  final activate = RxNotifier(null);
  final deactivate = RxNotifier(null);
}
