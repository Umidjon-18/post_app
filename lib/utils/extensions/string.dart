import 'package:oktoast/oktoast.dart';

extension StringExtensions on String {


  void showToastWidget() {
    dismissAllToast(showAnim: true);
    showToast(this);
  }


}
