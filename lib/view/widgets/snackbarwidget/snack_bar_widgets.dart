import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

class SnackBarWidget {
  iconSnackSuccess(context, {label}) {
    return IconSnackBar.show(
      context,
      snackBarType: SnackBarType.success,
      label: label,
    );
  }

  iconSnackFail(context, {label}) {
    return IconSnackBar.show(
      context,
      snackBarType: SnackBarType.fail,
      label: label,
    );
  }

  iconSnackAlert(context, {label}) {
    return IconSnackBar.show(
      context,
      snackBarType: SnackBarType.alert,
      label: label,
    );
  }
}
