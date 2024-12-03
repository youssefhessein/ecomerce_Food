import 'package:flutter/material.dart';
import 'package:flutter_ecomerce2/Screens/ChocolatePage.dart';
import 'package:flutter_ecomerce2/Screens/CookiesPage.dart';
import 'package:flutter_ecomerce2/Screens/MacaroonsPage.dart';
import 'package:flutter_ecomerce2/Screens/favorite_Screen.dart';
import 'package:flutter_ecomerce2/Screens/Cart.dart';
import 'package:flutter_ecomerce2/Screens/models/Cubit_product_model.dart';
import '../Theme/Themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // الفهرس الحالي

  // تغيير الفهرس عند اختيار عنصر من الـ BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ModelCubit cubit = ModelCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dehaze),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex, // عرض الصفحة بناءً على الفهرس
        children: [
          // الصفحة الرئيسية مع التبويبات
          DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Column(
                  children: [
                    Text(
                      'Hungry?',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Order & Eat.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Cookies'),
                    Tab(text: 'Macaroons'),
                    Tab(text: 'Chocolate'),
                  ],
                ),
              ),
              body:  TabBarView(
                children: [
                  Cookies(),
                  Macaroons(),
                  Chocolate(),
                ],
              ),
            ),
          ),
          // شاشة المفضلات
          const FavoriteScreen(),
          // شاشة عربة التسوق
          CartScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.navBarColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: AppTheme.primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          currentIndex: _currentIndex, // الفهرس الحالي
          onTap: _onItemTapped, // تحديث الفهرس عند الضغط
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite_border_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
