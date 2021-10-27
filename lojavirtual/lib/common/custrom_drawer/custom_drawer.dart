import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custrom_drawer/drawer_file.dart';

class CustomDrawer extends StatelessWidget {

   final PageController pageController = PageController();
 
  @override
   Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerFile(
            iconData: Icons.home,
            title: "Início",
            page: 0,
          ),
          DrawerFile(
            iconData: Icons.list,
            title: "Produtos",
            page: 1,
          ),
          DrawerFile(
            iconData: Icons.playlist_add_check,
            title: "Meus Pedidos",
            page: 2,
          ),
          DrawerFile(
            iconData: Icons.location_on,
            title: "Lojas",
            page: 3,
          ),
        ],
      ),
    );
  }
}
