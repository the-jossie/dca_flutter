import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../config/app_config.dart';
import '../../../formatters/string.dart';
import '../../../formatters/num.dart';
import '../../../view_models/dashboard/transactions/plan_transactions_view_model.dart';
import '../../../widgets/error_widget.dart' as dca_error_widget;
import '../../../widgets/loading_widget.dart';
import '../../../widgets/suspense.dart';
import '../../../widgets/ternary_container.dart';
import '../../../widgets/transaction_info.dart';
import '../../../widgets/transaction_status.dart';

class PlanTransactions extends StatelessWidget {
  const PlanTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfigService.hexToColor("#f8f9f9"),
      appBar: AppBar(),
      body: ViewModelBuilder<TransactionViewModel>.reactive(
        viewModelBuilder: () => TransactionViewModel(),
        onModelReady: (viewModel) {
          final parsedData = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          viewModel.assignArguments(parsedData);
          viewModel.fetchTransactions();
        },
        builder: (context, viewModel, child) => Suspense(
          appState: viewModel.appState,
          loadingWidget: const LoadingWidget(),
          errorWidget: dca_error_widget.ErrorWidget(
            message: "Omo, something happ[ened kindly click the refesh button.",
            reload: () => viewModel.fetchTransactions(),
          ),
          successWidget: (context) => DCATernary(
            condition: viewModel.transaction.isEmpty,
            trueWidget: const Center(
              child: Text("No transactions."),
            ),
            falseWidget: ListView.builder(
              itemCount: viewModel.transaction.length,
              itemBuilder: (context, index) {
                final transaction = viewModel.transaction[index];
                return InkWell(
                  onTap: () => AppConfigService.bottomSheet(
                    Container(
                      height: 71.h,
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 20,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          TransactionInfo(
                            widgetKey: const Text(
                              "Name:",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            value: Text(viewModel.planName),
                          ),
                          const Divider(),
                          TransactionInfo(
                            widgetKey: const Text(
                              "Asset:",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            value: Text(transaction.receive.unit),
                          ),
                          const Divider(),
                          TransactionInfo(
                            widgetKey: const Text(
                              "Amount:",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            value: Text(
                                '${transaction.total.unit.toUpperCase()} ${double.parse(transaction.total.amount).toStringAsFixed(3)}'),
                          ),
                          const Divider(),
                          TransactionInfo(
                            widgetKey: const Text(
                              "Received:",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            value: Text(
                                "${double.parse(transaction.receive.amount).toStringAsFixed(10)} ${transaction.receive.unit}"),
                          ),
                          const Divider(),
                          TransactionInfo(
                            widgetKey: const Text(
                              "Fee",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            value: Text(
                                "${double.parse(transaction.fee.amount).toStringAsFixed(10)} ${transaction.fee.unit}"),
                          ),
                          const Divider(),
                          TransactionInfo(
                            widgetKey: const Text(
                              "Status:",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            value: TransactionStatusText(
                              status: transaction.status,
                              title: transaction.status,
                            ),
                          ),
                          const Divider(),
                          TransactionInfo(
                            widgetKey: const Text(
                              "Creation Date:",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            value: Text(transaction.createdAt
                                .turnStringToDate("dd MMM yyyy.")),
                          ),
                        ],
                      ),
                    ),
                    true,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        TransactionStatus(
                          status: transaction.status,
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
                                            '${transaction.total.unit.toUpperCase()} ${double.parse(transaction.total.amount).toStringAsFixed(3)}',
                                      ),
                                      const TextSpan(
                                        text: ' - ',
                                      ),
                                      TextSpan(
                                        text: transaction.status,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(double.parse(transaction.receive.amount)
                                .toStringAsFixed(10))
                          ],
                        ),
                        const Spacer(),
                        Text(transaction.createdAt
                            .turnStringToDate("dd, MMM, yyyy."))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
