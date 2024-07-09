class CategoryQueries {
  factory CategoryQueries() => _instance;
  const CategoryQueries._();
  static const CategoryQueries _instance = CategoryQueries._();

  // get all product banners
  Map<String, dynamic> getCategoryQueriesMapQuery({required int categoryId}) {
    return {
      'query': '''
        	{
	  products(categoryId: $categoryId) {
              id
              title
              price
              images
              description
              category{
                    id
                    name
                }
          }
}
      ''',
    };
  }
}
