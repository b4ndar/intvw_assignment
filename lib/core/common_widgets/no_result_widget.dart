import 'package:flutter/material.dart';
import 'package:sof/core/common_widgets/custom_text_widget.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no-results-2.png'),
          const SizedBox(
            height: 10,
          ),
          CustomText(title: title),
        ],
      ),
    );
  }
}
