class AllProductsAdminQueries {
  factory AllProductsAdminQueries() {
    return _instance;
  }
  const AllProductsAdminQueries._();
  static const AllProductsAdminQueries _instance =
      AllProductsAdminQueries._();
  Map<String, dynamic> getAllProductsMapQuery() {
    return {
      'query': '''
 {
   products{
 		id
     title
     price
 		images
    description
 		category {
 			id
 			name
 		}
   }
 }
       ''',
    };
  }
}
