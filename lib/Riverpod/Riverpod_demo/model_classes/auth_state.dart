import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final String? username;
  final bool isLoggedIn;

  AuthState({this.username, this.isLoggedIn = false});
  AuthState copyWith({String? username, bool? isLoggedIn}) {
    return AuthState(
      username: username ?? this.username,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState();
  }

  void logIn(String username) {
    state = state.copyWith(username: username, isLoggedIn: true);
  }

  void logOut() {
    state = AuthState();
  }
}
final authProvider = NotifierProvider<AuthNotifier ,AuthState> (()=> AuthNotifier());