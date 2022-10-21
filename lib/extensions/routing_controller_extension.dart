import 'package:auto_route/auto_route.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:flutter/widgets.dart';

extension PopUntilWithResult on StackRouter {
  Future<void> popUntilWithResult<T>(BuildContext context, String name, T result) async {
    late String routeName;

    try {
      final previousRoutePageIndex = stack.length - 2;
      final previousRoutePage = stack[previousRoutePageIndex];

      routeName = previousRoutePage.routeData.name;
    } catch (e) {
      if (stack.length == 1) {
        Fimber.e('Trying to pop first item in AutoRoute stack!');

        return;
      }
    }

    if (routeName != name) {
      await pop();
      popUntilWithResult(context, name, result);
    } else {
      pop(result);
    }
  }
}

class PopNavigationResult {
  const PopNavigationResult.success();
}
