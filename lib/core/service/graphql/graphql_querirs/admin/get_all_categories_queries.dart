class GetAllCategoriesQueries {
  factory GetAllCategoriesQueries() {
    return _instance;
  }
  const GetAllCategoriesQueries._();
  static const GetAllCategoriesQueries _instance = GetAllCategoriesQueries._();
  Map<String, dynamic> GetAllCategoriesCategoriesMapQuery() {
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
}
