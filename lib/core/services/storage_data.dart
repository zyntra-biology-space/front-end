import 'package:zyntra/features/asky/data/models/message_model.dart';

class StorageData {
  List<SourceModel>? _resources;

  List<SourceModel>? get resources => _resources;

  void setResources(List<SourceModel>? resources) {
    _resources = resources;
  }
}
