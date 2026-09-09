import 'package:pickup_board/core/constants/local_subnet_resolver.dart';

/// MQTT broker connection details — same broker every Cafe Beta device uses
/// (see the sibling `aio_pickup_table`/`kds` projects' own network constants).
class NetworkConstants {
  const NetworkConstants._();

  // Every Cafe Beta device on one site shares a subnet (see
  // LocalSubnetResolver) — only the last octet is fixed per role, so a new
  // site (a different third octet) needs no code change or reinstall, just
  // its router pre-configured with the broker's address reserved.
  static String get mqttBrokerHost => '${LocalSubnetResolver.prefix}.240';
  static const int mqttBrokerPort = 1883;
  static const String mqttUsername = 'cafebeta';
  static const String mqttPassword = 'soundgraph@2026';

  // Fixed identity — never change once registered with Message Hub.
  static const String mqttDeviceId = 'Cafe Beta PickupBoard';
  // Display label shown on the Message Hub dashboard — safe to change anytime.
  static const String mqttDeviceName = 'Cafe Beta PickupBoard';
}
