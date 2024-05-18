import 'package:naroutoshop/features/admin/add_categories/data/models/create_category_request.dart';

class AllCategoriesAdminQueries {
  factory AllCategoriesAdminQueries() {
    return _instance;
  }
  const AllCategoriesAdminQueries._();
  static const AllCategoriesAdminQueries _instance = AllCategoriesAdminQueries._();
  Map<String, dynamic> getAllCategoriesCategoriesMapQuery() {
    return {
      'query': '''
{
  categories{
		id
		name
		image
  }
}
       ''',
    };
  }

  Map<String, dynamic> createCategory(
      {required CreateCategoryRequestBody body}) {
    return {
      'query': r'''
     mutation createcaegory($name: String!, $image: String!) {
	   createcaegory(email: $name, password: $image){
		id
		name
		image
	}
}''',
      'variables': {
        'name': body.name,
        'image': body.image,
      },
    };
  }
}
