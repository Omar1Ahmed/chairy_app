import 'package:bloc/bloc.dart';
import 'package:chairy_app/core/Localization/Locales/generated/l10n.dart';
import 'package:chairy_app/core/network/Connectivity/connectivity_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/CategoryEntity.dart';
import '../../../domain/repository/categories_repository.dart';

part 'categories_state.dart';


class categoriesCubit extends Cubit<HomeState> {
  CategoriesRepository categoriesRepository;
  categoriesCubit({required this.categoriesRepository}) : super(HomeInitial());
  List<CategoryEntity> Categories = [];

  Future getCategories () async {

    print('fetching Categories');

    emit(CategoriesFetchingLoading());

    try{

      final fetchedCategories = await categoriesRepository.getCategories();

      Categories = fetchedCategories;

      emit(CategoriesFetchedSuccessfully());
    } on NoInternetConnectionException {

      emit(NoInternetConnection());

    } on DioException catch (dioException) {


      emit(HomeCubitError(errorMessage: dioException.message!));
    }catch(e){

      emit(HomeCubitError(errorMessage: S.current.unexpectedError));

    }

  }

}
