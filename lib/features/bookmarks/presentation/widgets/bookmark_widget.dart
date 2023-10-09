import 'package:flutter/material.dart';
import '../../../users/presentation/users_presentation.dart';
import '../bookmarks_presentation.dart';


class BookMarksListWidget extends StatelessWidget {
  const BookMarksListWidget({
    super.key,
    required this.bookmarkProvider,
  });

  final BookmarkProvider bookmarkProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bookmarkProvider.getBookmarksList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container();
      },
      itemBuilder: (BuildContext context, int index) {
        return UserCard(
          user: bookmarkProvider.getBookmarksList[index],
        );
      },
    );
  }
}