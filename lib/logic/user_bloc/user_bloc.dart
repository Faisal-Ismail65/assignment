import 'package:assignment/data/exceptions/http_exceptions.dart';
import 'package:assignment/data/models/user_model.dart';
import 'package:assignment/data/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final PagingController<int, User> pagingController =
      PagingController(firstPageKey: 1);
  UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
    pagingController.addPageRequestListener((pageKey) {
      add(FetchUsers(page: pageKey));
    });
    on<FetchUsers>((event, emit) async {
      try {
        final response = await userRepository.fetchUsers(page: event.page);
        final hasNextPage = response.results?.isNotEmpty ?? false;
        if (hasNextPage) {
          pagingController.appendPage(response.results ?? [], event.page + 1);
          emit(UserLoaded(users: response.results ?? [], hasNextPage: true));
        } else {
          pagingController.appendLastPage([]);
          emit(UserLoaded(users: [], hasNextPage: false));
        }
      } on FetchDataException catch (e) {
        emit(UserError(message: e.toString()));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
  }
}
