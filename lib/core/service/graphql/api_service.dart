import 'package:dio/dio.dart';
import 'package:naroutoshop/core/apps/uploadimage/model/upload_image_responce.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/create_category_responce.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/admin/dashboard/data/models/categories_number_responce.dart';
import 'package:naroutoshop/features/admin/dashboard/data/models/products_number_responce.dart';
import 'package:naroutoshop/features/admin/dashboard/data/models/users_number_responce.dart';
import 'package:naroutoshop/features/admin/users/data/model/user_responce_model.dart';
import 'package:naroutoshop/features/auth/data/model/login_responce.dart';
import 'package:naroutoshop/features/auth/data/model/singup_responce.dart';
import 'package:naroutoshop/features/auth/data/model/user_role_responce.dart';
import 'package:naroutoshop/features/customers/home/data/models/banner_responce.dart';
import 'package:naroutoshop/features/customers/product_details/data/model/product_details_responce.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponce> login(
    @Body() Map<String, dynamic> mutation,
  );
  @GET('/api/v1/auth/profile')
  Future<UserRoleResponce> userRole();

  @POST('/api/v1/files/upload')
  Future<UploadImageResponce> uploadImage(
    @Body() FormData formData,
  );
  @POST(graphql)
  Future<SignUpResponce> signUp(
    @Body() Map<String, dynamic> mutation,
  );


  @POST(graphql)
  Future<ProductsNumberResponce> numberOfProducts(
    @Body() Map<String, dynamic> query,
  );


@POST(graphql)
  Future<CategoriesNumberResponce> numberOfCategories(
    @Body() Map<String, dynamic> query,
  );
  
  @POST(graphql)
  Future<UsersNumberResponce> numberOfUsers(
    @Body() Map<String, dynamic> query,
  );
    @POST(graphql)
  Future<GetAllCategoriesResponce> getAllCategories(
    @Body() Map<String, dynamic> query,
  );
  @POST(graphql)
  Future<CreateCategoryResponce> createCategory(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(graphql)
    Future<void> deleteCategory(
    @Body() Map<String, dynamic> mutation,
  );
    @POST(graphql)
    Future<void> updateCategory(
    @Body() Map<String, dynamic> mutation,
  );
      @POST(graphql)
    Future<GetAllProductResponse> getAllProducts(
    @Body() Map<String, dynamic> query,
  );
    @POST(graphql)
    Future<void> createProduct(
    @Body() Map<String, dynamic> mutation,
  );
  
      @POST(graphql)
    Future<void> deleteProduct(
    @Body() Map<String, dynamic> mutation,
  );
      @POST(graphql)
    Future<void> updateProduct(
    @Body() Map<String, dynamic> mutation,
  );
        @POST(graphql)
    Future<UserResponceModel> getAllUsers(
    @Body() Map<String, dynamic> query,
  );
        @POST(graphql)
    Future<void> deleteUser(
    @Body() Map<String, dynamic> mutation,
  );
    @POST(graphql)
  Future<BannerResponce> getbanners(
    @Body() Map<String, dynamic> query,
  );
      @POST(graphql)
  Future<ProductDetailsResponse> productDetails(
    @Body() Map<String, dynamic> query,
  );
        @POST(graphql)
  Future<GetAllProductResponse> getCategory(
    @Body() Map<String, dynamic> query,
  );
}
