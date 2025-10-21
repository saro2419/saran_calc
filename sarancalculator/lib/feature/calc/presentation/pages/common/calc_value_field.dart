import 'package:flutter/material.dart';
import 'package:sarancalculator/common/constants/fontsize_constant.dart';
import 'package:sarancalculator/widgets/parent/custom_textfield.dart';

class CalcValueField extends StatelessWidget {
  final TextEditingController controller;
  const CalcValueField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller: controller,
      borderWidth: 2,
      fontSize: PageHeading.small,
      minLines: 2,
      maxLines: 2,
      readOnly: true,
      showCursor: false,
    );
  }
}
