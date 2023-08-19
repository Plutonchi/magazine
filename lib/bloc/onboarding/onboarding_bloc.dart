import 'package:flutter_bloc/flutter_bloc.dart';

enum OnboardingEvent { nextPage, lastPage }

class OnboardingBloc extends Bloc<OnboardingEvent, int> {
  OnboardingBloc() : super(0) {
    on<OnboardingEvent>((event, emit) {
      if (event == OnboardingEvent.nextPage) {
        emit(state + 1);
      } else if (event == OnboardingEvent.lastPage) {
        emit(-1);
      }
    });
  }
}
