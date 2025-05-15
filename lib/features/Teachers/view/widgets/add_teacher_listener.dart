import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_cubit.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTeacherListener extends StatelessWidget {
  final Widget child;
  final int instituteId;
  final int centerId;
  final int roomId;
  const AddTeacherListener({
    super.key,
    required this.child,
    required this.instituteId,
    required this.centerId,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeacherCubit, TeacherState>(
      listenWhen:
          (previous, current) =>
              previous != current ||
              current is TeacherAddStateLoading ||
              current is TeacherAddStateSuccess ||
              current is TeacherAddStateFailure,
      listener: (context, state) {
        if (state is TeacherAddStateLoading) {
          _setLoading(context);
        }
        if (state is TeacherAddStateFailure) {
          return _setApAddStateSuccessFailure(context, state.message);
        }
        if (state is TeacherAddStateSuccess) {
          return _setApAddStateSuccess(context, state.message);
        }
      },
      child: child,
    );
  }

  void _setApAddStateSuccess(BuildContext context, String message) {
    Toast().success(context, message);

    context.read<TeacherCubit>().fetchTeachersCubit(
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
    );
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
    Navigator.pop(context);
  }
}
