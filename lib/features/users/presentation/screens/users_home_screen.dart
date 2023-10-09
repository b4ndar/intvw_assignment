import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/common_widgets/custom_loading.dart';
import '../../../../core/core.dart';
import '../../domain/entites/user.dart';
import '../users_presentation.dart';


class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final ScrollController _scrollController = ScrollController();
  List<UserEntity> users = [];
  bool isLoading = false;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.darkBackgroundColor,
        title: const Text(
          'User List',
          style: TextStyle(
            color: AppColor.whiteColor,
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              itemCount: users.length + 1, // Add 1 for a loading indicator
              itemBuilder: (context, index) {
                if (index < users.length) {
                  final user = users[index];
                  return UserCard(user: user);
                }
              },
            ),
            if(isLoading) const CustomLoading()
          ],
        ),
      ),
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

  ///pagination
  // Load users for the given page
  Future<void> _loadUsers(int page) async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    final result =
        await Provider.of<UserProvider>(context, listen: false).getUsers(page);

    setState(() {
      users.addAll(result);
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

