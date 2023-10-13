import 'package:flutter/material.dart';
import 'package:guzogoclone/constants/colors.dart';
import 'package:guzogoclone/presentation/providers/bottom_nav_provider.dart';
import 'package:guzogoclone/presentation/ui/tabs/notification_tab.dart';
import 'package:guzogoclone/presentation/ui/tabs/search_tab.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // int _selectedIndex =0
  
  final List<Widget> _widgetOptions = <Widget>[
    const SearchTab(),
    const Text('Booking'),
    const NotificationTab(),
    const Text('setting')
  ];

  void onItemTapped(int index) {
    Provider.of<BottomNavProvider>(context,listen: false).selectItem(index);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = Provider.of<BottomNavProvider>(context).selectedItemIndex;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade300,
        selectedItemColor: AppColors.primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
