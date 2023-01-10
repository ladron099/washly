import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washly/utils/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white, 
        body: Center(
          child: Container( 
            child: Image.asset('assets/images/loading.gif',
            fit: BoxFit.cover,
            
            ),
          ),
        ),
      
    );
  }
}