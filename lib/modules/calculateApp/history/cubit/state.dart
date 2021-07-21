abstract class HistoryStates{}
class HistoryInitial extends HistoryStates{}
class HistoryLoading extends HistoryStates{}
class HistorySuccess extends HistoryStates{}
class HistoryError extends HistoryStates{
  final error;
  HistoryError(this.error);
}