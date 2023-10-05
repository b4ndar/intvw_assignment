import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../domain/users_domain.dart';
import '../users_presentation.dart';



class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  UserDetailsScreen(user:user,)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(color: AppColor.darkContainerBackgroundColor,
          child: ListTile(
            leading: ClipOval(
              child: CachedNetworkImage(
                imageUrl: "${user.profileImage}",
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: CustomText(title: user.displayName),
            subtitle: CustomText(title:user.location ?? "No location"),
            trailing: CustomText(title:'Reputation :${user.reputation!}'),

          ),
        ),
      ),
    );
  }
}