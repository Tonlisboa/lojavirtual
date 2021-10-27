import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lojavirtual/common/custrom_drawer/custom_drawer.dart';
import 'package:lojavirtual/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:lojavirtual/models/page_manager.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          LoginScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home'),
            ),
          ),
          Container(
            color: Colors.red,
            child: ElevatedButton(
              onPressed: () {
                pageController.jumpToPage(1);
              },
              child: Text('Próximo'),
            ),
          ),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
        ],
      ),
    );
  }
}
