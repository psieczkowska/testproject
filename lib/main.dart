import 'dart:async';

import 'package:fimber_io/fimber_io.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:testproject/injectable/injectable.dart';
import 'package:testproject/testproject_app.dart';
import 'package:testproject/presentation/routing/router.gr.dart';
import 'package:testproject/injectable/staging_environment.dart';

const String _environmentDefineKey = 'ENVIRONMENT';
const String _prodEnvironmentFullName = 'production';

const _supportedEnvironments = [
  Environment.prod, 
  Environment.dev, 
  StagingEnvironment.staging,
];

Future<void>? main() => runMobileApp(_getEnvironment());

Future<void>? runMobileApp(final String environment) => runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp();
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      if (!_supportedEnvironments.contains(environment)) {
        throw ArgumentError('Environment $environment is not supported');
      }
      if (environment != Environment.test && environment != Environment.prod) {
        Fimber.plantTree(DebugTree(useColors: true));
      }
      configureDependencies(environment);
      runApp(TestprojectApp(MainRouter()));
    }, (err, st) {

    },
);

String _getEnvironment() {
  const baseEnvironment = String.fromEnvironment(_environmentDefineKey, defaultValue: Environment.prod);
  return baseEnvironment == _prodEnvironmentFullName ? Environment.prod : baseEnvironment;
}