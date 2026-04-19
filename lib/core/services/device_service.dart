import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Service for identifying the current device.
/// 
/// Generates and persists a unique `deviceId` locally to help
/// track which device authored which sync records.
class DeviceService {
  static const String _deviceIdKey = 'ovya_device_id';
  String? _deviceId;

  /// Returns the persistent unique identifier for this device.
  /// 
  /// Generates a new one if it doesn't already exist in SharedPreferences.
  Future<String> getDeviceId() async {
    if (_deviceId != null) return _deviceId!;

    final prefs = await SharedPreferences.getInstance();
    String? storedId = prefs.getString(_deviceIdKey);

    if (storedId == null) {
      storedId = const Uuid().v4();
      await prefs.setString(_deviceIdKey, storedId);
    }

    _deviceId = storedId;
    return storedId;
  }
}
