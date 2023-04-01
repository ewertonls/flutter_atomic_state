import 'package:atomic_state2/src/data/stores/alarm_protection_store.dart';
import 'package:atomic_state2/src/data/stores/transfer_protection_store.dart';
import 'package:atomic_state2/src/ui/widgets/protection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../data/stores/antitheft_camera_protection_store.dart';
import '../../data/stores/data_blocking_protection_store.dart';
import '../../data/stores/tracking_protection_store.dart';
import '../widgets/protection_progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _trackingStore = Modular.get<TrackingProtectionStore>();

  final _antitheftCameraStore = Modular.get<AntiTheftCameraProtectionStore>();

  final _alarmStore = Modular.get<AlarmProtectionStore>();

  final _dataBlockingStore = Modular.get<DataBlockingProtectionStore>();

  final _transferStore = Modular.get<TransferProtectionStore>();

  @override
  Widget build(BuildContext context) {
    final trackingProtection = context.select(() => _trackingStore.state);
    final antitheftCameraProtection =
        context.select(() => _antitheftCameraStore.state);
    final alarmProtection = context.select(() => _alarmStore.state);
    final dataBlockingProtection =
        context.select(() => _dataBlockingStore.state);
    final transferProtection = context.select(() => _transferStore.state);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ProtectionProgressCard(),
      ),
      body: ListView(
        children: [
          ProtectionCard(
            status: trackingProtection.status,
            title: 'Device Tracking',
            tier: trackingProtection.tier,
            onTap: _trackingStore.activate,
            deactivate: _trackingStore.deactivate,
          ),
          ProtectionCard(
            status: alarmProtection.status,
            title: 'Ring Alarm',
            tier: alarmProtection.tier,
            onTap: _alarmStore.activate,
            deactivate: _alarmStore.deactivate,
          ),
          ProtectionCard(
            status: antitheftCameraProtection.status,
            title: 'Anti-theft Camera',
            tier: antitheftCameraProtection.tier,
            onTap: _antitheftCameraStore.activate,
            deactivate: _antitheftCameraStore.deactivate,
          ),
          ProtectionCard(
            status: dataBlockingProtection.status,
            title: 'Data Blocking',
            tier: dataBlockingProtection.tier,
            onTap: _dataBlockingStore.activate,
            deactivate: _dataBlockingStore.deactivate,
          ),
          ProtectionCard(
            status: transferProtection.status,
            title: 'Transfer Protection',
            tier: transferProtection.tier,
            onTap: _transferStore.activate,
            deactivate: _transferStore.deactivate,
          ),
        ],
      ),
    );
  }
}
