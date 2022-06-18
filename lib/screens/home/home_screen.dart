import 'package:auto_size_text/auto_size_text.dart';
import 'package:coinmarketcap/screens/home/bloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.initial) {
              context.read<HomeCubit>().fetch(page: 0);
            }
            if (state.status == HomeStatus.loaded) {
              return NotificationListener<ScrollUpdateNotification>(
                onNotification: (event) {
                  context.read<HomeCubit>().onScroll(event.metrics);
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomeCubit>().fetch(page: 0);
                  },
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 3),
                            leading: SizedBox(
                              height: 55,
                              width: 55,
                              child: Image.network(
                                "https://www.cryptocompare.com"
                                "${state.result[index].coinInfo!.imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(state.result[index].coinInfo!.name!),
                            subtitle: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: AutoSizeText(
                                    state.result[index].coinInfo!.fullName!,
                                    maxLines: 1,
                                    minFontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  state.result[index].display?.usd?.price ?? '',
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 3);
                    },
                    itemCount: state.result.length,
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

// https://www.cryptocompare.com/media/37746251/btc.png
