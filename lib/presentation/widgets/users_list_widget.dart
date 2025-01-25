import 'package:assignment/data/models/user_model.dart';
import 'package:assignment/logic/user_bloc/user_bloc.dart';
import 'package:assignment/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<UserBloc>()..add(FetchUsers(page: 1)),
      builder: (context, state) {
        if (state is UserError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is UserLoaded) {
          final pagingController = context.read<UserBloc>().pagingController;
          return Expanded(
            child: PagedListView.separated(
              padding: const EdgeInsets.all(16.0),
              pagingController: pagingController,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              builderDelegate: PagedChildBuilderDelegate<User>(
                itemBuilder: (context, item, index) {
                  return UserCard(user: item);
                },
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
