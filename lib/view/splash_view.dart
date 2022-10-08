import 'package:dca_flutter/view_models/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../config/app_config.dart';
import '../config/size_config.dart';
import '../formatters/num.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, viewModel, child) {
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
      },
    );
  }
}
