import 'package:chairy_app/core/Localization/locale/logic/locale_cubit.dart';
import 'package:dio/dio.dart';

class LanguageInterceptor extends Interceptor {
  final LocaleCubit localeCubit;

  LanguageInterceptor(this.localeCubit);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = localeCubit.locale.languageCode;
    return super.onRequest(options, handler);
  }
}