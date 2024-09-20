part of 'sectionb_bloc.dart';

class SectionbState extends Equatable {
  const SectionbState({
    required this.top,
    required this.percent,
  });
  final double top;
  final double percent;

  SectionbState copyWith({
    double? top,
    double? percent,
  }) {
    return SectionbState(
      top: top ?? this.top,
      percent: percent ?? this.percent,
    );
  }

  @override
  List<Object> get props => [top, percent];
}

class SectionbInitial extends SectionbState {
  const SectionbInitial() : super(top: 0, percent: 0);
}
