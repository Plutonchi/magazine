import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashEvent { splashFinished }

class SplashBloc extends Bloc<SplashEvent, bool> {
  SplashBloc() : super(false) {
    on<SplashEvent>((event, emit) {
      if (event == SplashEvent.splashFinished) {
        emit(true);
      }
    });
  }
}
