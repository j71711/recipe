import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'home_nav_event.dart';
part 'home_nav_state.dart';



class HomeNavBloc extends Bloc<HomeNavEvent, HomeNavState> {
  HomeNavBloc() : super(HomeNavInitial()) {
    on<ChangeHomeNavEvent>((event, emit) {
      emit(HomeNavChangedState(currentIndex: event.index));
    });

  }
}