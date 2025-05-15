import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/routing/extension.dart';
import 'package:controlpanel/core/routing/routes.dart' show Routes;
import 'package:controlpanel/core/widgets/shimmer_loading.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:controlpanel/features/rooms/logic/room_cubit.dart';
import 'package:controlpanel/features/rooms/logic/room_state.dart';
import 'package:controlpanel/features/rooms/view/widgets/custom_room_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomBuilderWidget extends StatelessWidget {
  final int instituteId;
  final int centerId;

  const RoomBuilderWidget({
    super.key,
    required this.instituteId,
    required this.centerId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(
      buildWhen:
          (previous, current) =>
              previous != current ||
              current is RoomStateFailure ||
              current is RoomStateSuccess ||
              current is RoomStateLoading,
      builder: (context, state) {
        if (state is RoomStateLoading) {
          return setUpLoading();
        }
        if (state is RoomStateFailure) {
          return setUpError(context, state.message);
        }

        if (state is RoomStateSuccess) {
          return setUpSuccess(state.rooms, context);
        }

        return setUpSuccess([], context);
      },
    );
  }

  setUpSuccess(List<Room> rooms, BuildContext context) {
    if (rooms.isEmpty) {
      return const Center(child: Text("No room added"));
    }

    return Flexible(
      child: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return CustomRoomWidget(
            room: room,
            onTaped: () {
              context.pushNamed(
                Routes.student,
                arguments: [instituteId, centerId, room.id],
              );
            },
          );
        },
      ),
    );
  }

  Widget setUpError(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Toast().error(context, message);
    });

    return Center(child: Text("Error $message"));
  }

  Widget setUpLoading() {
    return ShimmerLoading();
  }
}
