import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/home/data/models/resource_data_model.dart';

class ArticleCard extends StatefulWidget {
  final ArticleData article;
  final bool isActive;

  const ArticleCard({super.key, required this.article, required this.isActive});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(
          top: _isHovered ? 0 : 8,
          bottom: _isHovered ? 16 : 8,
          left: 8,
          right: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Colors.purple.withOpacity(0.4)
                    : Colors.black.withOpacity(0.2),
                blurRadius: _isHovered ? 30 : 15,
                spreadRadius: _isHovered ? 5 : 2,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientHeader() {
    return Container(
      height: 8,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFA855F7), Color(0xFFEC4899), Color(0xFFA855F7)],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateBadge(),
          const SizedBox(height: 16),
          _buildTitle(),
          const SizedBox(height: 16),
          _buildBrief(),
          const Spacer(),
          _buildReadMoreButton(),
        ],
      ),
    );
  }

  Widget _buildDateBadge() {
    return Row(
      children: [
        Icon(Icons.calendar_today, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          widget.article.publishedAt,
          style: AppStyles.styleSemiBold18(
            context,
          ).copyWith(color: AppColors.secondaryTextColor),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.article.title,
      style: AppStyles.styleBold24(
        context,
      ).copyWith(color: AppColors.primaryColor),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildBrief() {
    return Text(
      widget.article.brief,
      style: AppStyles.styleMedium18(
        context,
      ).copyWith(color: AppColors.secondaryTextColor),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildReadMoreButton() {
    return InkWell(
      onTap: () {
        // TODO: Navigate to article detail
        debugPrint('Reading: ${widget.article.title}');
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(_isHovered ? 8 : 0, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Read More',
              style: AppStyles.styleSemiBold20(
                context,
              ).copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterAccent() {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.purple.shade300,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
