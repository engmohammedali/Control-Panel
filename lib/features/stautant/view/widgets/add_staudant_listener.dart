import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/stautant/logic/staudant_cubit.dart';
import 'package:controlpanel/features/stautant/logic/staudant_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStaudantListener extends StatelessWidget {
  final Widget child;
  const AddStaudantListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StaudantCubit, StaudantState>(
      listenWhen:
          (previous, current) =>
              previous != current ||
              current is StaudantAddStateLoading ||
              current is StaudantAddStateSuccess ||
              current is StaudantAddStateFailure,
      listener: (context, state) {
        if (state is StaudantAddStateLoading) {
          _setLoading(context);
        }
        if (state is StaudantAddStateFailure) {
          return _setApAddStateSuccessFailure(context, state.message);
        }
        if (state is StaudantAddStateSuccess) {
          return _setApAddStateSuccess(context, state.message);
        }
      },
      child: child,
    );
  }

  void _setApAddStateSuccess(BuildContext context, String message) {
    Toast().success(context, message);
    Navigator.pop(context);
    context.read<StaudantCubit>().fetchStudentsCubit();
  }

  void _setApAddStateSuccessFailure(BuildContext context, String message) {
    Toast().error(context, message);
  }

  void _setLoading(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => const Center(
            child: CircularProgressIndicator(color: ColorsManager.mainBlue),
          ),
    ).then((value) {
      Navigator.pop(context);
    });
  }
}
