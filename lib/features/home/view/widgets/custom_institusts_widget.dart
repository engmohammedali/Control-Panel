import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/data/model/institute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInstitustsWidget extends StatelessWidget {
  final Institute institute;
  final void Function()? onTaped;
  const CustomInstitustsWidget({
    super.key,
    required this.institute,
    required this.onTaped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
      child: Container(
        height: 200.h,
        padding: EdgeInsets.all(10),

        width: double.infinity,
        child: GridTile(
          header: Text(institute.name, style: TextStyles.font32BlueBold),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/institust.png')),
              color: ColorsManager.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
