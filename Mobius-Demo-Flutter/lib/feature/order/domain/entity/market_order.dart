import 'package:meta/meta.dart';

import 'item.dart';

@immutable
class MarketOrder {
  final String orderID;
  final String deliveryDate;
  final List<Item> items;
  final double totalPrice;
  final String currency;
  final String currentStatus;

  const MarketOrder({
    required this.orderID,
    required this.deliveryDate,
    required this.items,
    required this.totalPrice,
    required this.currency,
    required this.currentStatus,
  });

  MarketOrder copyWith({
    String? orderID,
    String? deliveryDate,
    List<Item>? items,
    double? totalPrice,
    String? currency,
    String? currentStatus,
  }) {
    return MarketOrder(
      orderID: orderID ?? this.orderID,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      currency: currency ?? this.currency,
      currentStatus: currentStatus ?? this.currentStatus,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MarketOrder &&
          runtimeType == other.runtimeType &&
          orderID == other.orderID &&
          deliveryDate == other.deliveryDate &&
          items == other.items &&
          totalPrice == other.totalPrice &&
          currency == other.currency &&
          currentStatus == other.currentStatus);

  @override
  int get hashCode =>
      orderID.hashCode ^
      deliveryDate.hashCode ^
      items.hashCode ^
      totalPrice.hashCode ^
      currency.hashCode ^
      currentStatus.hashCode;

  @override
  String toString() {
    return 'MarketOrder{ orderID: $orderID, deliveryDate: $deliveryDate, items: $items, totalPrice: $totalPrice, currency: $currency, currentStatus: $currentStatus,}';
  }
}
