import 'package:flutter_test/flutter_test.dart';
import 'package:foodie_kyoto/ui/pages/home_page_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  late HomePageViewModel onTapItems;

  setUp(() {
    final container = ProviderContainer(overrides: [
      homePageViewModelProvider.overrideWithProvider(
          StateNotifierProvider<HomePageViewModel, HomePageState>(
              (ref) => HomePageViewModel())),
    ]);
    onTapItems = container.read(homePageViewModelProvider.notifier);
  });

  group('on tap nav bar', () {
    test('change index', () {
      //初期状態
      expect(onTapItems.debugState.currentIndex, 0);

      //tap list page
      onTapItems.onTapItems(1);

      //状態確認
      expect(onTapItems.debugState.currentIndex, 1);

      //tap map page
      onTapItems.onTapItems(0);

      //状態確認
      expect(onTapItems.debugState.currentIndex, 0);
    });
  });
}
