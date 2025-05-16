import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/features/lessons/data/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLessonWidget extends StatelessWidget {
  final Lesson lesson;
  final void Function()? onTapped;

  const CustomLessonWidget({
    super.key,
    required this.lesson,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        height: 180.h,
        padding: EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lesson: ${lesson.title}",
                      style: TextStyles.font18WhiteMedium.copyWith(
                        color: ColorsManager.darkBlue,
                      ),
                    ),
                    verticalspace(5),
                    Text(
                      "Description: ${lesson.description}",
                      style: TextStyles.font16WhiteMedium.copyWith(
                        color: ColorsManager.darkBlue,
                      ),
                    ),

                    Text(
                      "count : ${lesson.exercieses?.length ?? 0}",
                      style: TextStyles.font16WhiteMedium.copyWith(
                        color: ColorsManager.darkBlue,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: onTapped,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: ColorsManager.mainBlue,
                    ),
                    tooltip: 'View Details',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
