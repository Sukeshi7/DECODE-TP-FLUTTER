class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String picture;
  final DateTime? createdAt;
  final String? userId;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.picture,
    this.createdAt,
    this.userId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price'].toString()),      picture: json['picture'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
