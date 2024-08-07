// Flutter imports:
import 'package:flutter/material.dart';

class DashboardAppBAr extends AppBar {
  final String titleText;
  final GlobalKey<ScaffoldState> scaffoldKey;
  DashboardAppBAr(
      {required this.titleText, required this.scaffoldKey, super.key})
      : super(
          title: Text(titleText),
          actions: [
            IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(Icons.menu),
            )
          ],
        );
}
