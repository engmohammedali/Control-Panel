import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/centers/logic/center_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCenterListener extends StatelessWidget {
  final Widget child;
  const AddCenterListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CenterCubit, CenterState>(
      listenWhen:
          (previous, current) =>
              previous != current ||
              current is CenterStateFailure ||
              current is CenterStateSuccess ||
              current is CenterStateLoading,
      listener: (context, state) {
        if (state is CenterStateLoading) {
          _setLoading(context);
        }
        if (state is CenterStateFailure) {
          return _setApAddStateSuccessFailure(context, state.message);
        }
        if (state is CenterStateSuccess) {
          return _setApAddStateSuccess(context, state.message);
        }
      },
      child: child,
    );
  }

  void _setApAddStateSuccess(BuildContext context, String message) {
    Toast().success(context, message);
    context.read<CenterCubit>().fetchCenterCubit();
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
