import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/rooms/logic/room_state.dart';
import 'package:controlpanel/features/rooms/logic/room_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRoomListener extends StatelessWidget {
  final Widget child;
  final int instituteId;
  final int centerId;
  const AddRoomListener({super.key, required this.child, required this.instituteId, required this.centerId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomCubit, RoomState>(
      listenWhen:
          (previous, current) =>
              previous != current ||
              current is RoomAddStateLoading ||
              current is RoomAddStateSuccess ||
              current is RoomAddStateFailure,
      listener: (context, state) {
        if (state is RoomAddStateLoading) {
          _setLoading(context);
        }
        if (state is RoomAddStateFailure) {
          return _setApAddStateSuccessFailure(context, state.message);
        }
        if (state is RoomAddStateSuccess) {
          return _setApAddStateSuccess(context, state.message);
        }
      },
      child: child,
    );
  }

  void _setApAddStateSuccess(BuildContext context, String message) {
    Toast().success(context, message);

    context.read<RoomCubit>().fetchRoomsCubit(
      centerId: centerId,
      instituteId: instituteId,
    );
    Navigator.pop(context);
  }

  void _setApAddStateSuccessFailure(BuildContext context, String message) {
    Toast().error(context, message);
  }

  void _setLoading(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => const Center(
            child: CircularProgressIndicator(color: ColorsManager.mainBlue),
          ),
    ).then((value) {
      Navigator.pop(context);
    });
  }
}
