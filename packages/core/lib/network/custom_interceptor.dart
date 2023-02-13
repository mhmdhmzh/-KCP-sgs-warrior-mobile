import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core/common/constants.dart' as constants;

class CustomInterceptor extends Interceptor {
  final SharedPreferences sp;

  CustomInterceptor({required this.sp});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (sp.getString(constants.PREF_KEY_TOKEN) != null &&
        sp.getString(constants.PREF_KEY_TOKEN)!.isNotEmpty) {
      options.headers['Authorization'] =
          'Bearer ${sp.getString(constants.PREF_KEY_TOKEN)}';
    }

    options.headers['Language'] = 'en';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
