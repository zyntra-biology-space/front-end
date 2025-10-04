// Enums
enum MessageRole { USER, ASKY }

// Main Message Model
class AskyMessageModel {
  final MessageRole role;
  final String text;
  final List<SourceModel>? sources;

  AskyMessageModel({required this.role, required this.text, this.sources});

  // Factory constructor from JSON
  factory AskyMessageModel.fromJson(
    Map<String, dynamic> json,
    MessageRole role,
  ) {
    String text = '';

    // Determine text based on role
    if (role == MessageRole.USER) {
      text = json['query'] ?? '';
    } else if (role == MessageRole.ASKY) {
      text = json['answer'] ?? '';
    }

    // Parse sources if available
    List<SourceModel>? sources;
    if (json['sources'] != null) {
      sources = (json['sources'] as List)
          .map((source) => SourceModel.fromJson(source))
          .toList();
    }

    return AskyMessageModel(role: role, text: text, sources: sources);
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    if (role == MessageRole.USER) {
      json['query'] = text;
    } else if (role == MessageRole.ASKY) {
      json['answer'] = text;
    }

    if (sources != null && sources!.isNotEmpty) {
      json['sources'] = sources!.map((source) => source.toJson()).toList();
    }

    return json;
  }

  // Check if message is from user
  bool get isUser => role == MessageRole.USER;

  // Check if message is from Asky
  bool get isAsky => role == MessageRole.ASKY;

  // Copy with method
  AskyMessageModel copyWith({
    MessageRole? role,
    String? text,
    List<SourceModel>? sources,
  }) {
    return AskyMessageModel(
      role: role ?? this.role,
      text: text ?? this.text,
      sources: sources ?? this.sources,
    );
  }

  @override
  String toString() {
    return 'AskyMessageModel(role: $role, text: $text, sources: ${sources?.length ?? 0})';
  }
}

// Source Model
class SourceModel {
  final String pmcId;
  final String title;

  SourceModel({required this.pmcId, required this.title});

  // Factory constructor from JSON
  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(pmcId: json['pmc_id'] ?? '', title: json['title'] ?? '');
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {'pmc_id': pmcId, 'title': title};
  }

  // Copy with method
  SourceModel copyWith({String? pmcId, String? title}) {
    return SourceModel(pmcId: pmcId ?? this.pmcId, title: title ?? this.title);
  }

  @override
  String toString() {
    return 'SourceModel(pmcId: $pmcId, title: $title)';
  }
}
