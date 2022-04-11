import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodie_kyoto/ui/pages/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ja', ''),
        Locale('zh', ''),
        Locale('ko', ''),
      ],
      title: 'Flutter Demo',

      /// todo プライマリーカラーを指定
      theme: ThemeData.from(
          colorScheme: const ColorScheme.light(
        primary: Colors.red,
        secondary: Colors.greenAccent,
      )),
      darkTheme: ThemeData.from(
          colorScheme: const ColorScheme.dark(
        primary: Colors.red,
        secondary: Colors.deepPurple,
      )),
      home: const HomePage(),
    );
  }
}
