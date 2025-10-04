import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:zyntra/core/errors/failures.dart';
import 'package:zyntra/core/services/api_endpoints.dart';
import 'package:zyntra/core/services/api_services.dart';
import 'package:zyntra/core/services/services_locator.dart';
import 'package:zyntra/core/services/storage_data.dart';
import 'package:zyntra/features/asky/data/models/message_model.dart';
import 'package:zyntra/features/asky/data/models/question_model.dart';

import 'asky_repo.dart';

class AskyRepoImp implements AskyRepo {
  final ApiServices apiService;

  AskyRepoImp(this.apiService);
  Logger logger = Logger();

  @override
  Future<Either<Failure, List<AskyMessageModel>>> createQuestion({
    required AskyQuestionModel question,
  }) async {
    // TODO: implement createQuestion
    try {
      final response = await apiService.post(
        endPoint: ApiEndpoints.askZyntra,
        data: question.toJson(),
      );

      if (response.containsKey("data")) {
        var data = response["data"];
        List<AskyMessageModel> messages = [];
        AskyMessageModel user = AskyMessageModel.fromJson(
          data,
          MessageRole.USER,
        );
        AskyMessageModel asky = AskyMessageModel.fromJson(
          data,
          MessageRole.ASKY,
        );
        messages.add(user);
        messages.add(asky);
        getIt<StorageData>().setResources(asky.sources);
        return right(messages);
      } else {
        return left(ServerFailure("Invalid response from server.", 500));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString(), 500));
    }
  }
}
