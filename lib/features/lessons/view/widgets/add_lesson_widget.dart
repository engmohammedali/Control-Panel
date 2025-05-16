import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/lessons/logic/lesson_cubit.dart';
import 'package:controlpanel/features/lessons/view/widgets/add_lesson_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddLessonWidget extends StatefulWidget {
  final int instituteId;
  final int centerId;
  final int roomId;

  const AddLessonWidget({
    super.key,
    required this.instituteId,
    required this.centerId,
    required this.roomId,
  });

  @override
  State<AddLessonWidget> createState() => _AddLessonWidgetState();
}

class _AddLessonWidgetState extends State<AddLessonWidget> {
  void validateThenDoAddLesson(BuildContext context) {
    if (context.read<LessonCubit>().formkey.currentState!.validate()) {
      context.read<LessonCubit>().addLessonCubit(
        instituteId: widget.instituteId,
        centerId: widget.centerId,
        roomId: widget.roomId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return AddLessonListener(
      roomId: widget.roomId,
      centerId: widget.centerId,
      instituteId: widget.instituteId,
      child: Form(
        key: context.read<LessonCubit>().formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.w),
            width: double.infinity,
            height: height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              spacing: 15.h,
              children: [
                Text('title'),
                AppTextFormField(
                  hintText: 'title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  controller: context.read<LessonCubit>().title,
                ),
                Text('description'),
                AppTextFormField(
                  hintText: 'description',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                  controller: context.read<LessonCubit>().description,
                ),

                verticalspace(5),
                AppTextButton(
                  buttonText: 'add',
                  textStyle: TextStyles.font18DarkBlueBold.copyWith(
                    color: ColorsManager.white,
                  ),
                  onPressed: () {
                    validateThenDoAddLesson(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
