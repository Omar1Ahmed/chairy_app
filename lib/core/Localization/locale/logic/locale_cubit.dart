import 'package:bloc/bloc.dart';
import 'package:chairy_app/core/helper/Hive/hiveBoxes.dart';
import 'package:chairy_app/core/helper/Hive/hiveHelper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  HiveHelper hiveHelper;
  late Locale locale ;
  LocaleCubit({required this.hiveHelper}) : super(LocaleInitial());


  Future<void> loadLocale() async {
    final langCode = await hiveHelper.get<String>(HiveBoxes.locale.box, HiveBoxes.locale.languageCodeKey) ?? 'en';
    locale = Locale(langCode);
    emit(LocaleLoaded());
  }

  Future<void> changeLocale(String languageCode) async {
    await hiveHelper.put<String>(HiveBoxes.locale.box, HiveBoxes.locale.languageCodeKey, languageCode);
    locale = Locale(languageCode);
    emit(LocaleLoaded());
  }

}
