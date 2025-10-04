import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:zyntra/core/helpers/custom_loading_indicator.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky/data/cubits/asky_cubit.dart';
import 'package:zyntra/features/asky/data/models/question_model.dart';

class AskyInputWidget extends StatefulWidget {
  final Function(String message) onSendMessage;
  final String hintText;
  final Color backgroundColor;
  final Color inputBackgroundColor;
  final Color iconColor;
  final Color textColor;

  const AskyInputWidget({
    super.key,
    required this.onSendMessage,
    this.hintText = 'ask any question ...',
    this.backgroundColor = const Color(0xFF2C4C6F),
    this.inputBackgroundColor = const Color(0xFFE8EEF4),
    this.iconColor = const Color(0xFF2C4C6F),
    this.textColor = Colors.black87,
  });

  @override
  State<AskyInputWidget> createState() => _AskyInputWidgetState();
}

class _AskyInputWidgetState extends State<AskyInputWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _hasText = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.trim().isNotEmpty;
    });
  }

  void _handleSend() {
    if (_hasText) {
      _animationController.forward().then((_) {
        _animationController.reverse();
      });
      AskyQuestionModel question = AskyQuestionModel(
        query: _controller.text.trim(),
        top_k: 5,
      );
      BlocProvider.of<AskyCubit>(context).createQuestion(question: question);
      Logger().w("MESSAGE: ${_controller.text.trim()}");
      setState(() {
        isLoading = true;
      });
      widget.onSendMessage(_controller.text.trim());
      _controller.clear();
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskyCubit, AskyState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is MessagesSuccess) {
          setState(() {
            isLoading = false;
          });
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: widget.inputBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    style: AppStyles.styleRegular18(
                      context,
                    ).copyWith(color: widget.textColor),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: AppStyles.styleMedium18(
                        context,
                      ).copyWith(color: AppColors.secondaryTextColor),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _handleSend(),
                  ),
                ),
                const SizedBox(width: 12),
                isLoading
                    ? SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: const CustomLoadingIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    : ScaleTransition(
                        scale: _scaleAnimation,
                        child: GestureDetector(
                          onTap: _handleSend,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: _hasText
                                  ? widget.iconColor
                                  : widget.iconColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Transform.rotate(
                              angle: -0.785398, // 45 degrees in radians
                              child: Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
