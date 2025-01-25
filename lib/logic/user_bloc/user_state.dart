part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  final bool hasNextPage;

  UserLoaded({
    required this.users,
    required this.hasNextPage,
  });
}

class UserError extends UserState {
  final String message;

  UserError({required this.message});
}
