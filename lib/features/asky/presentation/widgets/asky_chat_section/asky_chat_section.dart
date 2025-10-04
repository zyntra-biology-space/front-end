import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:zyntra/core/helpers/custom_loading_indicator.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky/data/cubits/asky_cubit.dart';
import 'package:zyntra/features/asky/data/models/message_model.dart';
import 'package:zyntra/features/asky/presentation/widgets/asky_chat_section/asky_chat_ai_bubble.dart';
import 'package:zyntra/features/asky/presentation/widgets/asky_chat_section/asky_chat_user_bubble.dart';
import 'package:zyntra/features/asky/presentation/widgets/asky_chat_section/asky_input_widget.dart';

class AskyChatSection extends StatefulWidget {
  const AskyChatSection({super.key});

  @override
  State<AskyChatSection> createState() => _AskyChatSectionState();
}

class _AskyChatSectionState extends State<AskyChatSection> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Logger logger = Logger(printer: PrettyPrinter());

  void _handleSendMessage() {
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.8,
        decoration: BoxDecoration(
          color: Color(0xffACB1C6).withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Color(0xffACB1C6).withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "Ask Zyntra",
                style: AppStyles.styleSemiBold28(context),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: BlocConsumer<AskyCubit, AskyState>(
                  listener: (context, state) {
                    if (state is MessagesFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                    if (state is MessagesSuccess) {
                      _scrollToBottom();
                    }
                  },
                  builder: (context, state) {
                    if (state is MessagesLoading) {
                      return const Center(child: CustomLoadingIndicator());
                    }

                    if (state is MessagesSuccess) {
                      if (state.messages.isEmpty) {
                        return Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.zyntraLogo,
                                      color: AppColors.primaryColor,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Welcome with Zyntra!👋",
                                      style: AppStyles.styleSemiBold24(context)
                                          .copyWith(
                                            color: AppColors.secondaryTextColor,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "How can I help you today?",
                                      style: AppStyles.styleMedium24(context)
                                          .copyWith(
                                            color: AppColors.secondaryTextColor,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: ListView.builder(
                                controller: _scrollController,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.only(bottom: 16),
                                itemCount: state.messages.length,
                                itemBuilder: (context, index) {
                                  final message = state.messages[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 20.0,
                                    ),
                                    child: message.role == MessageRole.USER
                                        ? Container(
                                            margin: EdgeInsets.only(
                                              right:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.5,
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                right:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.1,
                                              ),
                                              child: AskyChatUserBubble(
                                                message: message.text,
                                              ),
                                            ),
                                          )
                                        : AskyChatAiBubble(
                                            message: message.text,
                                          ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "Welcome with Zyntra!👋",
                                  style: AppStyles.styleSemiBold24(context)
                                      .copyWith(
                                        color: AppColors.secondaryTextColor,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "How can I help you today?",
                                  style: AppStyles.styleMedium24(context)
                                      .copyWith(
                                        color: AppColors.secondaryTextColor,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            AskyInputWidget(
              onSendMessage: (message) {
                print('User asked: $message');
                // Send to your AI API
              },
              hintText: 'ask any question ...',
            ),
          ],
        ),
      ),
    );
  }
}
