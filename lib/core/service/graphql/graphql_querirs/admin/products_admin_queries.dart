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
 // Delete Product
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
//  //Update Product
  Map<String, dynamic> updateProduct({
    required UpdateProductRequestBody body,
  }) {
    return {
      'query': r'''
            mutation UpdateProduct($productId: ID!, $title: String!,$description: String!,$imageList:[String!]!,$price: Float!,$categoryId: Float! ) {
          updateProduct(id: $productId, 
          changes: { 
            title: $title,
            categoryId: $categoryId,
            images:$imageList,
            description: $description,
            price:$price
            }) {
            title
          }
        }
        ''',
      'variables': {
        'productId': body.productId,
        'title': body.title,
        'description': body.description,
        'imageList': body.imageList,
        'categoryId': body.categoryId,
        'price': body.price,
      },
    };
  }

}
