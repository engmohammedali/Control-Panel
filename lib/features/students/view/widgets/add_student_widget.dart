import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/students/logic/student_cubit.dart';
import 'package:controlpanel/features/students/view/widgets/add_student_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddStudentWidget extends StatefulWidget {
  final int instituteId;
  final int centerId;
  final int roomId;

  const AddStudentWidget({
    super.key,
    required this.instituteId,
    required this.centerId,
    required this.roomId,
  });

  @override
  State<AddStudentWidget> createState() => _AddStudentWidgetState();
}

class _AddStudentWidgetState extends State<AddStudentWidget> {
  void validateThenDoAddStudent(BuildContext context) {
    if (context.read<StudentCubit>().formkey.currentState!.validate()) {
      context.read<StudentCubit>().addStudentCubit(
        instituteId: widget.instituteId,
        centerId: widget.centerId,
        roomId: widget.roomId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return AddStudentListener(
      roomId: widget.roomId,
      centerId: widget.centerId,
      instituteId: widget.instituteId,
      child: Form(
        key: context.read<StudentCubit>().formkey,
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
                  controller: context.read<StudentCubit>().name,
                ),

                verticalspace(5),
                AppTextButton(
                  buttonText: 'add',
                  textStyle: TextStyles.font18DarkBlueBold.copyWith(
                    color: ColorsManager.white,
                  ),
                  onPressed: () {
                    validateThenDoAddStudent(context);
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
