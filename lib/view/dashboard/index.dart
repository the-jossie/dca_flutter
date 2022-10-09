import 'package:dca_flutter/view/dashboard/plans/index.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../view_models/dashboard/index.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (viewModel) => viewModel.fetchAllMarkets(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(),
        body: IndexedStack(
          index: viewModel.currentTabIndex,
          children: const [
            PlansView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueAccent,
          onTap: (index) => viewModel.changeTabIndex(index),
          selectedItemColor: Colors.black87,
          type: BottomNavigationBarType.shifting,
          currentIndex: viewModel.currentTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: "Plans",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_activity), label: "Transactions")
          ],
        ),
      ),
    );
  }
}
