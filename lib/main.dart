import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/app_config.dart';
import 'routes.dart';
import 'set_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setUpGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DCA App',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppConfigService.navigatorKey,
      initialRoute: "splash_screen",
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
