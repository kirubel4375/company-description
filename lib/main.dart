import 'package:company_description/controllers/scroll_cont.dart';
import 'package:company_description/register.dart';
import 'package:company_description/utils/responsive_layout.dart';
import 'package:company_description/widgets/contact.dart';
import 'package:company_description/widgets/navbar.dart';
import 'package:company_description/widgets/small_child.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(MyCompanyWebsite());
}

class MyCompanyWebsite extends StatelessWidget {
  final routerDelegate = MyRouterDelegate();

  MyCompanyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Company Website',
      routerDelegate: routerDelegate,
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  MyRoutePath _currentPath = MyRoutePath.home();

  final List<MyRoutePath> _history = [];

  List<MyRoutePath> get history => List.unmodifiable(_history);

  @override
  MyRoutePath get currentConfiguration => _currentPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: HomePage(onNavigate: navigateTo)),
        if (_currentPath.isRegisterPage)
          MaterialPage(child: RegisterScreen(onNavigate: navigateTo)),
        if (_currentPath.isContactPage)
          MaterialPage(child: ContactPage(onNavigate: navigateTo)),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (_history.isNotEmpty) {
          _history.removeLast();
          _currentPath = _history.last;
        }

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    _currentPath = configuration;
    if (!_history.contains(configuration)) {
      _history.add(configuration);
    }

    notifyListeners();
  }

  void navigateTo(MyRoutePath path) {
    setNewRoutePath(path);
  }
}

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty || uri.pathSegments.first == 'home') {
      return MyRoutePath.home();
    }

    if (uri.pathSegments.first == 'register') {
      return MyRoutePath.register();
    }

    if (uri.pathSegments.first == 'contact') {
      return MyRoutePath.contact();
    }

    return MyRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutePath configuration) {
    return RouteInformation(location: configuration.location);
  }
}

class MyRoutePath {
  final String location;

  MyRoutePath.home() : location = '/home';
  MyRoutePath.register() : location = '/register';
  MyRoutePath.contact() : location = '/contact';
  MyRoutePath.unknown() : location = '/';

  bool get isHomePage => location == '/home';
  bool get isRegisterPage => location == '/register';
  bool get isContactPage => location == '/contact';
}

class HomePage extends StatelessWidget {
  final void Function(MyRoutePath) onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cont>(
        create:(context) => Cont(),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFF8FBFF),
          Color(0xFFFCFDFD),
        ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[NavBar(onNavigate: onNavigate), Body()],
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      largeScreen: SizedBox.shrink(),
      smallScreen: SmallChild(),
    );
  }
}
// Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('assets/images//company_logo.png', width: 200),
//               const SizedBox(height: 20),
//               const Text(
//                 'Welcome to My Company',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'We provide innovative solutions for businesses.',
//                 style: TextStyle(fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {
//                   onNavigate(MyRoutePath.contact());
//                 },
//                 child: const Text('Contact Us'),
//               ),
//             ],
//           ),
//         ),