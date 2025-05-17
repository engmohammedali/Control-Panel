import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_cubit.dart';
import 'package:controlpanel/features/Teachers/view/widgets/add_teacher_widget.dart';
import 'package:controlpanel/features/Teachers/view/widgets/teacher_builder_widget.dart';
import 'package:controlpanel/features/lessons/logic/lesson_cubit.dart';
import 'package:controlpanel/features/lessons/view/widgets/add_lesson_widget.dart';
import 'package:controlpanel/features/lessons/view/widgets/lesson_builder_widget.dart';
import 'package:controlpanel/features/students/logic/student_cubit.dart';
import 'package:controlpanel/features/students/view/widgets/add_student_widget.dart';
import 'package:controlpanel/features/students/view/widgets/student_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentView extends StatelessWidget {
  final int instituteId;
  final int centerId;
  final int roomId;
  const StudentView({
    super.key,
    required this.instituteId,
    required this.centerId,
    required this.roomId,
  });
  void _addStudent(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<StudentCubit>(),
          child: AddStudentWidget(
            instituteId: instituteId,
            centerId: centerId,
            roomId: roomId,
          ),
        );
      },
    );
  }

  void _addTeacher(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<TeacherCubit>(),
          child: AddTeacherWidget(
            roomId: roomId,
            instituteId: instituteId,
            centerId: centerId,
          ),
        );
      },
    );
  }

  void _addLesson(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<LessonCubit>(),
          child: AddLessonWidget(
            instituteId: instituteId,
            centerId: centerId,
            roomId: roomId,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        spacing: 10.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: 'addTeacher',
            backgroundColor: ColorsManager.moreLighterGray,
            onPressed: () {
              _addTeacher(context);
            },
            icon: Icon(Icons.add, color: ColorsManager.mainBlue),
            label: Text(
              'add Teacher',
              style: TextStyle(color: ColorsManager.darkBlue),
            ),
          ),
          FloatingActionButton.extended(
            heroTag: 'addStudent',
            backgroundColor: ColorsManager.moreLighterGray,
            onPressed: () {
              _addStudent(context);
            },
            icon: Icon(Icons.add, color: ColorsManager.mainBlue),
            label: Text(
              'add Student',
              style: TextStyle(color: ColorsManager.darkBlue),
            ),
          ),

          FloatingActionButton.extended(
            heroTag: 'addLesson',
            backgroundColor: ColorsManager.moreLighterGray,
            onPressed: () {
              _addLesson(context);
            },
            icon: Icon(Icons.add, color: ColorsManager.mainBlue),
            label: Text(
              'add Lesson',
              style: TextStyle(color: ColorsManager.darkBlue),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          ' Student',
          style: TextStyle(color: ColorsManager.darkBlue),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

        child: Column(
          spacing: 20.h,
          children: [
            TeacherBuilderWidget(),
            Divider(color: ColorsManager.darkBlue, thickness: 1),
            LessonBuilderWidget(
              instituteId: instituteId,
              centerId: centerId,
              roomId: roomId,
            ),
            StudentBuilderWidget(),
          ],
        ),
      ),
    );
  }
}
