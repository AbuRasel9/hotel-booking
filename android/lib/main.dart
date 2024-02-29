import 'package:buy_tickets_list/screens/home/home_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



import 'language_change/controller/language_change_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp=await SharedPreferences.getInstance();
  final String languageCode= sp.getString("languageCode") ?? "";
  runApp( MyApp(loacale: languageCode,));
}

class MyApp extends StatelessWidget {
  final String loacale;

  MyApp({super.key, required this.loacale, });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChangeController())
      ],
      child: Consumer<LanguageChangeController>(

        builder: (context, provider, child) {
          if(loacale.isEmpty){
            provider.changeLanguage(Locale("en"));
          }
          return MaterialApp(
              locale:loacale==""?Locale("en"): provider.appLocale==null?Locale("en"):provider.appLocale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'), // English
                Locale('bn'), // Spanish
              ],
              home: HomeView()
            // HomeView(),
          );
        },
      ),
    );

  }
}
