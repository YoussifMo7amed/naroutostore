import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/service/hive/hive_database.dart';
import 'package:naroutoshop/features/customers/favorites/data/models/favorites_model.dart';
part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState.initial());

  Future<void> addtoFavorites({
    required String productId,
    required String title,
    required String image,
    required String price,
    required String categoryName,
  }) async {
    emit(const FavoriteState.initial());
    final exitIndex = HiveDatabase()
        .favoritesBox!
        .values
        .toList()
        .indexWhere((element) => element.id == productId);

    if (exitIndex >= 0) {
      await HiveDatabase().favoritesBox!.deleteAt(exitIndex);
    } else {
      await HiveDatabase().favoritesBox!.add(
            FavoritesModel(
              id: productId,
              title: title,
              image: image,
              price: price,
              categoryName: categoryName,
            ),
          );
    }
    emit(const FavoriteState.AddtoFavorites());
  }

  bool isFavorite(String productId) {
    return HiveDatabase()
        .favoritesBox!
        .values
        .toList()
        .any((e) => e.id == productId);
  }

  List<FavoritesModel> get getFavorites {
    return HiveDatabase().favoritesBox!.values.toList();
  }
}
