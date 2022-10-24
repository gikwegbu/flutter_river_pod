class Product {
  final String? id;
  final String? title;
  final String? description;
  final double? price;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
  });
}

final List<Product> productList = [
  Product(
    id: '1',
    title: 'Samsung s22',
    description: 'A smart device in the android family.',
    price: 1998,
  ),
  Product(
    id: '2',
    title: 'Iphone X',
    description: 'Just another apple device.',
    price: 5000,
  ),
  Product(
    id: '3',
    title: 'Toshiba',
    description: 'A Television',
    price: 3000,
  ),
];
