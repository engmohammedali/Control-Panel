import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/home/widgets/add_institusts.dart';
import 'package:controlpanel/features/home/widgets/institusts_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorsManager.moreLighterGray,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddInstitusts();
            },
          );
        },
        icon: Icon(Icons.add, color: ColorsManager.mainBlue),
        label: Text(
          'add Institute',
          style: TextStyle(color: ColorsManager.darkBlue),
        ),
      ),
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

        child: Column(children: [InstitustsBuilderWidget()]),
      ),
    );
  }
}
