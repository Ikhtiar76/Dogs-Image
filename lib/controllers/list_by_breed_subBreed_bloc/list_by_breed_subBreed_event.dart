// ignore: file_names
abstract class ListByBreedSubBreedEvent {
  Object? get properties => [];
  ListByBreedSubBreedEvent();
}

class GetImagesListByBreedSubBreedEvent extends ListByBreedSubBreedEvent {
  final String breedName;
  final String subBreedName;

  GetImagesListByBreedSubBreedEvent(
      {required this.breedName, required this.subBreedName});
  @override
  Object? get properties => [breedName, subBreedName];
}
