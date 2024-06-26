import 'package:naroutoshop/features/admin/add_products/data/model/create_product_request_body.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/update_product_request_body.dart';

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
 mutation CreateProduct($title:String!,$price:Float!,$description:String!,$categoryId:Float!,$images:[String!]!) {
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

  Map<String, dynamic> deleteProduct({
    required String productid,
  }) {
    return {
      'query': r'''
mutation  deleteProduct($id: ID!) {
  deleteProduct(id: $id) 
} ''',
      'variables': {
        'id': productid,
      },
    };
  }

  Map<String, dynamic> updateProduct({
    required UpdateProductRequestBody body,
  }) {
    return {
      'query': r'''
mutation  updateProduct($id: ID!, $title: String!, $images: [String!]!,$description:String!,$price:Float!,$categoryId:Float!) {
  updateCategory(id: $id, 
  changes: {  
      	title: $title
   			categoryId: $categoryId
        images: $images
        description: $description
      	price: $price  
   }) {
		title
	}
} ''',
      'variables': {
        'id': body.productId,
        'title': body.title,
        'categoryId': body.categoryId,
        'images': body.imageList,
        'description': body.description,
        'price': body.price,
      },
    };
  }
}
