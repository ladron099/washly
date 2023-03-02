import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoadingScreen extends StatelessWidget {
  bool loading;
  Widget child;
  LoadingScreen({super.key, required this.loading, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: LoadingOverlay(
          isLoading: loading,
          child: child,
        ));
  }
}
