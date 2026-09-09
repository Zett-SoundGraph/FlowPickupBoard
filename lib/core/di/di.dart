import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:pickup_board/core/di/di.config.dart';
import 'package:pickup_board/core/di/service_locator.dart';
import 'package:pickup_board/core/env/env.dart';
import 'package:pickup_board/domain/repositories/menu_image_repository.dart';

export 'package:pickup_board/core/di/service_locator.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void setupLocator(Env env) {
  getIt.registerSingleton<Env>(env);
  $initGetIt(getIt);

  // Fired-and-forgotten so a slow/offline sheet fetch can't block app
  // startup — thumbnails just fall back to the placeholder icon until it
  // completes (matches kds's MenuRepository.load() pattern).
  unawaited(getIt<MenuImageRepository>().load());
}
