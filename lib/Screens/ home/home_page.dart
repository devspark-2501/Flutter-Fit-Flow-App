import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),

      drawer: AppDrawer(),

      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}