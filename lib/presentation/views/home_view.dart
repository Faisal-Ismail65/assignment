import 'package:assignment/presentation/widgets/header_widget.dart';
import 'package:assignment/presentation/widgets/users_list_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(),
            UsersListWidget(),
          ],
        ),
      ),
    );
  }
}
