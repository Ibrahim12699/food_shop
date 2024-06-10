part of 'menu_cubit.dart';

@freezed
class MenuState<T> with _$MenuState {
  const factory MenuState.initial() = _Initial<T>;

  const factory MenuState.backFromProducts() = BackFromProducts<T>;
}
