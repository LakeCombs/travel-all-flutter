import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/cubit/app_cubit.dart';
import 'package:sample_app/cubit/app_cubit_states.dart';
import 'package:sample_app/pages/detail_page.dart';
import 'package:sample_app/pages/home_page.dart';
import 'package:sample_app/pages/navpages/main_page.dart';
import 'package:sample_app/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is DetailState) {
            return DetailsPage();
          }

          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LoadedState) {
            return MainPage();
          } else {
            return Container(
              child: Text("Sorry could not get data from the server"),
            );
          }
        },
      ),
    );
  }
}
