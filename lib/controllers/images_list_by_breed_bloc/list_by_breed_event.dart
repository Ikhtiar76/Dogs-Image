abstract class ListByBreedEvent {
  Object? get properties => [];
  ListByBreedEvent();
}

class GetImagesListByBreedEvent extends ListByBreedEvent {
  final String breedName;

  GetImagesListByBreedEvent({required this.breedName});
  @override
  Object? get properties => [breedName];
}
