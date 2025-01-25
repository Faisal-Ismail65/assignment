part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class FetchUsers extends UserEvent {
  final int page;
  FetchUsers({required this.page});
}
