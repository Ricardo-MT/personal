import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc({
    required this.controller,
    required this.sectionH,
  }) : super(const TimelineInitial()) {
    controller.addListener(listener);
  }
  final ScrollController controller;
  final double sectionH;

  void listener() {
    int pos = controller.offset ~/ (sectionH);
    if (pos > 3) {
      return;
    }
    if (pos < 2) {
      if (state.progress != 0) {
        emit(state.copyWith(
          progress: 0,
          isProgressZero: true,
        ));
      }
      return;
    }
    if (pos > 2) {
      if (state.progress != 1) {
        emit(state.copyWith(
          progress: 1,
          isProgressZero: false,
        ));
      }
      return;
    }
    double p = controller.offset - sectionH * pos;

    emit(state.copyWith(
      progress: min(p, sectionH) / sectionH,
      isProgressZero: false,
    ));
  }
}
