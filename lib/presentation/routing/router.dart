import 'package:auto_route/auto_route.dart';

import 'package:testproject/presentation/page/initial_page/initial_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: InitialPage,
      initial: true,
    )
  ],
)

class $MainRouter {}
