import 'package:dogss/controllers/images_list_by_breed_bloc/list_by_breed_event.dart';
import 'package:dogss/controllers/images_list_by_breed_bloc/list_by_breed_state.dart';
import 'package:dogss/model/list_by_breed_model.dart';

import 'package:dogss/network/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListByBreedBloc extends Bloc<ListByBreedEvent, ListByBreedState> {
  ListByBreedBloc() : super(ListByBreedLoadingState()) {
    on<GetImagesListByBreedEvent>((event, emit) async {
      emit(ListByBreedLoadingState());
      try {
        final response =
            await ApiService.getImagesListByBreed(breedName: event.breedName);

        ListByBreedModel listByBreedModel =
            ListByBreedModel.fromJson(response.data);
        emit(
          ListByBreedSuccessState(listByBreedModel: listByBreedModel),
        );
      } catch (e) {
        emit(ListByBreedErrorState());
      }
    });
  }
}
