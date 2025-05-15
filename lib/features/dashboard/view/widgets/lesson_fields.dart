import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonFields extends StatelessWidget {
  final int lessonNumber;
  final TextEditingController lessonController;
  final TextEditingController descriptionController;

  const LessonFields({
    required this.lessonNumber,
    required this.lessonController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: ColorsManager.lightGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lesson $lessonNumber'),
          AppTextFormField(
            controller: lessonController,
            hintText: 'lesson $lessonNumber',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lesson $lessonNumber is required';
              }
              return null;
            },
          ),
          verticalspace(8),
          Text('Description $lessonNumber'),
          AppTextFormField(
            controller: descriptionController,
            hintText: 'description $lessonNumber',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Description $lessonNumber is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
