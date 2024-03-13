import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/database.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await FFLocalizations.initialize();
  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();
  ThemeMode _themeMode = ThemeMode.system;

  // late AppStateNotifier _appStateNotifier;

  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();

    // _appStateNotifier = AppStateNotifier.instance;

    // Future.delayed(Duration(milliseconds: 5),
    //     () => setState(() => _appStateNotifier.stopShowingSplashImage()));
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation) {
      return GetMaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(
                  FlutterFlowTheme.of(context).primary)),
        ),
        themeMode: _themeMode,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [
          Locale('es'),
          Locale('en'),
        ],
        initialBinding: DatabaseBinding(),
        initialRoute: Routes.LOGIN_USUARIO,
        getPages: AppPages.routes,
      );
    });
  }
}
