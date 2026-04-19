import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/device_service.dart';

/// Provider for [DeviceService].
final deviceServiceProvider = Provider<DeviceService>((ref) {
  return DeviceService();
});
