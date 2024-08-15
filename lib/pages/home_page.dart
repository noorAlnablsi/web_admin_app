import 'package:flutter/material.dart';
import 'package:web_admin_app/pages/cusomers_page.dart';
import 'package:web_admin_app/pages/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CustomersPage(),
    CompanyPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MyDrawer(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
