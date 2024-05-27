import 'package:meta/meta.dart';

import 'item.dart';

@immutable
class RestaurantOrder {
  final String orderID;
  final String deliveryDate;
  final String source;
  final List<Item> items;
  final double totalPrice;
  final String currency;
  final String currentStatus;

  const RestaurantOrder({
    required this.orderID,
    required this.deliveryDate,
    required this.source,
    required this.items,
    required this.totalPrice,
    required this.currency,
    required this.currentStatus,
  });

  RestaurantOrder copyWith({
    String? orderID,
    String? deliveryDate,
    String? source,
    List<Item>? items,
    double? totalPrice,
    String? currency,
    String? currentStatus,
  }) {
    return RestaurantOrder(
      orderID: orderID ?? this.orderID,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      source: source ?? this.source,
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      currency: currency ?? this.currency,
      currentStatus: currentStatus ?? this.currentStatus,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RestaurantOrder &&
          runtimeType == other.runtimeType &&
          orderID == other.orderID &&
          deliveryDate == other.deliveryDate &&
          source == other.source &&
          items == other.items &&
          totalPrice == other.totalPrice &&
          currency == other.currency &&
          currentStatus == other.currentStatus);

  @override
  int get hashCode =>
      orderID.hashCode ^
      deliveryDate.hashCode ^
      source.hashCode ^
      items.hashCode ^
      totalPrice.hashCode ^
      currency.hashCode ^
      currentStatus.hashCode;

  @override
  String toString() {
    return 'RestaurantOrder{ orderID: $orderID, deliveryDate: $deliveryDate, source: $source, items: $items, totalPrice: $totalPrice, currency: $currency, currentStatus: $currentStatus,}';
  }
}
