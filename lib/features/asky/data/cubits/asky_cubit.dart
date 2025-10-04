import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:zyntra/features/asky/data/models/message_model.dart';
import 'package:zyntra/features/asky/data/models/question_model.dart';
import 'package:zyntra/features/asky/data/repos/asky_repo_imp.dart';

part 'asky_state.dart';

class AskyCubit extends Cubit<AskyState> {
  final AskyRepoImp askyRepoImp;
  Logger logger = Logger();
  AskyCubit({required this.askyRepoImp}) : super(AskyInitial());

  Future<void> createQuestion({required AskyQuestionModel question}) async {
    try {
      final result = await askyRepoImp.createQuestion(question: question);
      result.fold(
        (failure) => emit(
          MessagesFailure(error: failure.errMessage, messages: const []),
        ),
        (messages) async {
          List<AskyMessageModel> newMessages = [...state.messages, ...messages];
          emit(MessagesSuccess(messages: newMessages));
          logger.i("Messages: $newMessages");
        },
      );
    } catch (error) {
      emit(MessagesFailure(error: error.toString(), messages: const []));
    }
  }
}
