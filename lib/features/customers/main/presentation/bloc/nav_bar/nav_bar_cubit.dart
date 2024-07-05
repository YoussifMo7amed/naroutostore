import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/enums/nav_bar_enum.dart';

part 'nav_bar_state.dart';
part 'nav_bar_cubit.freezed.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(const NavBarState.initial());

  NavBarEnum navBar = NavBarEnum.home;

  void navBarChange(NavBarEnum viewEnum) {
    if (viewEnum == NavBarEnum.home) {
      navBar = NavBarEnum.home;
    } else if (viewEnum == NavBarEnum.categories) {
      navBar = NavBarEnum.categories;
    } else if (viewEnum == NavBarEnum.favorites) {
      navBar = NavBarEnum.favorites;
    } else if (viewEnum == NavBarEnum.profile) {
      navBar = NavBarEnum.profile;
    }

    emit(NavBarState.navBarChange(navBar: navBar));
  }
}
