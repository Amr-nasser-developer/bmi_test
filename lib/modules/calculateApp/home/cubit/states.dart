abstract class CalculateStates{}
class CalculateInitial extends CalculateStates{}
class CalculateLoading extends CalculateStates{}
class CalculateSuccess extends CalculateStates{}
class CalculateError extends CalculateStates{
  final error;
  CalculateError(this.error);
}
