import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/customers/home/data/repo/home_repo.dart';
part 'get_banners_event.dart';
part 'get_banners_state.dart';
part 'get_banners_bloc.freezed.dart';

class GetBannersBloc extends Bloc<GetBannersEvent, GetBannersState> {
  GetBannersBloc(this._repo) : super(const GetBannersState.loading()) {
    on<FetchBannerEvent>(_getBanners);
  }
  final HomeRepo _repo;
  FutureOr<void> _getBanners(
    FetchBannerEvent event,
    Emitter<GetBannersState> emit,
  ) async {
    emit(const GetBannersState.loading());
    final responce = await _repo.getBanners();
    responce.when(
      success: (bannerList) {
        if (bannerList.images.isEmpty) {
          emit(const GetBannersState.empty());
        } else {
          emit(GetBannersState.success(bannerList.images));
        }
      },
      failure: (error) {
        emit(GetBannersState.error(error: error));
      },
    );
  }
}
