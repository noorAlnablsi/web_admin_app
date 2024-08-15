import 'package:flutter/material.dart';
import 'package:web_admin_app/widget/color.dart';

class MyDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const MyDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: white,
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            'Eventique',
            style: TextStyle(
                color: primary, fontSize: 20, fontFamily: 'IrishGrover'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(Icons.people, 'Customers', 0),
                _buildListTile(Icons.person, 'Company', 1),
                _buildListTile(Icons.logout, 'Logout', 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;
    return ListTile(
      leading: Icon(icon, color: isSelected ? darkSecondary : primary),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? darkSecondary : primary),
      ),
      // tileColor: isSelected ? Colors.white24 : Colors.blue,
      onTap: () => onItemTapped(index),
    );
  }
}

class CompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Company Page'));
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('SettingsPage'));
  }
}
