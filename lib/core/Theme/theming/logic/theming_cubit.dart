import 'package:bloc/bloc.dart';
import 'package:chairy_app/core/helper/Hive/hiveBoxes.dart';
import 'package:chairy_app/core/helper/Hive/hiveHelper.dart';
import 'package:meta/meta.dart';

part 'theming_state.dart';

class ThemingCubit extends Cubit<ThemingState> {
  HiveHelper hiveHelper;
  ThemingCubit({required this.hiveHelper}) : super(ThemingInitial());
  late bool isDark;


  Future<void> loadTheme() async {
     isDark =  await hiveHelper.get<bool>(HiveBoxes.theme.box, HiveBoxes.theme.isDarkKey,)?? false;

    emit(ThemeLoaded());
  }

  Future<void> toggleTheme() async {
    if (state is ThemeLoaded) {
      isDark = !isDark;
      await hiveHelper.put<bool>(HiveBoxes.theme.box, HiveBoxes.theme.isDarkKey, isDark);

      emit(ThemeLoaded());
    }
  }
}
