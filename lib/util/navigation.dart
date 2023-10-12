import 'package:flutter/material.dart';
import 'package:running_crew_app/navigaionpage/home.dart';
import 'package:running_crew_app/navigaionpage/mypage.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: "홈",
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.account_circle),
            label: "마이페이지",
            selectedIcon: Icon(
              Icons.account_circle,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
        animationDuration: const Duration(microseconds: 500),
      ),
      // appBar: AppBar(
      //   title: Text("Running-crew"),
      // ),
      body: Center(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
            HomePage(),
            MyPage(),
          ],
        ),
      ),
    );
  }
}
