part of 'asky_cubit.dart';

sealed class AskyState extends Equatable {
  final List<AskyMessageModel> messages;

  const AskyState({required this.messages});

  @override
  List<Object?> get props => [messages];
}

class AskyInitial extends AskyState {
  const AskyInitial() : super(messages: const []);
}

class MessagesLoading extends AskyState {
  const MessagesLoading({required super.messages});

  @override
  List<Object?> get props => [super.props];
}

class MessagesSuccess extends AskyState {
  const MessagesSuccess({required super.messages});
}

class MessagesFailure extends AskyState {
  final String error;

  const MessagesFailure({required super.messages, required this.error});

  @override
  List<Object?> get props => [error, ...super.props];
}
