import 'package:naroutoshop/features/customers/search/data/models/search_request_body.dart';

class SearchQueries {
  factory SearchQueries() => _instance;
  const SearchQueries._();
  static const SearchQueries _instance = SearchQueries._();

  // get all product banners
  Map<String, dynamic> getSearchQueriesMapQuery(
      {required SearchRequestBody body}) {
    return {
      'query': r'''
        	
           query SearchProducts($searchName: String , $priceMax: Int , $priceMin: Int) {
               products(title: $searchName, price_max: $priceMax, price_min:$priceMin) {
                   id
                   title
                   price
                   images
                   description
                   category{
                         name
                         id
                     }
              }
           
}
      ''',
      'variables': {
        'priceMin': body.price_min,
        'priceMax': body.price_max,
        'searchName': body.searchName,
      },
    };
  }
}
