import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/data/model/center.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/centers/view/widgets/add_center_widget.dart';
import 'package:controlpanel/features/centers/view/widgets/center_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CentersView extends StatelessWidget {
  final List<CenterModel> centers;
  const CentersView({super.key, required this.centers});
  void _addCenter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<CenterCubit>(),
          child: AddCenterWidget(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorsManager.moreLighterGray,
        onPressed: () {
          _addCenter(context);
        },
        icon: Icon(Icons.add, color: ColorsManager.mainBlue),
        label: Text(
          'add Center',
          style: TextStyle(color: ColorsManager.darkBlue),
        ),
      ),

      appBar: AppBar(
        title: Text('Center', style: TextStyle(color: ColorsManager.darkBlue)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

        child: Column(children: [CenterBuilderWidget(centers: centers)]),
      ),
    );
  }
}
