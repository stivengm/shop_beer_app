import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    

  }

  Future getMethodsPay() async {

    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', 'medios_pago.json');
    print(url);
    var response = await http.get(url);

    print(response);
    // https://shop-beer-default-rtdb.firebaseio.com/medios_pago.json

  }
}
