

import 'package:get_it/get_it.dart';

import 'features/users/data/users_data.dart';
import 'features/users/presentation/users_presentation.dart';



final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  /// Register UserRepositoryImpl
  sl.registerSingleton<UserRepositoryImpl>(UserRepositoryImpl());

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
}
