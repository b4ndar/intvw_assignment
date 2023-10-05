import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../domain/users_domain.dart';

class ReputationCard extends StatelessWidget {
  const ReputationCard({Key? key, required this.reputation}) : super(key: key);

  final ReputationHistoryEntity reputation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColor.darkContainerBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: ListView.separated(
            shrinkWrap: true, // Ensure the ListView takes up only as much space as needed
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            itemCount: 4, // Number of text items
            separatorBuilder: (context, index) => const SizedBox(height: 4.0), // Add vertical padding
            itemBuilder: (context, index) {
              // Create each text item with appropriate content
              switch (index) {
                case 0:
                  return CustomText(title:"Reputation Change : ${reputation.reputationChange}");
                case 1:
                  return CustomText(title:"History Type : ${reputation.reputationHistoryType.substring(5)}");
                case 2:
                  return CustomText(title:"Post ID : ${reputation.postId}");
                case 3:
                  return CustomText(title:"Creation Date : ${reputation.creationDate}");
                default:
                  return const SizedBox.shrink(); // Return an empty SizedBox for unknown indices
              }
            },
          ),
        ),
      ),
    );
  }
}
