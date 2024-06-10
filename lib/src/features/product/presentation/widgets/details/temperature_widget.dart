import 'package:food_shop/src/core/resources/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({super.key});

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  final List<TemperatureModel> selectedList = [
    TemperatureModel(temperature: DrinkTemperature.hot, name: 'Hot'),
    TemperatureModel(temperature: DrinkTemperature.iced, name: 'Iced'),
  ];
  late ValueNotifier<TemperatureModel> selectedTemperatureModel;

  @override
  void initState() {
    selectedTemperatureModel =
        ValueNotifier<TemperatureModel>(selectedList.last);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildHotType();
  }

  Widget _buildHotType() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
          children: List.generate(selectedList.length, (index) {
        return _buildItem(selectedList[index]);
      })),
    );
  }

  Widget _buildItem(TemperatureModel model) {
    return GestureDetector(
      onTap: () => _onItemPressed(model),
      child: ValueListenableBuilder<TemperatureModel>(
        valueListenable: selectedTemperatureModel,
        builder: (context, value, child) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: _isItemSelected(model) ? 40.w : 20.w,
              vertical: 14.h,
            ),
            decoration: BoxDecoration(
              color: _isItemSelected(model) ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: _buildItemTitle(model.name),
          );
        },
      ),
    );
  }

  Widget _buildItemTitle(String name) {
    return Text(
      name,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.spMin,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  bool _isItemSelected(TemperatureModel model) {
    return selectedTemperatureModel.value == model;
  }

  void _onItemPressed(TemperatureModel model) {
    selectedTemperatureModel.value = model;
  }
}

class TemperatureModel {
  final DrinkTemperature temperature;
  final String name;

  TemperatureModel({
    required this.temperature,
    required this.name,
  });
}
