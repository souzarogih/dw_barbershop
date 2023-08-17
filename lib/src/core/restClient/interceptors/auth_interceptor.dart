import 'package:dio/dio.dart';
import 'package:dw_barbershop/src/core/constants/local_stoage_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;

    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);

    if (extra case {'DIO_AUTH_KEY': true}) {
      final sharedPreferences = await SharedPreferences.getInstance();
      headers.addAll({
        authHeaderKey:
            'Bearer ${sharedPreferences.getString(LocalStorageKeys.accessToken)}'
      });
    }

    handler.next(options);
  }
}
