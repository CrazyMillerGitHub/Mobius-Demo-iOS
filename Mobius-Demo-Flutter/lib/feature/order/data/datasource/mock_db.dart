import 'dart:convert' as convert;

import 'package:flutter/services.dart' show rootBundle;
import 'package:meta/meta.dart';

import '../model/model.dart';

abstract interface class OrderDB {
  Future<List<MarketOrderModel>> readAllMarketOrders();
  Future<List<RestaurantOrderModel>> readAllRestaurantOrders();
}

@immutable
final class MockOrderDB implements OrderDB {
  const MockOrderDB();

  static const String marketJSON = 'market_response.json';
  static const String restaurantsJSON = 'restaurants_response.json';

  @override
  Future<List<MarketOrderModel>> readAllMarketOrders() async {
    final json = await _loadAsset(marketJSON);
    return json.map(MarketOrderModel.fromMap).toList();
  }

  @override
  Future<List<RestaurantOrderModel>> readAllRestaurantOrders() async {
    final json = await _loadAsset(restaurantsJSON);
    return json.map(RestaurantOrderModel.fromMap).toList();
  }

  Future<Iterable<Map<String, Object?>>> _loadAsset(String name) async {
    await Future.delayed(const Duration(seconds: 1));
    final value = await rootBundle.loadString('assets/$name');
    final json = convert.jsonDecode(value);
    final list = json['orders'] as List<Object?>;

    return list.whereType<Map<String, Object?>>();
  }
}
