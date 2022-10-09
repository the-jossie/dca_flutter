import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../formatters/num.dart';
import '../../../widgets/status_badge.dart';
import '../../../widgets/ternary_container.dart';
import '../../../config/app_config.dart';
import '../../../formatters/string.dart';
import '../../../view_models/dashboard/plans/index.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/error_widget.dart' as dca_error_widget;
import '../../../widgets/suspense.dart';

class PlansView extends StatelessWidget {
  const PlansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlansViewModel>.reactive(
      viewModelBuilder: () => PlansViewModel(),
      onModelReady: (model) => model.fetchAllPlans(),
      builder: (context, viewModel, child) => Suspense(
        appState: viewModel.appState,
        loadingWidget: const LoadingWidget(),
        errorWidget: dca_error_widget.ErrorWidget(
          message: "Omo, something happened, kindly click the refesh button.",
          reload: () => viewModel.fetchAllPlans(),
        ),
        successWidget: (context) => Stack(
          children: [
            DCATernary(
              condition: viewModel.plans.isNotEmpty,
              falseWidget: const Center(
                child: Text("No Plans"),
              ),
              trueWidget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: viewModel.plans.length,
                    itemBuilder: ((context, index) {
                      final plan = viewModel.plans[index];

                      return InkWell(
                        onTap: (() {}),
                        child: Row(
                          children: [
                            StatusBadge(
                              status: plan.isActive,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '${(plan.market.quoteUnit).toUpperCase()} ${plan.amount.toString()}',
                                          ),
                                          const TextSpan(
                                            text: ' - ',
                                          ),
                                          TextSpan(
                                            text: (plan.market.baseUnit)
                                                .toUpperCase(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(plan.name),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              plan.createdAt.turnStringToDate(
                                "dd, MMM, yyyy.",
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: InkWell(
                onTap: (() {}),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 7.h,
                  width: 6.7.h,
                  decoration: BoxDecoration(
                    color: AppConfigService.hexToColor("#ffb300"),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
