import 'dart:developer';

import 'package:atomic_state2/src/data/controllers/protection_progress_controller.dart';
import 'package:atomic_state2/src/data/stores/protection_progress_store.dart';
import 'package:atomic_state2/src/ui/widgets/protection_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ProtectionProgressCard extends StatefulWidget {
  ProtectionProgressCard({super.key});

  @override
  State<ProtectionProgressCard> createState() => _ProtectionProgressCardState();
}

class _ProtectionProgressCardState extends State<ProtectionProgressCard> {
  final _protectionProgressStore = Modular.get<ProtectionProgressStore>();
  @override
  Widget build(BuildContext context) {
    final protectionProgress =
        context.select(() => _protectionProgressStore.state);
    return ProtectionProgressIndicator(
      progress: protectionProgress.progress,
      protectionStatus: protectionProgress.status,
    );
  }
}
