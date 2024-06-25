import 'package:naroutoshop/features/admin/add_categories/data/models/create_category_request.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/update_category_request.dart';

class AllCategoriesAdminQueries {
  factory AllCategoriesAdminQueries() {
    return _instance;
  }
  const AllCategoriesAdminQueries._();
  static const AllCategoriesAdminQueries _instance =
      AllCategoriesAdminQueries._();
  Map<String, dynamic> getAllCategoriesMapQuery() {
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

  Map<String, dynamic> createCategory({
    required CreateCategoryRequestBody body,
  }) {
    return {
      'query': r'''
mutation addCategory($name: String!, $image: String!) {
	addCategory(
		data: { name: $name, image: $image }
	) {
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

  Map<String, dynamic> deleteCategory({
    required String id,
  }) {
    return {
      'query': r'''
mutation  deleteCategory($id: ID!) {
  deleteCategory(id: $id) 
} ''',
      'variables': {
        'id': id,
      },
    };
  }

  Map<String, dynamic> updateCategory({
    required UpdateCategoryRequestBody body,
  }) {
    return {
      'query': r'''
mutation  updateCategory($id: ID!, $name: String!, $image: String!) {
  updateCategory(id: $id, changes: {  name: $name,image:$image }) {
		id

	}
} ''',
      'variables': {
        'id': body.id,
        'name': body.name,
        'image': body.image,
      },
    };
  }
}
