import 'package:bored_api/data/models/BoredActivityModel.dart';
import 'package:bored_api/home/bloc/home_bloc.dart';
import 'package:bored_api/services/boredService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bored'),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
          RepositoryProvider.of<BoredService>(context),
        )..add(LoadApiEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return _buildLoadingState();
            }
            if (state is HomeLoadedState) {
              return _buildLoadedWidgetState(context, state.boredActivityModel);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoadedWidgetState(
      BuildContext context, BoredActivityModel boredActivityModel) {
    return Column(
      children: [
        Text(boredActivityModel.activity),
        Text(boredActivityModel.type),
        Text(boredActivityModel.participants.toString()),
        ElevatedButton(
          onPressed: () =>
              BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
          child: Text('LOAD EVENT'),
        ),
      ],
    );
  }
}
