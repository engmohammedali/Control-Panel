import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/features/exercieses/data/model/exercies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExerciesWidget extends StatelessWidget {
  final Exercies exercies;
  final void Function()? onTapped;

  const CustomExerciesWidget({
    super.key,
    required this.exercies,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        height: 150.h,
        padding: EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                verticalspace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Exercies: ${exercies.title}",
                        style: TextStyles.font18WhiteMedium.copyWith(
                          color: ColorsManager.darkBlue,
                        ),
                      ),
                      Text(
                        "Description: ${exercies.description}",
                        style: TextStyles.font18WhiteMedium.copyWith(
                          color: ColorsManager.darkBlue,
                        ),
                      ),
                    ],
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
