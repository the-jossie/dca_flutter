import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/size_config.dart';
import '../extension/num.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        alignment: Alignment.center,
        color: AppConfigService.hexToColor("#ffb300"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            Text("DCA APP"),
            Spacer(),
            Text("Proudly powered by quidax."),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
