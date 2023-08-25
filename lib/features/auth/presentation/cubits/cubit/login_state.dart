
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);
}
final class LoginSucessState extends LoginState {}
final class ChangeLoginPasswordSuffixIcon extends LoginState {}
