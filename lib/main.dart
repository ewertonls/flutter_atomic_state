import 'package:atomic_state2/src/app_module.dart';
import 'package:atomic_state2/src/data/stores/tracking_protection_store.dart';
import 'package:atomic_state2/src/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RxRoot(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Atomic State PoC',
        theme: ThemeData.light(useMaterial3: true),
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}
