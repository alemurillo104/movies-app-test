library common_dependency_module;

export 'src/logger.dart';
export 'package:equatable/equatable.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

export 'package:dio/dio.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:cached_network_image/cached_network_image.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
