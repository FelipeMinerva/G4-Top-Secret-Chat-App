import 'package:flutter/foundation.dart';
import 'package:mercury/singletons/services_setup.dart';

abstract class ServiceBase {
  @protected
  final setup = ServicesSetup();
}
