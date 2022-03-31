import 'package:flutter/material.dart';
import 'package:foodie_kyoto/ui/pages/google_map_page/google_map_page.dart';
import 'package:foodie_kyoto/ui/pages/home_page_view_model.dart';
import 'package:foodie_kyoto/ui/pages/list_page/list_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentIndex =
        ref.watch(homePageViewModelProvider.select((s) => s.currentIndex));

    const _pages = [
      GoogleMapPage(),
      ListPage(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          ref.read(homePageViewModelProvider.notifier).onTapItems(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.place_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list_rounded), label: ''),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}
