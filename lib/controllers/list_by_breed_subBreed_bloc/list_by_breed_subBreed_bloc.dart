import 'package:dogss/controllers/list_by_breed_subBreed_bloc/list_by_breed_subBreed_event.dart';
import 'package:dogss/controllers/list_by_breed_subBreed_bloc/list_by_breed_subBreed_state.dart';
import 'package:dogss/model/list_by_breed_model.dart';

import 'package:dogss/network/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListByBreedSubBreedBloc
    extends Bloc<ListByBreedSubBreedEvent, ListByBreedSubBreedState> {
  ListByBreedSubBreedBloc() : super(ListByBreedSubBreedLoadingState()) {
    on<GetImagesListByBreedSubBreedEvent>((event, emit) async {
      emit(ListByBreedSubBreedLoadingState());
      try {
        final response = await ApiService.getImagesListByBreedSubBreed(
            breedName: event.breedName, subBreedName: event.subBreedName);

        ListByBreedModel listByBreedModel =
            ListByBreedModel.fromJson(response.data);
        emit(
          ListByBreedSubBreedSuccessState(listByBreedModel: listByBreedModel),
        );
      } catch (e) {
        emit(ListByBreedSubBreedErrorState());
      }
    });
  }
}
