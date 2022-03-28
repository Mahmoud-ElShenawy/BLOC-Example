import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:logger/logger.dart';

class MyConnectivity {
  MyConnectivity._internal();
  static final MyConnectivity _instance = MyConnectivity._internal();
  static MyConnectivity get instance => _instance;
  final Logger logger = Logger();

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();
  Stream get myStream => controller.stream;
  bool isShow = false;

  Future<void> initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    await _checkStatus(result);
    connectivity.onConnectivityChanged.listen(_checkStatus);
  }

  Future<void> _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        logger.w('Connectivity: Online');
        isOnline = true;
      } else {
        logger.w('Connectivity: Offline');
        isOnline = false;
      }
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  bool isIssue(dynamic onData) =>
      onData.keys.toList()[0] == ConnectivityResult.none;

  void disposeStream() => controller.close();
}