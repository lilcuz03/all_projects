class DataModel {
  final int id;
  final String name;
  final String category;
  final int stock;
  final double price;
  final double rating;
  final bool onSale;
  final String imageUrl;

  DataModel({
    required this.price,
    required this.id,
    required this.name,
    required this.category,
    required this.stock,
    required this.rating,
    required this.onSale,
    required this.imageUrl,
  });
}
