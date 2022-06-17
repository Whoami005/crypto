import 'package:coinmarketcap/screens/home/bloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.initial) {
          context.read<HomeCubit>().fetch();
        }
        if (state.status == HomeStatus.loaded) {
          return Scaffold(
            body: Center(child: Text(state.result[0].coinInfo!.name!)),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.ac_unit),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
