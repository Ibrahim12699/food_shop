import 'package:food_shop/src/core/resources/color_manager.dart';
import 'package:food_shop/src/core/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: _buildLabel(),
      ),
    );
  }

  Widget _buildLabel() {
    return Center(
      child: Text(
        StringManager.customize,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.spMin,
        ),
      ),
    );
  }
}
