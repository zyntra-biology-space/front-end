import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failures.dart';
import 'package:zyntra/features/asky/data/models/message_model.dart';
import 'package:zyntra/features/asky/data/models/question_model.dart';

abstract class AskyRepo {
  Future<Either<Failure, List<AskyMessageModel>>> createQuestion({
    required AskyQuestionModel question,
  });
}
