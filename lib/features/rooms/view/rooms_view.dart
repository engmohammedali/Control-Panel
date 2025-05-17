import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/rooms/logic/room_cubit.dart';
import 'package:controlpanel/features/rooms/view/widgets/add_room_widget.dart';
import 'package:controlpanel/features/rooms/view/widgets/room_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomsView extends StatefulWidget {
  final int instituteId;
  final int centerId;
  const RoomsView({
    super.key,
    required this.instituteId,
    required this.centerId,
  });

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {
  void _addRoom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<RoomCubit>(),
          child: AddRoomWidget(
            instituteId: widget.instituteId,
            centerId: widget.centerId,
          ),
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
          _addRoom(context);
        },
        icon: Icon(Icons.add, color: ColorsManager.mainBlue),
        label: Text(
          'add Room',
          style: TextStyle(color: ColorsManager.darkBlue),
        ),
      ),
      appBar: AppBar(
        title: Text('Room', style: TextStyle(color: ColorsManager.darkBlue)),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

        child: Column(
          children: [
            RoomBuilderWidget(
              centerId: widget.centerId,
              instituteId: widget.instituteId,
            ),
          ],
        ),
      ),
    );
  }
}
