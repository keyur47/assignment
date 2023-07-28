import 'package:assignment/responsive/responsive.dart';
import 'package:flutter/material.dart';

import 'home_desktop.dart';
import 'home_mobile.dart';
import 'home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: HomeMobile(),
        tablet: HomeTab(),
        desktop: HomeDeskTop(),
      ),
    );
  }
}
