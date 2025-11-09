class Product {
  final int id;
  final String name;
  final int price;

  Product({required this.id, required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    price: json['price'],
  );
}

Future<List<Product>> loadProducts() async {
  final data = await rootBundle.loadString('assets/data/products.json');
  final List<dynamic> jsonList = jsonDecode(data);
  return jsonList.map((item) => Product.fromJson(item)).tolist();
}

FutureBuilder<List<Product>>(
  future: loadProducts(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error');
    } else {
      final products = snapshot.data!;
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtile: Text('Rp ${product.price}'),
          );
        },
      );
    }
  },
)