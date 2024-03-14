import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'data/period.dart';
import 'pages/settings_page.dart';
import 'shared/constants/boxes.dart';
import 'shared/context/update_page.dart';
import 'shared/theme/app_theme.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PeriodAdapter());
  boxPeriods = await Hive.openBox<Period>('periodBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UpdatePage()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: const SettingsPage(),
    );
  }
}
