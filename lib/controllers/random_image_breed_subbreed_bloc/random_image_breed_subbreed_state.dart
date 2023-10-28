abstract class RandomImageBreedSubBreedState {
  Object? get properties => [];
  RandomImageBreedSubBreedState();
}

class RandomImageBreedSubBreedLoadingState
    extends RandomImageBreedSubBreedState {}

class RandomImageBreedSubBreedErrorState
    extends RandomImageBreedSubBreedState {}

class RandomImageBreedSubBreedSuccessState
    extends RandomImageBreedSubBreedState {
  final String randomDogImageUrl;

  RandomImageBreedSubBreedSuccessState({required this.randomDogImageUrl});
  @override
  Object? get properties => [randomDogImageUrl];
}
