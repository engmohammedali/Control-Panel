import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/routing/extension.dart';
import 'package:controlpanel/core/routing/routes.dart' show Routes;
import 'package:controlpanel/data/model/classes.dart';
import 'package:controlpanel/features/home/view/widgets/home_shimmer_loading.dart';
import 'package:controlpanel/features/room/logic/classes_state.dart';
import 'package:controlpanel/features/room/logic/room_cubit.dart';
import 'package:controlpanel/features/room/view/widgets/custom_room_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomBuilderWidget extends StatelessWidget {
  final Room room;
  const RoomBuilderWidget({super.key, required this.room});

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
          return setUpSuccess(state.room, context);
        }

        return CustomRoomWidget(
          room: room,
          onTaped: () {
            context.pushNamed(Routes.staudant, arguments: room.students);
          },
        );
      },
    );
  }

  setUpSuccess(Room room, BuildContext context) {
    return CustomRoomWidget(
      room: room,
      onTaped: () {
        context.pushNamed(Routes.staudant, arguments: room.students);
      },
    );
  }

  setUpError(BuildContext context, String message) {
    Toast().error(context, message);
  }

  Widget setUpLoading() {
    return HomeShimmerLoading();
  }
}
