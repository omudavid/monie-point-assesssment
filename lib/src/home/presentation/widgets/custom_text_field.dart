import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _isExpanded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      width: _isExpanded ? 280.w : 100.w,
      // Animate the width
      height: 35.h,
      // Animate the height
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          16.h,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(

        onChanged: (val) {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },

        decoration: const InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
          ),
          hintText: 'Saint Petersburg',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
