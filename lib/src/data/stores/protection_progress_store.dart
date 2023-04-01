import 'package:atomic_state2/src/domain/protection_progress.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ProtectionProgressStore extends Store<ProtectionProgress> {
  ProtectionProgressStore() : super(ProtectionProgress.initial());

  void setProgress(ProtectionProgress progress) {
    update(progress);
  }
}
