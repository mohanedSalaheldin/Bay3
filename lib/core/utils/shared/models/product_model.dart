class ProductModel {
  final int id;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: json['price'].ceil(),
      oldPrice: json['old_price']?.ceil() ?? 0,
      discount: json['discount']?.ceil() ?? 0,
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: json['images'].cast<String>(),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
