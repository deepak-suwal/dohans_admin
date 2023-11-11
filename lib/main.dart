import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopify_flutter/shopify_config.dart';

import 'core/injection/injection.dart';
import 'core/routes/app_router.dart';
import 'firebase_options.dart';

void main() async {
  ShopifyConfig.setConfig(
    storefrontAccessToken: '12759dcea3d291ad8ba77fd7b55b27e3',
    storeUrl: 'd6ebe5-2.myshopify.com',
    adminAccessToken: "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", // optional
    storefrontApiVersion: '2023-07', // optional
  );
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(_appRouter),
    );
  }
}
