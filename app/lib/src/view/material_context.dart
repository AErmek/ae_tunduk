import 'package:cv_scan_app/src/routing/router_state_mixin.dart';
import 'package:cv_scan_app/src/view/app_builder.dart';
import 'package:flutter/material.dart';

class MaterialContext extends StatefulWidget {
  const MaterialContext({super.key});

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext> with RouterStateMixin {
  // late AppSettings settings;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // settings = SettingsScope.settingsOf(context);
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    ///Meta
    // title: Config.i.specific.appTitle,
    // onGenerateTitle: (context) => context.t.appTitle,
    debugShowCheckedModeBanner: false,

    ///Router
    routerConfig: router,

    ///Localization
    // locale: settings.locale,
    // supportedLocales: Translations.delegate.supportedLocales,
    // localizationsDelegates: const [
    //   Translations.delegate,
    //   GlobalMaterialLocalizations.delegate,
    //   GlobalWidgetsLocalizations.delegate,
    //   GlobalCupertinoLocalizations.delegate,
    // ],

    ///Theme
    // theme: lightAppThemeBuilder.themeData,
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A73E8)), useMaterial3: true),

    ///Scopes
    builder: (context, child) => AppBuilder(router: router, child: child ?? const SizedBox.shrink()),
  );
}
