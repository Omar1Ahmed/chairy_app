import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  int currentIndex = 0;

  void changeTab(int index) {
    currentIndex = index;

  emit(BottomNavBarChanged());

  }
}
