abstract class LoginState{}
class LoginInitial extends LoginState{}
class LoginLoading extends LoginState{}
class LoginSuccess extends LoginState{
  final String? uId;
  LoginSuccess(this.uId);
}
class LoginError extends LoginState{
  final error;
  LoginError(this.error);
}
class ChangeIcon extends LoginState{}
class ShopChangePasswordVisibilityState extends LoginState{}
