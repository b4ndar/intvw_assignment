import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'features/bookmarks/presentation/bookmarks_presentation.dart';
import 'features/users/presentation/users_presentation.dart';
import 'injection_container.dart';
import 'main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(MultiProvider(
      providers: providers(),
      child: const MyApp()));
}

List<SingleChildWidget> providers() {
  return [
      ChangeNotifierProvider(create: (_) => UserProvider(sl(),sl())),
      ChangeNotifierProvider(create: (_) => BookmarkProvider()),
    ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,background: AppColor.darkBackgroundColor),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
