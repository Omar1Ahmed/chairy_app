part of 'permission_cubit.dart';

@immutable
sealed class PermissionState {}

final class PermissionInitial extends PermissionState {}

class NotificationPermissionGranted extends PermissionState {}

class NotificationPermissionDenied extends PermissionState {}