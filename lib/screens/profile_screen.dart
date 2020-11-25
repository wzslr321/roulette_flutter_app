import 'package:flutter/material.dart';

import '../widgets/menu_and_profile_header.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context,constraints) => Column(
        children:<Widget> [
           HeaderInformation(constraints, queryData, 0.25, 'You can upgrade your profile with money!'),
        ],
      ),
    );
  }
}
