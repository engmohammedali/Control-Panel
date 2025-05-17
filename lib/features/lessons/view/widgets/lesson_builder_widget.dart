import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/routing/routes.dart';
import 'package:controlpanel/core/widgets/shimmer_loading.dart';
import 'package:controlpanel/features/lessons/data/model/lesson.dart';
import 'package:controlpanel/features/lessons/logic/lesson_cubit.dart';
import 'package:controlpanel/features/lessons/logic/lesson_state.dart';
import 'package:controlpanel/features/lessons/view/widgets/custom_lesson_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonBuilderWidget extends StatelessWidget {
  final int instituteId;
  final int centerId;
  final int roomId;
  const LessonBuilderWidget({
    super.key,
    required this.instituteId,
    required this.centerId,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      buildWhen:
          (previous, current) =>
              previous != current ||
              current is LessonStateFailure ||
              current is LessonStateSuccess ||
              current is LessonStateLoading,
      builder: (context, state) {
        if (state is LessonStateLoading) {
          return setUpLoading();
        }
        if (state is LessonStateFailure) {
          return setUpError(context, state.message);
        }

        if (state is LessonStateSuccess) {
          return setUpSuccess(state.lessons);
        }

        return setUpSuccess([]);
      },
    );
  }

  Widget setUpSuccess(List<Lesson> lessons) {
    if (lessons.isEmpty) {
      return const Center(child: Text("No lesson added"));
    }
    return Expanded(
      child: ListView.builder(
        itemCount: lessons.length,
        itemBuilder:
            (context, index) => CustomLessonWidget(
              lesson: lessons[index],
              onTapped: () {
                Navigator.pushNamed(
                  context,
                  Routes.lessonDetails,
                  arguments: [instituteId, centerId, roomId, lessons[index].id],
                );
              },
            ),
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
