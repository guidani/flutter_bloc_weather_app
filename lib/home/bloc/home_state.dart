part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState{

  final BoredActivityModel boredActivityModel;

  HomeLoadedState(this.boredActivityModel);

  @override
  // TODO: implement props
  List<Object?> get props => [boredActivityModel];
}