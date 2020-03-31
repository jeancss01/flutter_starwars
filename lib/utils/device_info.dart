import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfo {
  Future<DeviceInfoModel> getDeviceInfo() async {
    var deviceInfoPlugin = DeviceInfoPlugin();
    var deviceModel;
    if (Platform.isIOS) {
      var deviceInfo = await deviceInfoPlugin.iosInfo;
      deviceModel = DeviceInfoModel.forIos(deviceInfo);
    } else if (Platform.isAndroid) {
      var deviceInfo = await deviceInfoPlugin.androidInfo;
      deviceModel = DeviceInfoModel.forAndroid(deviceInfo);
    }
    return deviceModel;
  }
}

class DeviceInfoModel {
  final String deviceId;
  final String deviceModel;
  final String deviceName;
  final String systemVersion;
  final String systemName;
  final String localizedName;
  final String platform;
  final bool isEmulator;

  DeviceInfoModel.forIos(IosDeviceInfo deviceInfo)
      : deviceId = deviceInfo.identifierForVendor,
        deviceName = deviceInfo.name,
        deviceModel = deviceInfo.model,
        localizedName = deviceInfo.localizedModel,
        systemName = deviceInfo.systemName,
        systemVersion = deviceInfo.systemVersion,
        platform = "IOS",
        isEmulator = !deviceInfo.isPhysicalDevice;

  DeviceInfoModel.forAndroid(AndroidDeviceInfo deviceInfo)
      : deviceId = deviceInfo.androidId,
        deviceName = deviceInfo.fingerprint,
        deviceModel = deviceInfo.version.incremental,
        localizedName = "",
        systemName = "",
        systemVersion = deviceInfo.version.release,
        platform = "Android",
        isEmulator = true;

  toJson() {
    print('deviceId = $deviceId');
    print('deviceName = $deviceName');
    print('deviceModel = $deviceModel');
    return "{\"platform\":\"${this.platform}\",\"os_version\":\"${this.systemVersion}\"}";
  }
}
