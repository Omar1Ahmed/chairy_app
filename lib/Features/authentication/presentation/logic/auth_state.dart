abstract class AuthState {}

// those 2 states is for the auth screen , toggle between sign in and sign up
// don't remove them
class AuthSignInState extends AuthState {}




class AuthLoadingState extends AuthState {}

class AuthLogInTokenRetrivedState extends AuthState {
}

class AuthRegisterSuccessState extends AuthState {}
class AuthRegisterFailedState extends AuthState {
  final String message;
  AuthRegisterFailedState({required this.message});
}

class AuthLogInErrorState extends AuthState {
  final String message;
  AuthLogInErrorState({required this.message});
}

class AuthLogInSuccessState extends AuthState {}
class NoInternetConnection extends AuthState {}

class NavigateToNextPage extends AuthState {}

class TogglePaymentMethod extends AuthState {}

class ToggleAuthState extends AuthState {}