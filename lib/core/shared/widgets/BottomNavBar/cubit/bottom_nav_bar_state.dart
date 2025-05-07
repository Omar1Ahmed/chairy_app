import 'package:flutter/material.dart';

@immutable
sealed class BottomNavBarState {}

final class BottomNavBarInitial extends BottomNavBarState {}

final class BottomNavBarChanged extends BottomNavBarState {}