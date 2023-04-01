import 'protection_status.dart';

class ProtectionProgress {
  final double progress;
  final ProtectionStatus status;

  const ProtectionProgress({
    required this.progress,
    required this.status,
  });

  factory ProtectionProgress.initial() {
    return const ProtectionProgress(
      progress: 0,
      status: ProtectionStatus.initial,
    );
  }
}
