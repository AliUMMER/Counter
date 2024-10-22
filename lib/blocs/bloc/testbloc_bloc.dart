import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'testbloc_event.dart';
part 'testbloc_state.dart';

class TestblocBloc extends Bloc<TestblocEvent, TestblocState> {
  TestblocBloc() : super(TestblocInitial()) {
    on<TestblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
