import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../core.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: LoadingAnimationWidget.fourRotatingDots(color: AppColor.primaryColor, size: 25),);
  }
}