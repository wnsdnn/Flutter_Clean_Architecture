import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final AppBar? appBar;
  final Widget child;
  final Widget? nav;

  const DefaultLayout({
    super.key,
    required this.child,
    this.appBar,
    this.nav,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: nav,
    );
  }
}
