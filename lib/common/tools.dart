import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Future<void> delay(int milliseconds) =>
    Future.delayed(Duration(milliseconds: milliseconds));

extension DebugMapStreamsExtension on Map<String, Stream<dynamic>> {
  List<StreamSubscription> debug() => entries
      .map((entry) => entry.value
      .listen((data) => debugPrint('[DEBUG] [${entry.key}] = $data')))
      .toList();
}



class Tools {
  static final Tools _instance = Tools.internal();

  Tools.internal();

  factory Tools() => _instance;

  final Logger logger = Logger();

}