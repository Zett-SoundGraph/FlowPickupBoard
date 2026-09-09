import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pickup_board/core/constants/index.dart';
import 'package:pickup_board/core/di/index.dart';
import 'package:pickup_board/core/env/env.dart';
import 'package:pickup_board/core/theme/index.dart';
import 'package:pickup_board/presentation/cubit/pickup_board/index.dart';
import 'package:pickup_board/presentation/screens/index.dart';

void main() {
  // Must come before setupLocator() — an @Singleton data source's
  // constructor could touch a platform channel (needs
  // ServicesBinding.instance to already exist) during eager DI
  // construction. runApp() would normally set this up on its own, but
  // that's too late here since setupLocator() runs before it.
  WidgetsFlutterBinding.ensureInitialized();
  // Not awaited — NetworkConstants.mqttBrokerHost falls back to the
  // currently-deployed site's subnet until this resolves, so nothing needs
  // to block on it (the MQTT connect below already retries on its own and
  // picks up the corrected value automatically).
  LocalSubnetResolver.resolve();
  setupLocator(Env.prod());
  runApp(const PickupBoardApp());
}

class PickupBoardApp extends StatelessWidget {
  const PickupBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pickup Board',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'LineSeedJP',
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => getIt<PickupBoardCubit>(),
        child: const PickupBoardScreen(),
      ),
    );
  }
}
