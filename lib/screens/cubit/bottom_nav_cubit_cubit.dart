import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/screens/mainscreen/home_screen.dart';

part 'bottom_nav_cubit_state.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void onChanged(int index) {
    emit(index);
  }

  
}
