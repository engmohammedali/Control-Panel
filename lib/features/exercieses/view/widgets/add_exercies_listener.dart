import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/exercieses/logic/exercies_cubit.dart';
import 'package:controlpanel/features/exercieses/logic/exercies_state.dart'
    show
        ExerciesAddStateFailure,
        ExerciesAddStateLoading,
        ExerciesAddStateSuccess,
        ExerciesState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExerciesListener extends StatelessWidget {
  final Widget child;
  final int instituteId;
  final int centerId;
  final int roomId;
  final int lessonId;
  const AddExerciesListener({
    super.key,
    required this.child,
    required this.instituteId,
    required this.roomId,
    required this.centerId,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExerciesCubit, ExerciesState>(
      listenWhen:
          (previous, current) =>
              previous != current ||
              current is ExerciesAddStateLoading ||
              current is ExerciesAddStateSuccess ||
              current is ExerciesAddStateFailure,
      listener: (context, state) {
        if (state is ExerciesAddStateLoading) {
          _setLoading(context);
        }
        if (state is ExerciesAddStateFailure) {
          return _setAddStateSuccessFailure(context, state.message);
        }
        if (state is ExerciesAddStateSuccess) {
          return _setAddStateSuccess(context, state.message);
        }
      },
      child: child,
    );
  }

  void _setAddStateSuccess(BuildContext context, String message) {
    Toast().success(context, message);
    Navigator.pop(context);
    context.read<ExerciesCubit>().fetchExerciesCubit(
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
      lessonId: lessonId,
    );
  }

  void _setAddStateSuccessFailure(BuildContext context, String message) {
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
