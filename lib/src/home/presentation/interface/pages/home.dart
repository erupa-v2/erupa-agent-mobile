import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../shared/presentation/i18n/localization.dart';
import '../../../../menu/presentation/interface/pages/menu.dart';

/// Home Page UI
class HomePage extends StatefulWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final controller = PageController();
  final currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Container(
            color: Colors.amber,
            child: const Text('Home'),
          ),
          Container(
            color: Colors.lightGreen,
            child: const Text('Requests'),
          ),
          Container(
            color: Colors.amberAccent,
            child: const Text('Inbox'),
          ),
          MenuPage(),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentPage,
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value,
          selectedItemColor: Colors.black,
          onTap: (value) {
            currentPage.value = value;
            controller.animateToPage(
              value,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
            );
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.grey.shade50,
              icon: const Icon(IconlyBold.discovery),
              label: localizations.explore,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey.shade50,
              icon: const Icon(IconlyBold.document),
              label: localizations.request,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey.shade50,
              icon: const Icon(IconlyBold.chat),
              label: localizations.inbox,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey.shade50,
              icon: const Icon(IconlyBold.filter),
              label: localizations.menu,
            ),
          ],
        ),
      ),
    );
  }
}
