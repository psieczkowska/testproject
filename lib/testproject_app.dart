import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testproject/generated/l10n.dart';
import 'package:testproject/style/app_typography.dart';
import 'package:testproject/style/themes.dart';
import 'package:testproject/utils/hide_keyboard.dart';
import 'package:testproject/utils/l10n_model.dart';
import 'package:provider/provider.dart';

import 'extensions/extension_mixin.dart';

const _tabletSize = Size(750, 1334);
const _mobileSize = Size(375, 667);

class TestprojectApp extends StatelessWidget implements ExtensionMixin {
  final RootStackRouter mainRouter;

  const TestprojectApp(this.mainRouter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _globalUnfocusKeyboard(
        context: context,
        child: ScreenUtilInit(
          designSize: Device.get().isTablet ? _tabletSize : _mobileSize,
          builder: (_, __) => MultiProvider(
            providers: [ListenableProvider(create: (_) => ThemeModel())],
            child: Consumer(builder: (context, model, child) {
              return MaterialApp.router(
                routerDelegate: mainRouter.delegate(),
                routeInformationParser: mainRouter.defaultRouteParser(),
                theme: ThemeData(
                  textSelectionTheme: TextSelectionThemeData(selectionHandleColor: context.getColors().mainColor),
                  colorScheme: ColorScheme.light(),
                  fontFamily: AppTypography.fontFamily,
                ),
                localizationsDelegates: const [
                  Strings.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: const Locale(defaultLanguageCode),
                supportedLocales: const [
                  // After enabling new Locale, remember to add it to Localizations in Info.plist of iOS project and to resConfig in android/app/build.gradle
                  // When ready to add more locale, provider is prepared. We have to change this to line "supportedLocales: Strings.delegate.supportedLocales,"
                  Locale(defaultLanguageCode),
                ],
              );
            }),
          ),
        ),
      );


  Widget _globalUnfocusKeyboard({
    required BuildContext context,
    required Widget child,
  }) =>
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => hideKeyboard(context),
        child: child,
      );
}