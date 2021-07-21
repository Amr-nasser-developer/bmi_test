abstract class RegisterStates{}
class RegisterInitial extends RegisterStates{}
class RegisterLoading extends RegisterStates{}
class RegisterSuccess extends RegisterStates{}
class RegisterError extends RegisterStates{
  final error;
  RegisterError(this.error);
}
class CreateUserLoading extends RegisterStates{}
class CreateUserSuccess extends RegisterStates{}
class CreateUserError extends RegisterStates{
  final error;
  CreateUserError(this.error);
}
class ShopRegisterChangePasswordVisibilityState extends RegisterStates{}