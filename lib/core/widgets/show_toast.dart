import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(String msg) {
  return Fluttertoast.showToast(msg: msg);
}
