import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(CurrentIndexState(currentIndex: 0)) {
    on<ChangePageEvent>((event, emit) {
      emit(CurrentIndexState(currentIndex: event.index));
    });
  }
}
