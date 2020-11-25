import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  static const routeName = '/error-404';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route not found"),
      ),
      body: Container(child: Text("Route not found")),
    );
  }
}
