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

  Map<String, dynamic> deleteUser({
    required String userId,
  }) {
    
    return {
      'query': r'''
             mutation DeleteUser($id: ID!) {
	deleteUser(id: $id)
} ''',
      'variables': {
        'id': userId,
      },
    };
  }
}
