import 'package:meta/meta.dart';

import '../../domain/entity/entity.dart';

@immutable
class ItemModel extends Item {
  const ItemModel({
    required super.itemID,
    required super.name,
    required super.quantity,
    required super.pricePerUnit,
    required super.currency,
    required super.imageURL,
  });

  factory ItemModel.fromMap(Map<String, Object?> map) {
    return ItemModel(
      itemID: map['item_id'] as String,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      pricePerUnit: (map['price_per_unit'] as num).toDouble(),
      currency: map['currency'] as String,
      imageURL: map['image_url'] as String,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'item_id': itemID,
      'name': name,
      'quantity': quantity,
      'price_per_unit': pricePerUnit,
      'currency': currency,
      'image_url': imageURL,
    };
  }
}
