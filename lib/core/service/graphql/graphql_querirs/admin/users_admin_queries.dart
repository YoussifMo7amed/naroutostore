class UsersAdminQueries {
  factory UsersAdminQueries() {
    return _instance;
  }
  const UsersAdminQueries._();
  static const UsersAdminQueries _instance = UsersAdminQueries._();
  Map<String, dynamic> getAllUsersMapQuery() {
    return {
      'query': '''
 {
        users{
		      id
		      name
		      email
  }
 }
       ''',
    };
  }
}
