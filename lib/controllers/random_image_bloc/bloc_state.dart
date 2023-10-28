abstract class DashBoardState {
  Object? get properties => [];
  DashBoardState();
}

class LoadingState extends DashBoardState {}

class ErrorState extends DashBoardState {}

class SuccessState extends DashBoardState {
  final String randomDogImageUrl;

  SuccessState({required this.randomDogImageUrl});
  @override
  Object? get properties => [randomDogImageUrl];
}
