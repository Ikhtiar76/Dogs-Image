import 'package:dogss/controllers/random_image_breed_subbreed_bloc/random_image_breed_subbreed_event.dart';
import 'package:dogss/controllers/random_image_breed_subbreed_bloc/random_image_breed_subbreed_state.dart';
import 'package:dogss/model/random_image_model.dart';
import 'package:dogss/network/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomImageBreedSubBreedBloc
    extends Bloc<RandomImageBreedSubBreedEvent, RandomImageBreedSubBreedState> {
  RandomImageBreedSubBreedBloc()
      : super(RandomImageBreedSubBreedLoadingState()) {
    on<GetRandomImageByBreedSubBreedEvent>((event, emit) async {
      emit(RandomImageBreedSubBreedLoadingState());
      try {
        final response = await ApiService.getRandomImageBreedSubBreed(
            breed: event.breedName, subBreed: event.subBreedName);

        RandomImageModel randomImageModel =
            RandomImageModel.fromJson(response.data);
        emit(RandomImageBreedSubBreedSuccessState(
            randomDogImageUrl: randomImageModel.message.toString()));
      } catch (e) {
        emit(RandomImageBreedSubBreedErrorState());
      }
    });
  }
}
