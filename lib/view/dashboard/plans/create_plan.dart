import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../../../config/app_config.dart';
import '../../../config/app_state.dart';
import '../../../formatters/num.dart';
import '../../../view_models/dashboard/plans/create_plan_view_model.dart';
import '../../../widgets/button.dart';
import '../../../widgets/input.dart';
import '../../../widgets/ternary_container.dart';

class CreatePlanView extends StatelessWidget {
  const CreatePlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ViewModelBuilder<CreatePlanViewModel>.reactive(
        viewModelBuilder: () => CreatePlanViewModel(),
        onModelReady: (viewModel) => viewModel.initMarkets(),
        builder: (context, viewModel, child) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                DCATextFormField(
                  title: 'Plan Name',
                  textEditingController: viewModel.planNameTextController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter Plan name.';
                    }
                    return null;
                  },
                ),
                InkWell(
                  onTap: () {
                    AppConfigService.bottomSheet(
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: viewModel.markets
                              .map(
                                (e) => ScheduleContainer(
                                  title: e.name,
                                  onClick: () =>
                                      viewModel.onClickMarket(e.name),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      false,
                    );
                  },
                  child: IgnorePointer(
                    child: DCATextFormField(
                      title: 'Market',
                      labelText: 'Select',
                      textEditingController: viewModel.marketTextController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Market name.';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                DCATextFormField(
                  title: 'Amount',
                  textEditingController: viewModel.amountTextController,
                  textInputType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter Plan name.';
                    }
                    return null;
                  },
                ),
                InkWell(
                  onTap: () {
                    AppConfigService.bottomSheet(
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: viewModel.schedule
                              .map(
                                (e) => ScheduleContainer(
                                  title: e,
                                  onClick: () => viewModel.onSchedule(e),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      false,
                    );
                  },
                  child: IgnorePointer(
                    child: DCATextFormField(
                      title: 'Schedule',
                      labelText: 'Select',
                      textEditingController: viewModel.scheduleTextController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Schedule name.';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const Spacer(),
                DCAButton(
                  onPressed: () => viewModel.createPlan(),
                  color: AppConfigService.hexToColor("#ffb300").withOpacity(
                    viewModel.appState == AppState.loading ? 0.5 : 1,
                  ),
                  child: DCATernary(
                    condition: viewModel.appState == AppState.loading,
                    trueWidget: const CircularProgressIndicator.adaptive(),
                    falseWidget: const Text(
                      "Create Plan",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScheduleContainer extends StatelessWidget {
  final String title;
  final Function onClick;
  const ScheduleContainer({
    Key? key,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      ),
    );
  }
}
