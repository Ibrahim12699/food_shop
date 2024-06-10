import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:food_shop/src/core/resources/color_manager.dart';
import 'package:food_shop/src/core/resources/route_manager.dart';
import 'package:food_shop/src/core/resources/string_manager.dart';
import 'package:food_shop/src/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return Container(
      color: ColorManager.primaryColor,
      child: Stack(
        children: [
          _buildImageBackground(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 48.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel(),
                4.verticalSpace,
                _buildDescription(),
                24.verticalSpace,
                _buildRegisterButton(),
                24.verticalSpace,
                _buildContinueButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageBackground() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Image.asset(
        AssetsManager.authBg,
      ),
    );
  }

  Widget _buildLabel() {
    return Text(
      StringManager.authLabel,
      style: getBoldStyle(
        fontSize: 28.spMin,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      StringManager.authDescription,
      style: getMediumStyle(
        fontSize: 18.spMin,
        color: Colors.white,
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  StringManager.registerOrLogin,
                  style: getRegularStyle(
                    color: Colors.black,
                    fontSize: 16.spMin,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.navigationScreen);
          },
          child: Text(
            StringManager.continueAsGuest,
            style: getRegularStyle(
              color: Colors.black,
              fontSize: 16.spMin,
            ),
          ),
        ),
      ],
    );
  }
}
