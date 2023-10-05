import 'package:flutter/material.dart';
import 'core/core.dart';
import 'features/bookmarks/presentation/bookmarks_presentation.dart';
import 'features/users/presentation/users_presentation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    UsersListScreen(),
    BookmarkScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
      ],
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: AppColor.grayColor,
      currentIndex: _selectedIndex,
      backgroundColor: AppColor.darkBackgroundColor,
      onTap: _onItemTapped,
    );
  }

}