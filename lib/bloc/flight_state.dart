part of 'flight_bloc.dart';

@immutable
abstract class FlightState {}

class FlightInitial extends FlightState {}
class FlightLoading extends FlightState {}
class FlightLoaded extends FlightState {}
class FlightError extends FlightState{}

