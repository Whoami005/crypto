import 'package:coinmarketcap/repositories/cryptocurrency_repository.dart';
import 'package:coinmarketcap/screens/home/bloc/home_cubit.dart';
import 'package:coinmarketcap/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CryptoRepository(),
      child: BlocProvider(
        create: (BuildContext context) => HomeCubit(
          cryptoRepository: CryptoRepository(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
