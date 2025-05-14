import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddInstituteListener extends StatelessWidget {
  final Widget child;
  const AddInstituteListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InstitutesCubit, InstitutesState>(
      listenWhen:
          (previous, current) =>
              previous != current ||
              current is InstitutesAddStateFailure ||
              current is InstitutesAddStateSuccess,
      listener: (context, state) {
        if (state is InstitutesAddStateLoading) {
          _setLoading(context);
        }
        if (state is InstitutesAddStateFailure) {
          return _setApAddStateSuccessFailure(context, state.message);
        }
        if (state is InstitutesAddStateSuccess) {
          return _setApAddStateSuccess(context, state.message);
        }
      },
      child: child,
    );
  }

  void _setApAddStateSuccess(BuildContext context, String message) {
    Toast().success(context, message);
    context.read<InstitutesCubit>().feathInstitutesCubit();
    Navigator.pop(context);
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
