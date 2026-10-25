import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/internet/presentation/cubit/internet_cubit.dart';


class InternetListener extends StatelessWidget {
  final Widget child;

  const InternetListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetDisconnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No Internet Connection'),
            ),
          );
        }

        if (state is InternetConnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Internet Connected'),
            ),
          );
        }
      },
      child: child,
    );
  }
}