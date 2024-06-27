part of '_index.dart';

class Product {
  final String id;
  final String name;
  final int quantity;
  final int price;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;
  Product({
    this.id = '',
    this.name = '',
    this.quantity = 0,
    this.price = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.imageUrl = '',
  });

  Product copyWith({
    String? id,
    String? name,
    int? quantity,
    int? price,
    String? createdAt,
    String? updatedAt,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'quantity': quantity});
    result.addAll({'price': price});
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});
    result.addAll({'image_url': imageUrl});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      imageUrl: map['image_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, quantity: $quantity, price: $price, createdAt: $createdAt, updatedAt: $updatedAt, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.quantity == quantity &&
        other.price == price &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        imageUrl.hashCode;
  }
}
