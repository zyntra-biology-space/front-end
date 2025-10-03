import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zyntra/core/constants.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/home/data/models/resource_data_model.dart';
import 'package:zyntra/features/home/presentation/widgets/resources_section/resource_card.dart';

class ArticleCarouselSlider extends StatefulWidget {
  const ArticleCarouselSlider({super.key});

  @override
  State<ArticleCarouselSlider> createState() => _ArticleCarouselSliderState();
}

class _ArticleCarouselSliderState extends State<ArticleCarouselSlider> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  final List<ArticleData> articles = [
    ArticleData(
      title: "The Future of Space Exploration",
      publishedAt: "October 1, 2025",
      brief:
          "Discover the latest breakthroughs in space technology and how they're shaping humanity's journey to the stars.",
    ),
    ArticleData(
      title: "Artificial Intelligence Revolution",
      publishedAt: "September 28, 2025",
      brief:
          "Exploring how AI is transforming industries and creating new possibilities for innovation and growth.",
    ),
    ArticleData(
      title: "Sustainable Energy Solutions",
      publishedAt: "September 25, 2025",
      brief:
          "A deep dive into renewable energy technologies that are paving the way for a greener tomorrow.",
    ),
    ArticleData(
      title: "Digital Health Revolution",
      publishedAt: "September 22, 2025",
      brief:
          "How telemedicine and wearable technology are revolutionizing healthcare delivery worldwide.",
    ),
    ArticleData(
      title: "Quantum Computing Breakthrough",
      publishedAt: "September 20, 2025",
      brief:
          "Understanding the potential of quantum computers to solve complex problems beyond classical computing.",
    ),
    ArticleData(
      title: "Ocean Conservation Initiatives",
      publishedAt: "September 18, 2025",
      brief:
          "Innovative approaches to protecting marine ecosystems and combating ocean pollution globally.",
    ),
    ArticleData(
      title: "Smart Cities of Tomorrow",
      publishedAt: "September 15, 2025",
      brief:
          "Exploring how IoT and AI are creating more efficient, sustainable, and livable urban environments.",
    ),
    ArticleData(
      title: "Biotechnology Advances",
      publishedAt: "September 12, 2025",
      brief:
          "Revolutionary developments in genetic engineering and their implications for medicine and agriculture.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientBackground),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              _buildHeader(),
              const SizedBox(height: 40),
              Expanded(child: _buildCarousel()),
              const SizedBox(height: 20),
              _buildPaginationDots(),
              const SizedBox(height: 20),
              _buildCounter(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const Text(
          'Latest Insights',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Explore our curated collection of articles and updates',
          style: AppStyles.styleSemiBold22(
            context,
          ).copyWith(color: AppColors.secondaryTextColor),
        ),
      ],
    );
  }

  Widget _buildCarousel() {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: articles.length,
          itemBuilder: (context, index, realIndex) {
            return ArticleCard(
              article: articles[index],
              isActive: index == _currentIndex,
            );
          },
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 0.32,
            enlargeCenterPage: true,
            enlargeFactor: 0.22,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 600),
            autoPlayCurve: Curves.easeInOutCubic,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        _buildNavigationButtons(),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Positioned.fill(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavButton(
            icon: Icons.chevron_left,
            onTap: () => _carouselController.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
          ),
          _buildNavButton(
            icon: Icons.chevron_right,
            onTap: () => _carouselController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(icon, color: const Color(0xFF581C87), size: 32),
          ),
        ),
      ),
    );
  }

  Widget _buildPaginationDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        articles.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == _currentIndex ? 48 : 12,
          height: 12,
          decoration: BoxDecoration(
            color: index == _currentIndex
                ? Colors.white.withAlpha(150)
                : Colors.white.withAlpha(250),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget _buildCounter() {
    return Text(
      'Article ${_currentIndex + 1} of ${articles.length}',
      style: AppStyles.styleMedium20(context),
    );
  }
}
