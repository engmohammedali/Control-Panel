import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/widgets/shimmer_loading.dart';
import 'package:controlpanel/features/students/data/model/student.dart';
import 'package:controlpanel/features/students/logic/student_cubit.dart';
import 'package:controlpanel/features/students/logic/student_state.dart';
import 'package:controlpanel/features/students/view/widgets/custom_student_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentBuilderWidget extends StatelessWidget {
  const StudentBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen:
          (previous, current) =>
              previous != current ||
              current is StudentStateFailure ||
              current is StudentStateSuccess ||
              current is StudentStateLoading,
      builder: (context, state) {
        if (state is StudentStateLoading) {
          return setUpLoading();
        }
        if (state is StudentStateFailure) {
          return setUpError(context, state.message);
        }

        if (state is StudentStateSuccess) {
          return setUpSuccess(state.students);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget setUpSuccess(List<Student> students) {
    return Flexible(
      child: ListView.builder(
        itemCount: students.length,
        itemBuilder:
            (context, index) =>
                CustomStudentWidget(student: students[index], onTapped: () {}),
      ),
    );
  }

  Widget setUpError(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Toast().error(context, message);
    });

    return Center(child: Text("Error $message"));
  }

  Widget setUpLoading() {
    return ShimmerLoading();
  }
}
