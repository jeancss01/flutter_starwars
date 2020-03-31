import 'package:dio/dio.dart';
import 'device_info.dart';

class NetworkInterceptor extends Interceptor {

  /*Future onRequest(RequestOptions options) async {
    print('NetworkInterceptor::onRequest');
    print('baseUrl${options.path}');
    options.headers.addAll({"x-client-version": '8.26'});

    print(
        'NetworkInterceptor::onRequest:sessionModel = ${sessionModel.toString()}');
    if (sessionModel != null) {
      options.headers.addAll({"x-access-token": sessionModel.token});
      options.headers.addAll({"device-id": sessionModel.deviceId});
    } else {
      var deviceId = (await DeviceInfo().getDeviceInfo()).deviceId;
      options.headers.addAll({"device-id": deviceId});
    }
    options.headers.addAll({'mobile-app': '1'});
    return options;
  }*/
}
