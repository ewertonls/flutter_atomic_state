import 'package:flutter/material.dart';

import '../../domain/protection_status.dart';

class ProtectionProgressIndicator extends StatefulWidget {
  const ProtectionProgressIndicator({
    super.key,
    required this.progress,
    required this.protectionStatus,
  });

  final double progress;
  final ProtectionStatus protectionStatus;

  @override
  State<ProtectionProgressIndicator> createState() =>
      _ProtectionProgressIndicatorState();
}

class _ProtectionProgressIndicatorState
    extends State<ProtectionProgressIndicator> {
  String get progressText {
    if (widget.protectionStatus == ProtectionStatus.inactive) {
      return 'Unprotected';
    }

    final clampedProgress = widget.progress;

    final percentage = (clampedProgress * 100).round();
    return '$percentage% protected';
  }

  Color get progressColor {
    final colorScheme = Theme.of(context).colorScheme;
    if (widget.protectionStatus == ProtectionStatus.inactive) {
      return colorScheme.errorContainer;
    }
    return colorScheme.secondaryContainer;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return LayoutBuilder(builder: (context, constraints) {
      final availableWidth = constraints.maxWidth;
      final progressWidth = (availableWidth * widget.progress);
      return ClipPath(
        clipper: const ShapeBorderClipper(shape: StadiumBorder()),
        child: SizedBox(
          height: 40,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn,
                width: progressWidth,
                color: progressColor,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    progressText,
                    style: textTheme.labelMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
