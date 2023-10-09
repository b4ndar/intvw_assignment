import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../users/data/users_data.dart';
import '../../../users/domain/users_domain.dart';

enum EventLoadingStatus { notLoaded, loading, loaded }

class BookmarkProvider with ChangeNotifier {
  List<UserEntity> _bookmarksList = [];
  EventLoadingStatus _eventLoadingStatus = EventLoadingStatus.notLoaded;

  EventLoadingStatus get status => _eventLoadingStatus;

  List<UserEntity> get getBookmarksList => _bookmarksList;

  Future<void> loadBookmarksList() async {
    _eventLoadingStatus = EventLoadingStatus.loading;
    notifyListeners();
    final jsonString = await Prefs.getData(key: Constants.bookmarks);
    if (jsonString != null) {
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      _bookmarksList = jsonList.map((e) => User.fromJson(e)).toList();
      notifyListeners();
    }

    _eventLoadingStatus = EventLoadingStatus.loaded;
    notifyListeners();
  }

  Future<void> addOrRemoveFavorite(UserEntity userEntity) async {
    if (isBookmarked(userEntity)) {
      _bookmarksList.removeWhere((element) => element.userId == userEntity.userId!);
    } else {
      _bookmarksList.add(userEntity);
    }
    await Prefs.setString(
      Constants.bookmarks,
      json.encode(_bookmarksList),
    );
    notifyListeners();
  }

  bool isBookmarked(UserEntity userEntity) {
    return _bookmarksList.any((element) => element.userId == userEntity.userId!);
  }
}
