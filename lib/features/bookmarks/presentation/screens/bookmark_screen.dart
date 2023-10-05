import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';
import '../bookmarks_presentation.dart';


class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final BookmarkProvider bookmarkProvider =
    Provider.of<BookmarkProvider>(context, listen: true);
    return Scaffold(
      appBar: buildAppBar(),
      body: bookmarkProvider.getFavoritesList.isNotEmpty
          ? SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BookMarksListWidget(bookmarkProvider: bookmarkProvider),
            ],
          ),
        ),
      )
          : const NoResultWidget(
        title: 'No Bookmark Users Yet!',
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        "Your Bookmarks Users!",style: TextStyle(color: AppColor.primaryColor),
      ),
      iconTheme: const IconThemeData(
        color: AppColor.primaryColor, //change your color here
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      // backgroundColor: AppColor.backgroundColor,
    );
  }
}
