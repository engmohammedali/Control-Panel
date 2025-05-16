import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/exercieses/logic/exercies_cubit.dart';
import 'package:controlpanel/features/exercieses/view/widgets/add_exercies_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddExerciesWidget extends StatefulWidget {
  final int instituteId;
  final int centerId;
  final int roomId;
  final int lessonId;
  // final int studentId;
  const AddExerciesWidget({
    super.key,
    required this.instituteId,
    required this.centerId,
    required this.roomId,
    required this.lessonId,
  });

  @override
  State<AddExerciesWidget> createState() => _AddExerciesWidgetState();
}

class _AddExerciesWidgetState extends State<AddExerciesWidget> {
  void validateThenDoAddExercies(BuildContext context) {
    if (context.read<ExerciesCubit>().formkey.currentState!.validate()) {
      context.read<ExerciesCubit>().addExerciesCubit(
        instituteId: widget.instituteId,
        centerId: widget.centerId,
        roomId: widget.roomId,
        lessonId: widget.lessonId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return AddExerciesListener(
      roomId: widget.roomId,
      centerId: widget.centerId,
      instituteId: widget.instituteId,
      lessonId: widget.lessonId,
      child: Form(
        key: context.read<ExerciesCubit>().formkey,
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
                  controller: context.read<ExerciesCubit>().title,
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
                  controller: context.read<ExerciesCubit>().description,
                ),

                verticalspace(5),
                AppTextButton(
                  buttonText: 'add',
                  textStyle: TextStyles.font18DarkBlueBold.copyWith(
                    color: ColorsManager.white,
                  ),
                  onPressed: () {
                    validateThenDoAddExercies(context);
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
