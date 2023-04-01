import 'package:flutter_triple/flutter_triple.dart';
import '../../domain/protection.dart';

class TransferProtectionStore extends Store<TransferProtection> {
  TransferProtectionStore() : super(TransferProtection.initial());

  void setProtection(TransferProtection protection) {
    update(protection);
  }

  final activate = RxNotifier(null);
  final deactivate = RxNotifier(null);
}
