import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/widgets/shimmer_loading.dart';
import 'package:controlpanel/features/Teachers/data/model/teacher.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_cubit.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_state.dart';
import 'package:controlpanel/features/Teachers/view/widgets/custom_teacher_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherBuilderWidget extends StatelessWidget {
  const TeacherBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherCubit, TeacherState>(
      buildWhen:
          (previous, current) =>
              previous != current ||
              current is TeacherStateFailure ||
              current is TeacherStateSuccess ||
              current is TeacherStateLoading,
      builder: (context, state) {
        if (state is TeacherStateLoading) {
          return setUpLoading();
        }
        if (state is TeacherStateFailure) {
          return setUpError(context, state.message);
        }

        if (state is TeacherStateSuccess) {
          return setUpSuccess(state.teacher);
        }
        return const SizedBox.shrink();
        // return setUpSuccess([], context);
      },
    );
  }

  Widget setUpSuccess(Teacher teacher) {
    return CustomTeacherWidget(teacher: teacher, onTaped: () {});
  }

  Widget setUpError(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Toast().error(context, message);
    });
    return Center(child: Text("Error $message"));
  }

  Widget setUpLoading() {
    return const ShimmerLoading();
  }
}
