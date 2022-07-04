import 'package:bored_api/home/bloc/home_bloc.dart';
import 'package:bored_api/services/boredService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<BoredService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bored'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  Text(state.activityName),
                  Text(state.activityType),
                  Text(state.participants.toString()),
                  ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
                    child: Text('LOAD EVENT'),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
