import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sectionb_event.dart';
part 'sectionb_state.dart';

class SectionbBloc extends Bloc<SectionbEvent, SectionbState> {
  SectionbBloc({
    required this.controller,
    required this.sectionH,
  }) : super(const SectionbInitial()) {
    controller.addListener(listener);
  }
  final ScrollController controller;
  final double sectionH;

  void listener() {
    final top = state.top;
    final percent = state.percent;
    int pos = controller.offset ~/ (sectionH);
    if (pos > 3) {
      return;
    }
    if (pos < 2) {
      return;
    }
    if (pos > 2) {
      if (top != sectionH || percent != 1) {
        emit(state.copyWith(top: sectionH, percent: 1));
      }
      return;
    }
    double p = controller.offset - sectionH * pos;
    emit(state.copyWith(
        top: min(p, sectionH), percent: min(p, sectionH) / sectionH));
  }
}
