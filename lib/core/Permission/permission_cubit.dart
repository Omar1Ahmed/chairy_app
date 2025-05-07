import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionInitial());

  Future<void> requestPermission() async {

    if (await Permission.notification.isGranted) {
      emit(NotificationPermissionGranted());
    } else {
      final permissionStatus = await Permission.notification.request();

      if (permissionStatus.isGranted) {
        emit(NotificationPermissionGranted());
      } else {
        emit(NotificationPermissionDenied());
      }
    }
  }
}
