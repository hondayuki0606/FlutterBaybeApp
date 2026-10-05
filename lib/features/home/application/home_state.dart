class HomeState {
  const HomeState({
    this.thumbnails = const [],
    this.selectedIndex = 0,
    this.isLoading = false,
  });

  final List<String> thumbnails;
  final int selectedIndex;
  final bool isLoading;

  HomeState copyWith({
    List<String>? thumbnails,
    int? selectedIndex,
    bool? isLoading,
  }) {
    return HomeState(
      thumbnails: thumbnails ?? this.thumbnails,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
