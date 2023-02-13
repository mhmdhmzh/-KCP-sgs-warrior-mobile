import 'dart:io';

import 'package:core/core.dart';

abstract class DeviceInfo {
  Info getDeviceInfo();
}

class DeviceInfoImpl extends DeviceInfo {
  final BaseDeviceInfo deviceInfo;
  final String platformDeviceId;

  DeviceInfoImpl({required this.deviceInfo, required this.platformDeviceId});

  @override
  Info getDeviceInfo() {
    final map = deviceInfo.toMap();
    final info = Info(Platform.isAndroid ? 'android' : 'ios',
      Platform.isAndroid ? platformDeviceId : map['identifierForVendor'],);
    return info;
  }

}

class Info {
  final String type;
  final String id;

  Info(this.type, this.id);
}