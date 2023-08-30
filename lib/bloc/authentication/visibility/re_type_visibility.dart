import 'package:flutter_bloc/flutter_bloc.dart';

class ReTypeVisibilityCubit extends Cubit<bool> {
  ReTypeVisibilityCubit() : super(true);

  void reTypeVisibility() => emit(!state);
}
