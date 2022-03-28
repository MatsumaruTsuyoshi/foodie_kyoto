import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_page_view_model.freezed.dart';

final homePageViewModelProvider =
    StateNotifierProvider.autoDispose<HomePageViewModel, HomePageState>(
        (ref) => HomePageViewModel());

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(0) int currentIndex,
  }) = _HomePageState;
}

class HomePageViewModel extends StateNotifier<HomePageState> {
  HomePageViewModel() : super(HomePageState(currentIndex: 0));

  void onTapItems(int index) {
    final currentState = state;
    state = currentState.copyWith(currentIndex: index);
  }
}
