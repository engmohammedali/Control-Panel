import 'package:controlpanel/core/helpers/spacing.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/features/dashboard/data/model/institute.dart';
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
      borderRadius: BorderRadius.circular(12.r),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(14.h),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: ColorsManager.lightGray,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.school,
                  color: ColorsManager.mainBlue,
                  size: 32.sp,
                ),
              ),
              horizontalSpace(5),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      institute.name,
                      style: TextStyles.font18DarkBlueSemiBold,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          institute.location,
                          style: TextStyles.font13DarkBlueMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text('Lessons:', style: TextStyles.font14DarkBlueMedium),
                    SizedBox(height: 6.h),
                    ...institute.lessons
                        .take(5)
                        .map(
                          (lesson) => Padding(
                            padding: EdgeInsets.only(bottom: 4.h),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.book,
                                  size: 14.sp,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: Text(
                                    lesson.title,
                                    style: TextStyles.font13DarkBlueMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    if (institute.lessons.length > 5)
                      Text(
                        '+${institute.lessons.length - 5} more',
                        style: TextStyles.font13DarkBlueMedium.copyWith(
                          color: Colors.grey,
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
            ],
          ),
        ),
      ),
    );
  }
}
