import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  static const routeName = '/error-404';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route not found"),
      ),
      body: Container(child: const Text("Route not found")),
    );
  }
}
