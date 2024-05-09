class AdminQueries{
 factory AdminQueries(){
  return _instance;
 }
 const AdminQueries._();
 static const AdminQueries _instance =AdminQueries._();
 Map<String,dynamic> numberOfCategoriesMapQuery(){
  return {
    'query':'''
{
  categories{
		name
  }
}
       ''',
  };
 }
 Map<String,dynamic> numberOfproductMapQuery(){
  return {
    'query':'''
{
  products{
		title
  }
}
       ''',
  };
 } Map<String,dynamic> numberOfUsersMapQuery(){
  return {
    'query':'''
{
  users{
		name
  }
}
       '''
  };
 }
}
