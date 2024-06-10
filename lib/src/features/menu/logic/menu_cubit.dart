import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.dart';

part 'menu_cubit.freezed.dart';

class MenuCubit extends Cubit<MenuState<dynamic>> {
  MenuCubit() : super(const MenuState.initial());

  void backFromProducts() {
    emit(const MenuState.backFromProducts());
    emit(const MenuState.initial());
  }
}
