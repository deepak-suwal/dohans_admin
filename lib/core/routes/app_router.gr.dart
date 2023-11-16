// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin/features/presentation/pages/add_device_page.dart' as _i1;
import 'package:admin/features/presentation/pages/add_model_page.dart' as _i2;
import 'package:admin/features/presentation/pages/home_page.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i5;
import 'package:shopify_flutter/models/src/collection/collection.dart' as _i6;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AddDeviceRoute.name: (routeData) {
      final args = routeData.argsAs<AddDeviceRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddDevicePage(
          key: args.key,
          collectionList: args.collectionList,
        ),
      );
    },
    AddModelRoute.name: (routeData) {
      final args = routeData.argsAs<AddModelRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddModelPage(
          key: args.key,
          collectionList: args.collectionList,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AddDevicePage]
class AddDeviceRoute extends _i4.PageRouteInfo<AddDeviceRouteArgs> {
  AddDeviceRoute({
    _i5.Key? key,
    required List<_i6.Collection> collectionList,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          AddDeviceRoute.name,
          args: AddDeviceRouteArgs(
            key: key,
            collectionList: collectionList,
          ),
          initialChildren: children,
        );

  static const String name = 'AddDeviceRoute';

  static const _i4.PageInfo<AddDeviceRouteArgs> page =
      _i4.PageInfo<AddDeviceRouteArgs>(name);
}

class AddDeviceRouteArgs {
  const AddDeviceRouteArgs({
    this.key,
    required this.collectionList,
  });

  final _i5.Key? key;

  final List<_i6.Collection> collectionList;

  @override
  String toString() {
    return 'AddDeviceRouteArgs{key: $key, collectionList: $collectionList}';
  }
}

/// generated route for
/// [_i2.AddModelPage]
class AddModelRoute extends _i4.PageRouteInfo<AddModelRouteArgs> {
  AddModelRoute({
    _i5.Key? key,
    required List<_i6.Collection> collectionList,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          AddModelRoute.name,
          args: AddModelRouteArgs(
            key: key,
            collectionList: collectionList,
          ),
          initialChildren: children,
        );

  static const String name = 'AddModelRoute';

  static const _i4.PageInfo<AddModelRouteArgs> page =
      _i4.PageInfo<AddModelRouteArgs>(name);
}

class AddModelRouteArgs {
  const AddModelRouteArgs({
    this.key,
    required this.collectionList,
  });

  final _i5.Key? key;

  final List<_i6.Collection> collectionList;

  @override
  String toString() {
    return 'AddModelRouteArgs{key: $key, collectionList: $collectionList}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i7.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<HomeRouteArgs> page =
      _i4.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}
