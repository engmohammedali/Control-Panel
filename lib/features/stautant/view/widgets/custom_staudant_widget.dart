import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/data/model/stautant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStaudantWidget extends StatelessWidget {
  final Staudant student;
  final void Function()? onTaped;
  const CustomStaudantWidget({
    super.key,
    required this.student,
    required this.onTaped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
      child: Container(
        height: 150.h,
        padding: EdgeInsets.all(10),

        child: Card(
          child: ListTile(
            title: Text(
              "Student:${student.name}",
              style: TextStyles.font18WhiteMedium.copyWith(
                color: ColorsManager.darkBlue,
              ),
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
