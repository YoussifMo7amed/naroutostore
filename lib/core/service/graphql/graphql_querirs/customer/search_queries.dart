import 'package:naroutoshop/features/customers/search/data/models/search_request_body.dart';

class SearchQueries {
  factory SearchQueries() => _instance;
  const SearchQueries._();
  static const SearchQueries _instance = SearchQueries._();

  // get all product banners
  Map<String, dynamic> getSearchQueriesMapQuery({required SearchRequestBody body}) {
    return {
      'query': '''
        	{
	  products(price_min: ${body.price_min}, price_max: ${body.price_max},title: "${body.searchName}") {
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
