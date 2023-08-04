
import 'package:bloc/bloc.dart';
import 'package:flightradar/repositry/api/flightapi.dart';
import 'package:meta/meta.dart';

import '../repositry/modelclass/Flightmodel.dart';

part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  late Flightmodel flightmodel;
  Flightapi flightapi=Flightapi();
  FlightBloc() : super(FlightInitial()) {

    on<FlightEvent>((event, emit)async {
      emit(FlightLoading());
      try{

        flightmodel = await flightapi.getflightmodel();
        emit(FlightLoaded());
      } catch(e){
        print(e);
        emit(FlightError());}
    });

  }

}
