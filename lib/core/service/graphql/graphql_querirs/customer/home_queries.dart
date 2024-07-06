class HomeQueries {
  factory HomeQueries() => _instance;
  const HomeQueries._();
  static const HomeQueries _instance = HomeQueries._();

  // get all product banners
  Map<String, dynamic> getBannersMapQuery() {
    return {
      'query': '''
        query {

            products {
              title
              images
            }

        }
      ''',
    };
  }
}
