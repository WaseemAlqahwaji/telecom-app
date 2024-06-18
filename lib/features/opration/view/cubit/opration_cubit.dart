import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'opration_state.dart';

class OprationCubit extends Cubit<OprationState> {
  OprationCubit() : super(OprationInitial());
}
