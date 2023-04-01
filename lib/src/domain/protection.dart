import 'package:atomic_state2/src/domain/protection_status.dart';
import 'package:atomic_state2/src/domain/protection_tier.dart';

abstract class Protection {
  const Protection();
  ProtectionStatus get status;
  ProtectionTier get tier;
  bool get isInactive;
}

class TrackingProtection implements Protection {
  @override
  final ProtectionStatus status;

  @override
  final ProtectionTier tier = ProtectionTier.free;

  @override
  bool get isInactive => status == ProtectionStatus.inactive;

  const TrackingProtection({required this.status});

  factory TrackingProtection.initial() {
    return const TrackingProtection(status: ProtectionStatus.initial);
  }
  factory TrackingProtection.active() {
    return const TrackingProtection(status: ProtectionStatus.active);
  }
  factory TrackingProtection.inactive() {
    return const TrackingProtection(status: ProtectionStatus.inactive);
  }
}

class AntiTheftCameraProtection implements Protection {
  @override
  final ProtectionStatus status;

  @override
  final ProtectionTier tier = ProtectionTier.free;

  @override
  bool get isInactive => status == ProtectionStatus.inactive;

  const AntiTheftCameraProtection({required this.status});

  factory AntiTheftCameraProtection.initial() {
    return const AntiTheftCameraProtection(status: ProtectionStatus.initial);
  }
  factory AntiTheftCameraProtection.active() {
    return const AntiTheftCameraProtection(status: ProtectionStatus.active);
  }
  factory AntiTheftCameraProtection.inactive() {
    return const AntiTheftCameraProtection(status: ProtectionStatus.inactive);
  }
}

class AlarmProtection implements Protection {
  @override
  final ProtectionStatus status;

  @override
  final ProtectionTier tier = ProtectionTier.free;

  @override
  bool get isInactive => status == ProtectionStatus.inactive;

  const AlarmProtection({required this.status});

  factory AlarmProtection.initial() {
    return const AlarmProtection(status: ProtectionStatus.initial);
  }
  factory AlarmProtection.active() {
    return const AlarmProtection(status: ProtectionStatus.active);
  }
  factory AlarmProtection.inactive() {
    return const AlarmProtection(status: ProtectionStatus.inactive);
  }
}

class DataBlockingProtection implements Protection {
  @override
  final ProtectionStatus status;

  @override
  final ProtectionTier tier = ProtectionTier.premium;

  @override
  bool get isInactive => status == ProtectionStatus.inactive;

  const DataBlockingProtection({required this.status});

  factory DataBlockingProtection.initial() {
    return const DataBlockingProtection(status: ProtectionStatus.initial);
  }
  factory DataBlockingProtection.active() {
    return const DataBlockingProtection(status: ProtectionStatus.active);
  }
  factory DataBlockingProtection.inactive() {
    return const DataBlockingProtection(status: ProtectionStatus.inactive);
  }
}

class TransferProtection implements Protection {
  @override
  final ProtectionStatus status;

  @override
  final ProtectionTier tier = ProtectionTier.premium;

  @override
  bool get isInactive => status == ProtectionStatus.inactive;

  const TransferProtection({required this.status});

  factory TransferProtection.initial() {
    return const TransferProtection(status: ProtectionStatus.initial);
  }
  factory TransferProtection.active() {
    return const TransferProtection(status: ProtectionStatus.active);
  }
  factory TransferProtection.inactive() {
    return const TransferProtection(status: ProtectionStatus.inactive);
  }
}
