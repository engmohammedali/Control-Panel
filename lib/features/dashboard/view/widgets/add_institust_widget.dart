import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/dashboard/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/dashboard/view/widgets/add_institust_listener.dart';
import 'package:controlpanel/features/dashboard/view/widgets/lesson_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddInstitustsWidget extends StatefulWidget {
  const AddInstitustsWidget({super.key});

  @override
  State<AddInstitustsWidget> createState() => _AddInstitustsDialogState();
}

class _AddInstitustsDialogState extends State<AddInstitustsWidget> {
  void validateThenDoAddInstitute(BuildContext context) {
    if (cubit.formkey.currentState!.validate()) {
      cubit.addInstituteCubit();
    }
  }

  late final InstitutesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<InstitutesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return AddInstituteListener(
      child: Form(
        key: cubit.formkey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name'),
              AppTextFormField(
                controller: cubit.name,
                hintText: 'name',
                validator: _requiredValidator('Name'),
              ),
              verticalspace(10),
              const Text('Location'),
              AppTextFormField(
                controller: cubit.location,
                hintText: 'location',
                validator: _requiredValidator('Location'),
              ),
              verticalspace(15),
              LessonFields(
                lessonNumber: 1,
                lessonController: cubit.lesson1,
                descriptionController: cubit.description1,
              ),
              LessonFields(
                lessonNumber: 2,
                lessonController: cubit.lesson2,
                descriptionController: cubit.description2,
              ),
              LessonFields(
                lessonNumber: 3,
                lessonController: cubit.lesson3,
                descriptionController: cubit.description3,
              ),
              LessonFields(
                lessonNumber: 4,
                lessonController: cubit.lesson4,
                descriptionController: cubit.description4, // تم تصحيحها
              ),
              LessonFields(
                lessonNumber: 5,
                lessonController: cubit.lesson5,
                descriptionController: cubit.description5,
              ),
              verticalspace(10),
              AppTextButton(
                buttonText: 'add',
                textStyle: TextStyles.font18DarkBlueBold.copyWith(
                  color: ColorsManager.white,
                ),
                onPressed: () => validateThenDoAddInstitute(context),
              ),
              verticalspace(5),
            ],
          ),
        ),
      ),
    );
  }

  String? Function(String?) _requiredValidator(String fieldName) {
    return (value) {
      if (value == null || value.isEmpty) {
        return '$fieldName is required';
      }
      return null;
    };
  }
}
