// ignore_for_file: prefer_const_constructors

void handleClickMenuPopUp(String value) {
  switch (value) {
    case 'Profile':
      break;

    case 'Logout':
      // _signOut();
      //    AppNavigator.pushAndRemoveUntil(AppRoute.loginRoute);

      break;
    case 'Settings':
      // AppNavigator.navigateTo(AppRoute.settingRoute);
      break;
    case 'Create group':
      // AppNavigator.navigateTo(AppRoute.groupchatRoute);
      break;
  }
}

// Future _signOut() async {
//   try {
//     await FirebaseAuth.instance.signOut();
//     final res = AppNavigator.pushAndRemoveUntil(AppRoute.loginRoute);
//     return res;
//   } on FirebaseException catch (e) {
//     throw ServerException(e.message.toString());
//   }
// }