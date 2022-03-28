import 'package:flutter/material.dart';

import 'connectivity.dart';

checkConnectivity(BuildContext contextDialog) {
  print('AppState: Init Mobile Modules ..');
  MyConnectivity.instance.initialise();
  MyConnectivity.instance.myStream.listen((onData) {
    print('App: Internet Issue Change: $onData');
    if (MyConnectivity.instance.isIssue(onData)) {
      if (MyConnectivity.instance.isShow == false) {
        print('No Internet Connection');
        MyConnectivity.instance.isShow = true;
        // ShowInternetDialog(
        //   context: context,
        //   operatingSystem: kIos == true ? OS.IOS : OS.Android,
        // ).showDialogNoInternet().then((onValue) {
        //   MyConnectivity.instance.isShow = false;
        //   print('showDialogNotInternet: Dialog Closed $onValue');
        // });
        // Fluttertoast.showToast(
        //     msg: LocaleKeys.no_internet.tr(),
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0).then((onValue) {
        //   MyConnectivity.instance.isShow = false;
        //   print('showDialogNotInternet: Dialog Closed $onValue');
        // });
      }
    } else {
      if (MyConnectivity.instance.isShow == true) {
        // Navigator.of(context).pop();
        MyConnectivity.instance.isShow = false;
      }
    }
  });
  print('AppState: Register Modules .. DONE');
}
