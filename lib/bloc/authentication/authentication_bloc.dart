import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SharedPreferences _prefs;

  AuthenticationBloc(this._prefs)
      : super(
          AuthenticationInitial(),
        ) {
    @override
    Stream<AuthenticationState> mapEventToState(
        AuthenticationEvent event) async* {
      if (event is LoginRequested) {
        yield AuthenticationLoading();
        try {
          await _firebaseAuth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          if (event.rememberMe) {
            _saveRememberMeAndUsername(event.email);
          }
          yield AuthenticationSuccess();
        } catch (error) {
          yield AuthenticationFailure(error: 'Произошла ошибка: $error');
          print(error);
        }
      } else if (event is RegistrationRequested) {
        try {
          await _firebaseAuth.createUserWithEmailAndPassword(
            email: event.username,
            password: event.password,
          );

          final User? currentUser = _firebaseAuth.currentUser;
          if (currentUser != null) {
            await currentUser.updateProfile(displayName: event.username);
          }

          yield AuthenticationSuccess();
        } catch (error) {
          yield AuthenticationFailure(error: 'Произошла ошибка: $error');
        }
      } else if (event is ResetPasswordRequested) {
        try {
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: event.email);
          yield AuthenticationSuccess();
        } catch (error) {
          yield AuthenticationFailure(error: error.toString());
          print(error);
        }
      }
    }
  }
  void _saveRememberMeAndUsername(String email) async {
    await _prefs.setBool('rememberMe', true);
    await _prefs.setString('email', email);
  }
}
