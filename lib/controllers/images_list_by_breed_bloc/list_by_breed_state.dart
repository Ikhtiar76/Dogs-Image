import 'package:dogss/model/list_by_breed_model.dart';

abstract class ListByBreedState {
  Object? get properties => [];
  ListByBreedState();
}

class ListByBreedLoadingState extends ListByBreedState {}

class ListByBreedErrorState extends ListByBreedState {}

class ListByBreedSuccessState extends ListByBreedState {
  final ListByBreedModel listByBreedModel;

  ListByBreedSuccessState({required this.listByBreedModel});
  @override
  Object? get properties => [listByBreedModel];
}
