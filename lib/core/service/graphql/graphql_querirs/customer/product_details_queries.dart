class ProductDetailsQueries {
  factory ProductDetailsQueries() => _instance;
  const ProductDetailsQueries._();
  static const ProductDetailsQueries _instance = ProductDetailsQueries._();

  // get all product banners
  Map<String, dynamic> getProductDetailsMapQuery({required int productId}) {
    return {
      'query': '''
        	{
	product(id: $productId) {
		title
		price
		images
        description
	}
}
      ''',
    };
  }
}
