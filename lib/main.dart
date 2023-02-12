import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voicegpt/app/routes/app.routes.dart';
import 'app/provider/app.provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: const Lava(),
    );
  }
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoiceGPT',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRoute,
      theme: ThemeData(
        fontFamily: 'roboto',
      ),
      routes: AppRoutes.routes,
    );
  }
}
