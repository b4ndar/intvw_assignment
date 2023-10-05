import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(title!,style: const TextStyle(color: AppColor.whiteColor),);
  }
}