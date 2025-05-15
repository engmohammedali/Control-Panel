import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/features/centers/data/model/center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCenterWidget extends StatelessWidget {
  final CenterModel center;
  final void Function()? onTaped;
  const CustomCenterWidget({
    super.key,
    required this.center,
    required this.onTaped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        height: 150.h,
        padding: EdgeInsets.all(10),

        width: double.infinity,
        child: Row(
          children: [
            Icon(Icons.home_filled, color: ColorsManager.mainBlue, size: 28.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                "Center : ${center.name}",
                style: TextStyles.font18DarkBlueBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: onTaped,
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
    );
  }
}
