import 'package:meta/meta.dart';

@immutable
class Item {
  final String itemID;
  final String name;
  final int quantity;
  final double pricePerUnit;
  final String currency;
  final String imageURL;

  const Item({
    required this.itemID,
    required this.name,
    required this.quantity,
    required this.pricePerUnit,
    required this.currency,
    required this.imageURL,
  });

  Item copyWith({
    String? itemID,
    String? name,
    int? quantity,
    double? pricePerUnit,
    String? currency,
    String? imageURL,
  }) {
    return Item(
      itemID: itemID ?? this.itemID,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      pricePerUnit: pricePerUnit ?? this.pricePerUnit,
      currency: currency ?? this.currency,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          runtimeType == other.runtimeType &&
          itemID == other.itemID &&
          name == other.name &&
          quantity == other.quantity &&
          pricePerUnit == other.pricePerUnit &&
          currency == other.currency &&
          imageURL == other.imageURL);

  @override
  int get hashCode =>
      itemID.hashCode ^
      name.hashCode ^
      quantity.hashCode ^
      pricePerUnit.hashCode ^
      currency.hashCode ^
      imageURL.hashCode;

  @override
  String toString() {
    return 'Item{ itemID: $itemID, name: $name, quantity: $quantity, pricePerUnit: $pricePerUnit, currency: $currency, imageURL: $imageURL,}';
  }
}
