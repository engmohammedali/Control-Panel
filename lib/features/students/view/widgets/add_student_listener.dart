import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/students/logic/student_cubit.dart';
import 'package:controlpanel/features/students/logic/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStudentListener extends StatelessWidget {
  final Widget child;
  final int instituteId;
  final int centerId;
  final int roomId;

  const AddStudentListener({
    super.key,
    required this.child,
    required this.instituteId,
    required this.roomId,
    required this.centerId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentCubit, StudentState>(
      listenWhen:
          (previous, current) =>
              previous != current ||
              current is StudentAddStateLoading ||
              current is StudentAddStateSuccess ||
              current is StudentAddStateFailure,
      listener: (context, state) {
        if (state is StudentAddStateLoading) {
          _setLoading(context);
        }
        if (state is StudentAddStateFailure) {
          return _setAddStateSuccessFailure(context, state.message);
        }
        if (state is StudentAddStateSuccess) {
          return _setAddStateSuccess(context, state.message);
        }
      },
      child: child,
    );
  }

  void _setAddStateSuccess(BuildContext context, String message) {
    Toast().success(context, message);
    Navigator.pop(context);
    context.read<StudentCubit>().fetchStudentsCubit(
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
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
