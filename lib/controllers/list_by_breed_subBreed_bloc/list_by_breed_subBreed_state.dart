import 'package:dogss/model/list_by_breed_model.dart';

abstract class ListByBreedSubBreedState {
  Object? get properties => [];
  ListByBreedSubBreedState();
}

class ListByBreedSubBreedLoadingState extends ListByBreedSubBreedState {}

class ListByBreedSubBreedErrorState extends ListByBreedSubBreedState {}

class ListByBreedSubBreedSuccessState extends ListByBreedSubBreedState {
  final ListByBreedModel listByBreedModel;

  ListByBreedSubBreedSuccessState({required this.listByBreedModel});
  @override
  Object? get properties => [listByBreedModel];
}
