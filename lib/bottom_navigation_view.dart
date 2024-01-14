import 'package:flutter/material.dart';
import 'package:training/views/home_view.dart';
import 'package:training/views/search_view.dart';
import 'package:training/views/wallet_view.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});
  static String id = 'bottomNavigationPage';
  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _pageSelected = 0;
  final _pageController = PageController();

  final _pages = [
    const HomePage(),
    const WalletPage(),
    const SearchPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageSelected = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageSelected,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'My Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
