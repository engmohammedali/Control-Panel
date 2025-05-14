import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/home/view/widgets/add_institust_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddInstitustsWidget extends StatefulWidget {
  const AddInstitustsWidget({super.key});

  @override
  State<AddInstitustsWidget> createState() => _AddInstitustsDailogState();
}

class _AddInstitustsDailogState extends State<AddInstitustsWidget> {
  void validateThenDoAddInstitute(BuildContext context) {
    if (context.read<InstitutesCubit>().formkey.currentState!.validate()) {
      context.read<InstitutesCubit>().addInstituteCubit();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return AddInstituteListener(
      child: Form(
        key: context.read<InstitutesCubit>().formkey,
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
                  controller: context.read<InstitutesCubit>().name,
                ),
                Text('Location'),
                AppTextFormField(
                  controller: context.read<InstitutesCubit>().location,

                  hintText: 'location',

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Location is required';
                    }
                    return null;
                  },
                ),
                verticalspace(5),
                AppTextButton(
                  
                  buttonText: 'add',
                  textStyle: TextStyles.font18DarkBlueBold.copyWith(
                    color: ColorsManager.white,
                  ),
                  onPressed: () {
                    validateThenDoAddInstitute(context);
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
