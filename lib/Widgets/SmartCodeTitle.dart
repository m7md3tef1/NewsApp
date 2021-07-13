import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmartCodeTitle extends StatelessWidget {
  const SmartCodeTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('SmartCode',style: TextStyle(color: Colors.deepPurple,fontSize: 30.sp),),
        Text(' News',style: TextStyle(color: Colors.grey,fontSize: 30.sp),)

      ],

    );
  }
}