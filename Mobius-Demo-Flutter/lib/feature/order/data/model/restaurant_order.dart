import 'package:meta/meta.dart';

import '../../domain/entity/entity.dart';
import 'item.dart';

@immutable
class RestaurantOrderModel extends RestaurantOrder {
  const RestaurantOrderModel({
    required super.orderID,
    required super.deliveryDate,
    required super.source,
    required super.items,
    required super.totalPrice,
    required super.currency,
    required super.currentStatus,
  });

  factory RestaurantOrderModel.fromMap(Map<String, Object?> map) {
    return RestaurantOrderModel(
      orderID: map['order_id'] as String,
      deliveryDate: map['delivery_date'] as String,
      source: map['source'] as String,
      items: (map['items'] as List<Object?>)
          .map((value) => ItemModel.fromMap(value as Map<String, Object?>))
          .toList(),
      totalPrice: (map['total_price'] as num).toDouble(),
      currency: map['currency'] as String,
      currentStatus: map['current_status'] as String,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'order_id': orderID,
      'delivery_date': deliveryDate,
      'source': source,
      'items': items,
      'total_price': totalPrice,
      'currency': currency,
      'current_status': currentStatus,
    };
  }
}
