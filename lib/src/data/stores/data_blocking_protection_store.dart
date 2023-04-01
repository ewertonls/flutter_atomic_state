import 'package:flutter_triple/flutter_triple.dart';
import '../../domain/protection.dart';

class DataBlockingProtectionStore extends Store<DataBlockingProtection> {
  DataBlockingProtectionStore() : super(DataBlockingProtection.initial());

  void setProtection(DataBlockingProtection protection) {
    update(protection);
  }

  final activate = RxNotifier(null);
  final deactivate = RxNotifier(null);
}
