import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_cubit.dart';
import 'package:controlpanel/features/Teachers/view/widgets/add_teacher_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTeacherWidget extends StatefulWidget {
  final int instituteId;
  final int centerId;
  final int roomId;
  const AddTeacherWidget({
    super.key,
    required this.instituteId,
    required this.centerId,
    required this.roomId,
  });

  @override
  State<AddTeacherWidget> createState() => _AddTeacherWidgetState();
}

class _AddTeacherWidgetState extends State<AddTeacherWidget> {
  void validateThenDoAddTeacher(BuildContext context) {
    if (context.read<TeacherCubit>().formkey.currentState!.validate()) {
      context.read<TeacherCubit>().addTeacherCubit(
        roomId: widget.roomId,
        centerId: widget.centerId,
        instituteId: widget.instituteId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return AddTeacherListener(
      instituteId: widget.instituteId,
      centerId: widget.centerId,
      roomId: widget.roomId,
      child: Form(
        key: context.read<TeacherCubit>().formkey,
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
                Text('Name'),
                AppTextFormField(
                  hintText: 'name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  controller: context.read<TeacherCubit>().name,
                ),

                verticalspace(5),
                AppTextButton(
                  buttonText: 'add',
                  textStyle: TextStyles.font18DarkBlueBold.copyWith(
                    color: ColorsManager.white,
                  ),
                  onPressed: () {
                    validateThenDoAddTeacher(context);
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
