import 'package:flutter/material.dart';

import 'home_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(13, 19, 65, 1.0)),
        useMaterial3: true,
      ),
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color.fromRGBO(41, 50, 111, 1.0),
              // Color.fromRGBO(95, 105, 150, 1),
              // Color.fromRGBO(240, 245, 251, 1),
              // Color.fromRGBO(245, 245, 245, 1),
              Colors.white,
            ],
          ),
        ),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: const Icon(
                Icons.list_rounded,
                color: Colors.white,
              ),
              title: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text("data")],
                ),
              ),
              actions: [
                ElevatedButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const BottomTabBar(),
            body: const TabBarView(children: [
              HomeTab(),
              Text("Helo"),
            ]),
          ),
        ),
      ),
    );
  }
}

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({
    super.key,
  });

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const ShapeDecoration(
        shadows: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 9,
          ),
          BoxShadow(color: Colors.white)
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
      ),
      child: const TabBar(
        indicatorPadding: EdgeInsets.only(bottom: 8),
        indicatorColor: Color.fromRGBO(20, 30, 115, 1),
        tabs: [
          Tab(
              icon: Icon(
            Icons.home_rounded,
          )),
          Tab(icon: Icon(Icons.pin_drop_outlined))
        ],
      ),
    );
  }
}
