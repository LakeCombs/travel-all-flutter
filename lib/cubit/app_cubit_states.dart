import 'package:equatable/equatable.dart';
import 'package:sample_app/model/data_model.dart';

abstract class CubitState extends Equatable {
  const CubitState();
}

class InitialState extends CubitState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitState {
  const LoadedState(this.places);

  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailState extends CubitState {
  DetailState(this.places);

  final DataModel places;
  @override
  List<Object> get props => [places];
}
