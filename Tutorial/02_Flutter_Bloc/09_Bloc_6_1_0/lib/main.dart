import 'package:blocconcepts/logic/cubit/counter_cubit.dart';
import 'package:blocconcepts/logic/cubit/internet_cubit.dart';
import './presentations/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(), connectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({key, required this.appRouter, required this.connectivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (internetCubitContext) =>
                // here we can see that 'internetCubitContext' is the new context instance for InternetCubit bloc provider
                InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(
            create: (counterCubitContext) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateroute,
      ),
    );
  }
}
