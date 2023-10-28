import 'package:dogss/controllers/images_list_by_breed_bloc/list_by_breed_bloc.dart';
import 'package:dogss/controllers/list_by_breed_subBreed_bloc/list_by_breed_subBreed_bloc.dart';
import 'package:dogss/controllers/random_image_bloc/dashboard_bloc.dart';
import 'package:dogss/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controllers/random_image_breed_subbreed_bloc/random_image_breed_subbreed_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashBoardBloc(),
        ),
        BlocProvider(
          create: (context) => ListByBreedBloc(),
        ),
        BlocProvider(
          create: (context) => RandomImageBreedSubBreedBloc(),
        ),
        BlocProvider(
          create: (context) => ListByBreedSubBreedBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
      ),
    );
  }
}
