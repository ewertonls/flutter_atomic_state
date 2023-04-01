import 'package:atomic_state2/src/domain/protection_status.dart';
import 'package:atomic_state2/src/domain/protection_tier.dart';
import 'package:flutter/material.dart';

class ProtectionCard extends StatelessWidget {
  const ProtectionCard({
    super.key,
    required this.status,
    required this.title,
    required this.tier,
    this.onTap,
    this.deactivate,
  });

  final ProtectionStatus status;
  final String title;
  final ProtectionTier tier;
  final void Function()? onTap;
  final void Function()? deactivate;

  IconData get statusIcon {
    switch (status) {
      case ProtectionStatus.initial:
        return Icons.add;
      case ProtectionStatus.active:
        return Icons.check;
      case ProtectionStatus.inactive:
        return Icons.warning;
    }
  }

  String get tierName {
    switch (tier) {
      case ProtectionTier.free:
        return 'Free';
      case ProtectionTier.premium:
        return 'Premium';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      tierName,
                      style: textTheme.labelSmall,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Icon(statusIcon),
                  IconButton(
                    onPressed:
                        status == ProtectionStatus.active ? deactivate : null,
                    icon: Icon(
                      Icons.power_settings_new,
                      color: status == ProtectionStatus.inactive
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
