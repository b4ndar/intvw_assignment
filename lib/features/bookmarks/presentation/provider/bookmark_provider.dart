import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../users/data/users_data.dart';
import '../../../users/domain/users_domain.dart';

enum EventLoadingStatus { notLoaded, loading, loaded }

class BookmarkProvider with ChangeNotifier {
  List<UserEntity> _favoritesList = [];
  EventLoadingStatus _eventLoadingStatus = EventLoadingStatus.notLoaded;

  EventLoadingStatus get status => _eventLoadingStatus;

  List<UserEntity> get getFavoritesList => _favoritesList;

  Future<void> loadFavoritesList() async {
    _eventLoadingStatus = EventLoadingStatus.loading;
    notifyListeners();

    final jsonString = Prefs.getString(key: 'FavoriteUser');
    if (jsonString != null) {
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      _favoritesList = jsonList.map((e) => User.fromJson(e)).toList();
    }

    _eventLoadingStatus = EventLoadingStatus.loaded;
    notifyListeners();
  }

  Future<void> addOrRemoveFavorite(UserEntity userEntity) async {
    if (isFavorite(userEntity)) {
      _favoritesList.removeWhere((element) => element.userId == userEntity.userId!);
    } else {
      _favoritesList.add(userEntity);
    }
    await Prefs.setString(
      'FavoriteUser',
      json.encode(_favoritesList),
    );
    notifyListeners();
  }

  bool isFavorite(UserEntity userEntity) {
    return _favoritesList.any((element) => element.userId == userEntity.userId!);
  }
}
