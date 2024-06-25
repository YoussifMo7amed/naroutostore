import 'package:naroutoshop/features/admin/add_products/data/model/create_product_request_body.dart';

class AllProductsAdminQueries {
  factory AllProductsAdminQueries() {
    return _instance;
  }
  const AllProductsAdminQueries._();
  static const AllProductsAdminQueries _instance = AllProductsAdminQueries._();
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

  Map<String, dynamic> createProductMapQuery(
      {required CreateProdutRequestBody body}) {
    return {
      'query': r'''
 mutation CreateProduct($title:String!,$price:Float!,$description:String!,$categoryId:ID!,$images:[String!]!) {
	addProduct(
		data: {
			title: $title
			price: $price
			description: $description
			categoryId: $categoryId
			images: $images
		}
	) {
		title
	}
}
       ''',
     'variables': {
        'title': body.title,
        'price': body.price,
        'description': body.description,
        'categoryId': body.categoryId,
        'images': body.images,
      },
    };
  }
}
