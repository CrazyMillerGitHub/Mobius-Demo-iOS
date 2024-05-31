import 'package:meta/meta.dart';
import 'package:mobius_demo_flutter/feature/order/data/datasource/datasource.dart';
import 'package:mobius_demo_flutter/feature/order/domain/repository/repository.dart';

import '../../domain/entity/entity.dart';

@immutable
final class OrderRepositoryImpl implements OrderRepository {
  final OrderDB _orderDB;

  const OrderRepositoryImpl({
    required OrderDB orderDB,
  }) : _orderDB = orderDB;

  @override
  Future<List<MarketOrder>> readMarketOrders() async {
    return _orderDB.readAllMarketOrders();
  }

  @override
  Future<List<RestaurantOrder>> readRestaurantOrders() async {
    return _orderDB.readAllRestaurantOrders();
  }
}
