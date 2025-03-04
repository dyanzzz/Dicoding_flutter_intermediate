import 'package:declaration_navigation_redirection_4/common/url_strategy_web.dart';
import 'package:declaration_navigation_redirection_4/db/auth_repository.dart';
import 'package:declaration_navigation_redirection_4/provider/auth_provider.dart';
import 'package:declaration_navigation_redirection_4/routes/route_information_parser.dart';
import 'package:declaration_navigation_redirection_4/routes/router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  usePathUrlStrategy();
  runApp(const QuotesApp());
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({super.key});

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  late MyRouterDelegate myRouterDelegate;

  /// todo 6: add variable for create instance
  late AuthProvider authProvider;
  late MyRouteInformationParser myRouteInformationParser;

  @override
  void initState() {
    super.initState();
    final authRepository = AuthRepository();

    authProvider = AuthProvider(authRepository);

    /// todo 7: inject auth to router delegate
    myRouterDelegate = MyRouterDelegate(authRepository);
    myRouteInformationParser = MyRouteInformationParser();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => authProvider,
      child: MaterialApp.router(
        title: 'Quotes App',
        routerDelegate: myRouterDelegate,
        routeInformationParser: myRouteInformationParser,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
