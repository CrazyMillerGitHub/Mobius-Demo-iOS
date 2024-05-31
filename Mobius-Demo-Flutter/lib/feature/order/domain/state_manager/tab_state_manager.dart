import 'package:flutter/foundation.dart';

enum OrderTab {
  market,
  restaurant;

  String get label {
    switch (this) {
      case OrderTab.market:
        return 'Маркет';
      case OrderTab.restaurant:
        return 'Магазины и рестораны';
    }
  }
}

class OrderTabStateManager extends ChangeNotifier {
  OrderTab _state;

  @protected
  set state(OrderTab value) {
    _state = value;
    notifyListeners();
  }

  OrderTab get state => _state;

  OrderTabStateManager({
    OrderTab initialState = OrderTab.market,
  }) : _state = initialState;

  void setActiveTab(OrderTab value) {
    state = value;
  }
}
