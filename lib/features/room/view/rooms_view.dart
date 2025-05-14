import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/data/model/classes.dart';
import 'package:controlpanel/features/room/logic/room_cubit.dart';
import 'package:controlpanel/features/room/view/widgets/add_room_widget.dart';
import 'package:controlpanel/features/room/view/widgets/room_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomsView extends StatelessWidget {
  final Room room;
  const RoomsView({super.key, required this.room});
  // void _addRoom(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext bottomSheetContext) {
  //       return BlocProvider.value(
  //         value: context.read<RoomCubit>(),
  //         child: AddRoomWidget(),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: ColorsManager.moreLighterGray,
      //   onPressed: () {
      //     _addRoom(context);
      //   },
      //   icon: Icon(Icons.add, color: ColorsManager.mainBlue),
      //   label: Text(
      //     'add Room',
      //     style: TextStyle(color: ColorsManager.darkBlue),
      //   ),
      // ),
      appBar: AppBar(
        title: Text(
          'add room',
          style: TextStyle(color: ColorsManager.darkBlue),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

        child: RoomBuilderWidget(room: room),
      ),
    );
  }
}
