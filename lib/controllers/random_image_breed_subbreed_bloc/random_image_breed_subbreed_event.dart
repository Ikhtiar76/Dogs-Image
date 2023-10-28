abstract class RandomImageBreedSubBreedEvent {
  Object? get properties => [];
  RandomImageBreedSubBreedEvent();
}

class GetRandomImageByBreedSubBreedEvent extends RandomImageBreedSubBreedEvent {
  final String breedName;
  final String subBreedName;

  GetRandomImageByBreedSubBreedEvent(
      {required this.breedName, required this.subBreedName});
  @override
  Object? get properties => [breedName, subBreedName];
}
