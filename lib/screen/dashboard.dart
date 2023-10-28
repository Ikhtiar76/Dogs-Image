import 'package:dogss/controllers/images_list_by_breed_bloc/list_by_breed_bloc.dart';
import 'package:dogss/controllers/images_list_by_breed_bloc/list_by_breed_event.dart';
import 'package:dogss/controllers/images_list_by_breed_bloc/list_by_breed_state.dart';
import 'package:dogss/controllers/list_by_breed_subBreed_bloc/list_by_breed_subBreed_bloc.dart';
import 'package:dogss/controllers/list_by_breed_subBreed_bloc/list_by_breed_subBreed_event.dart';
import 'package:dogss/controllers/list_by_breed_subBreed_bloc/list_by_breed_subBreed_state.dart';
import 'package:dogss/controllers/random_image_bloc/bloc_event.dart';
import 'package:dogss/controllers/random_image_bloc/bloc_state.dart';
import 'package:dogss/controllers/random_image_bloc/dashboard_bloc.dart';
import 'package:dogss/controllers/random_image_breed_subbreed_bloc/random_image_breed_subbreed_bloc.dart';
import 'package:dogss/controllers/random_image_breed_subbreed_bloc/random_image_breed_subbreed_event.dart';
import 'package:dogss/controllers/random_image_breed_subbreed_bloc/random_image_breed_subbreed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    context.read<DashBoardBloc>().add(GetRandomDogImage());
    context
        .read<ListByBreedBloc>()
        .add(GetImagesListByBreedEvent(breedName: "hound"));
    context.read<RandomImageBreedSubBreedBloc>().add(
        GetRandomImageByBreedSubBreedEvent(
            breedName: "hound", subBreedName: "afghan"));
    context.read<ListByBreedSubBreedBloc>().add(
        GetImagesListByBreedSubBreedEvent(
            breedName: "hound", subBreedName: "basset"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Random Image by breed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: BlocBuilder<DashBoardBloc, DashBoardState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SuccessState) {
                      return Image.network(
                        state.randomDogImageUrl,
                        fit: BoxFit.fill,
                      );
                    } else if (state is ErrorState) {
                      return const Center(child: Text('Something went wrong'));
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<DashBoardBloc>().add(GetRandomDogImage());
                  },
                  child: Text('Load Random Dog Image'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Images list by breed (Hound)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 200,
                child: BlocBuilder<ListByBreedBloc, ListByBreedState>(
                  builder: (context, state) {
                    if (state is ListByBreedLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ListByBreedSuccessState) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.listByBreedModel.message!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              height: 190,
                              width: 220,
                              child: Image.network(
                                state.listByBreedModel.message![index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is ListByBreedErrorState) {
                      return const Center(child: Text('Something went wrong'));
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<ListByBreedBloc>()
                        .add(GetImagesListByBreedEvent(breedName: "hound"));
                  },
                  child: Text(' Load Images list by breed (Hound)'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Random Image by breed and sub-breed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: BlocBuilder<RandomImageBreedSubBreedBloc,
                    RandomImageBreedSubBreedState>(
                  builder: (context, state) {
                    if (state is RandomImageBreedSubBreedLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is RandomImageBreedSubBreedSuccessState) {
                      return Image.network(
                        state.randomDogImageUrl,
                        fit: BoxFit.fill,
                      );
                    } else if (state is RandomImageBreedSubBreedErrorState) {
                      return const Center(child: Text('Something went wrong'));
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<RandomImageBreedSubBreedBloc>().add(
                        GetRandomImageByBreedSubBreedEvent(
                            breedName: "hound", subBreedName: "afghan"));
                  },
                  child: Text('Load Image'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Images list by breed and sub-breed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 200,
                child: BlocBuilder<ListByBreedSubBreedBloc,
                    ListByBreedSubBreedState>(
                  builder: (context, state) {
                    if (state is ListByBreedSubBreedLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ListByBreedSubBreedSuccessState) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.listByBreedModel.message!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              height: 190,
                              width: 220,
                              child: Image.network(
                                state.listByBreedModel.message![index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is ListByBreedSubBreedErrorState) {
                      return const Center(child: Text('Something went wrong'));
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<ListByBreedSubBreedBloc>().add(
                        GetImagesListByBreedSubBreedEvent(
                            breedName: "hound", subBreedName: "basset"));
                  },
                  child: Text('Load Image'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
