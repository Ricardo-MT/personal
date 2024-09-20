part of 'timeline_bloc.dart';

class TimelineState extends Equatable {
  const TimelineState({
    required this.progress,
    required this.isProgressZero,
  });
  final double progress;
  final bool isProgressZero;

  TimelineState copyWith({
    double? progress,
    bool? isProgressZero,
  }) {
    return TimelineState(
      progress: progress ?? this.progress,
      isProgressZero: isProgressZero ?? this.isProgressZero,
    );
  }

  @override
  List<Object> get props => [
        progress,
        isProgressZero,
      ];
}

class TimelineInitial extends TimelineState {
  const TimelineInitial()
      : super(
          progress: 0,
          isProgressZero: true,
        );
}
