import 'package:dogss/controllers/random_image_bloc/bloc_event.dart';
import 'package:dogss/controllers/random_image_bloc/bloc_state.dart';
import 'package:dogss/model/random_image_model.dart';
import 'package:dogss/network/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(LoadingState()) {
    on<GetRandomDogImage>((event, emit) async {
      emit(LoadingState());
      try {
        final response = await ApiService.getRandomDogImage();

        RandomImageModel randomImageModel =
            RandomImageModel.fromJson(response.data);
        emit(SuccessState(
            randomDogImageUrl: randomImageModel.message.toString()));
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
