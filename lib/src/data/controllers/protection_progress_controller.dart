import 'package:atomic_state2/src/data/stores/protection_progress_store.dart';
import 'package:atomic_state2/src/data/stores/transfer_protection_store.dart';
import 'package:atomic_state2/src/domain/protection.dart';
import 'package:atomic_state2/src/domain/protection_status.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/protection_progress.dart';
import '../stores/alarm_protection_store.dart';
import '../stores/antitheft_camera_protection_store.dart';
import '../stores/data_blocking_protection_store.dart';
import '../stores/tracking_protection_store.dart';

class ProtectionProgressController extends RxReducer {
  final ProtectionProgressStore progressStore;

  final TrackingProtectionStore trackingProtectionStore;
  final AlarmProtectionStore alarmProtectionStore;
  final AntiTheftCameraProtectionStore antitheftCameraProtectionStore;
  final DataBlockingProtectionStore dataBlockingProtectionStore;
  final TransferProtectionStore transferProtectionStore;

  ProtectionProgressController({
    required this.progressStore,
    required this.trackingProtectionStore,
    required this.alarmProtectionStore,
    required this.antitheftCameraProtectionStore,
    required this.dataBlockingProtectionStore,
    required this.transferProtectionStore,
  }) {
    on(
      () => [
        trackingProtectionStore.state,
        antitheftCameraProtectionStore.state,
        alarmProtectionStore.state,
        dataBlockingProtectionStore.state,
        transferProtectionStore.state,
      ],
      _updateProtectionProgress,
    );
  }

  List<Protection> get protections => [
        trackingProtectionStore.state,
        antitheftCameraProtectionStore.state,
        alarmProtectionStore.state,
        dataBlockingProtectionStore.state,
        transferProtectionStore.state,
      ];

  void _updateProtectionProgress() {
    final progress = protections
        .fold<double>(0, _sumProtectionWeights)
        .clamp(0, 1)
        .toDouble();

    final hasInactiveProtection =
        protections.any((element) => element.isInactive);

    final progressStatus = hasInactiveProtection
        ? ProtectionStatus.inactive
        : ProtectionStatus.active;

    if (hasInactiveProtection) {
      progressStore.setProgress(
        ProtectionProgress(progress: 1, status: progressStatus),
      );
      return;
    }

    progressStore.setProgress(
      ProtectionProgress(progress: progress, status: progressStatus),
    );
  }

  double _sumProtectionWeights(double accumulate, Protection protection) {
    if (protection.status != ProtectionStatus.active) {
      return accumulate;
    }

    return accumulate + protection.tier.protectionWeight;
  }
}
