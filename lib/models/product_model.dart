class Product {
  final String title;
  final String attributeName;
  final List<String> attributeValues;
  final String imageUrl;
  final String stockStatus;
  final double price;
  final int taxStatus;
  final String productCategory;

  Product({
    required this.title,
    required this.attributeName,
    required this.attributeValues,
    required this.imageUrl,
    required this.stockStatus,
    required this.price,
    required this.taxStatus,
    required this.productCategory,
  });
}
