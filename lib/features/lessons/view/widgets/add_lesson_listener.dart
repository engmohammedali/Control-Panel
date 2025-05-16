import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/lessons/logic/lesson_cubit.dart';
import 'package:controlpanel/features/lessons/logic/lesson_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLessonListener extends StatelessWidget {
  final Widget child;
  final int instituteId;
  final int centerId;
  final int roomId;

  const AddLessonListener({
    super.key,
    required this.child,
    required this.instituteId,
    required this.roomId,
    required this.centerId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LessonCubit, LessonState>(
      listenWhen:
          (previous, current) =>
              previous != current ||
              current is LessonAddStateLoading ||
              current is LessonAddStateSuccess ||
              current is LessonAddStateFailure,
      listener: (context, state) {
        if (state is LessonAddStateLoading) {
          _setLoading(context);
        }
        if (state is LessonAddStateFailure) {
          return _setAddStateSuccessFailure(context, state.message);
        }
        if (state is LessonAddStateSuccess) {
          return _setAddLessonStateSuccess(context, state.message);
        }
      },
      child: child,
    );
  }

  void _setAddLessonStateSuccess(BuildContext context, String message) {
    Toast().success(context, message);
    context.read<LessonCubit>().fetchLessonsCubit(
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
    );
    Navigator.pop(context);
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
