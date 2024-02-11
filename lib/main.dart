import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bottom_tabbar.dart';
import 'home_tab.dart';
import 'notification_tab.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]);
//   runApp(DevicePreview(
//     builder: (context) => const MyApp(),
//   ));
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(13, 19, 65, 1.0)),
        useMaterial3: true,
      ),
      home: Container(
        padding: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color.fromRGBO(41, 50, 111, 1.0),
              Colors.white,
            ],
          ),
        ),
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.transparent,
            drawer: const Drawer(
              child: Text("Welcome"),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: SvgPicture.asset("assets/icons/menu_icon.svg",
                          fit: BoxFit.scaleDown));
                },
              ),
              title: Center(
                child: Image.asset(
                  'assets/app_logo.png',
                  height: kToolbarHeight,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))))),
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const BottomTabBar(),
            body: const TabBarView(children: [
              HomeTab(),
              Text("Hello"),
              Text("Hello"),
              NotificationTab(),
            ]),
          ),
        ),
      ),
    );
  }
}
