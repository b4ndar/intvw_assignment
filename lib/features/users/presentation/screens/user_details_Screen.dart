import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common_widgets/custom_loading.dart';
import '../../../../core/core.dart';
import '../../../bookmarks/presentation/bookmarks_presentation.dart';
import '../../domain/users_domain.dart';
import '../users_presentation.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key, this.user});

  final UserEntity? user;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ReputationHistoryEntity> reputations = [];
  bool isLoading = false;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final BookmarkProvider bookmarkProvider =
        Provider.of<BookmarkProvider>(context, listen: true);
    return Scaffold(
      appBar: buildAppBar(bookmarkProvider),
      body: Center(
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              itemCount: reputations.length + 1,
              // Add 1 for a loading indicator
              itemBuilder: (context, index) {
                if (index < reputations.length) {
                  final reputation = reputations[index];
                  return ReputationCard(
                    reputation: reputation,
                  );
                }
              },
            ),
            if (isLoading) const CustomLoading(),
          ],
        ),
      ),
    );
  }

  /// App Bar
  AppBar buildAppBar(BookmarkProvider bookmarkProvider) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColor.primaryColor,
      ),
      backgroundColor: Colors.transparent,
      title: const Text(
        'User Reputations',
        style: TextStyle(color: AppColor.primaryColor),
      ),
      actions: [
        IconButton(
          icon: Icon(
            bookmarkProvider.isFavorite(widget.user!)
                ? Icons.bookmark_add
                : Icons.bookmark_add_outlined,
            color: AppColor.primaryColor,
          ),
          onPressed: () {
            bookmarkProvider.addOrRemoveFavorite(widget.user!);
          },
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // Load the initial page of users
    _loadUsers(currentPage);
    // Add a listener to the scroll controller to load more data when scrolling
    _scrollController.addListener(_scrollListener);
  }

  /// Pagination
  // Load users for the given page
  Future<void> _loadUsers(int page) async {
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    final result = await Provider.of<UserProvider>(context, listen: false)
        .getReputations(widget.user!.userId!, page: 1);

    setState(() {
      reputations.addAll(result);
      isLoading = false;
    });
  }

  // Listener to detect when the user has reached the end of the list
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more data when the user reaches the end of the list
      currentPage++;
      _loadUsers(currentPage);
    }
  }

  @override
  void dispose() {
    // Dispose of the scroll controller when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }
}
