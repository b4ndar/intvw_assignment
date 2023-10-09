

import 'package:get_it/get_it.dart';
import 'package:sof/core/core.dart';
import 'package:sof/features/bookmarks/presentation/bookmarks_presentation.dart';

import 'features/users/data/users_data.dart';
import 'features/users/presentation/users_presentation.dart';



final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  await Prefs.init();

  /// Register UserRepositoryImpl
  sl.registerSingleton<UserRepositoryImpl>(UserRepositoryImpl());
  sl.registerSingleton(Prefs());

  /// Register UseCases
  sl.registerSingleton<GetUsersUseCase>(GetUsersUseCase(sl<UserRepositoryImpl>()));
  sl.registerSingleton<GetReputationsUseCase>(GetReputationsUseCase(sl<UserRepositoryImpl>()));

  /// Register Providers
  sl.registerSingleton<UserProvider>(
    UserProvider(
      sl<GetUsersUseCase>(),
      sl<GetReputationsUseCase>(),
    ),
  );

  sl.registerSingleton<BookmarkProvider>(BookmarkProvider(),);
}
