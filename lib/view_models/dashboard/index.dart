import 'package:stacked/stacked.dart';

import '../../services/market_service.dart';
import '../../set_up.dart';
import '../../utils/storage.dart';

class DashboardViewModel extends BaseViewModel {
  final MarketService _market = locator<MarketService>();

  final Storage _storage = locator<Storage>();

  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  Future<void> fetchAllMarkets() async {
    final response = await _market.fetchMarkets();

    await _storage.setString("markets", response.body);
  }

  void changeTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }
}
