import '../entity/entity.dart';

abstract interface class OrderRepository {
  Future<List<MarketOrder>> readMarketOrders();
  Future<List<RestaurantOrder>> readRestaurantOrders();
}
