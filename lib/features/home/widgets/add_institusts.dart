import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddInstitusts extends StatefulWidget {
  const AddInstitusts({super.key});

  @override
  State<AddInstitusts> createState() => _AddInstitustsDailogState();
}

class _AddInstitustsDailogState extends State<AddInstitusts> {
  void validateThenDoAddInstitute(BuildContext context) {
    if (context.read<InstitutesCubit>().formkey.currentState!.validate()) {
      context.read<InstitutesCubit>().addInstitutesCubit();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return Form(
      key: context.read<InstitutesCubit>().formkey,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
          width: double.infinity,
          height: height * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            spacing: 15.h,
            children: [
              Text('name'),
              AppTextFormField(
                hintText: 'name',
                validator: (value) {},
                controller: context.read<InstitutesCubit>().name,
              ),
              Text('location'),
              AppTextFormField(
                controller: context.read<InstitutesCubit>().location,

                hintText: 'location',
                validator: (value) {},
              ),
              AppTextButton(
                buttonText: 'add',
                textStyle: TextStyles.font18DarkBlueBold,
                onPressed: () {
                  validateThenDoAddInstitute(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
