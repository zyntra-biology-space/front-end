import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky/data/models/message_model.dart';

class AskyResourcesSection extends StatelessWidget {
  final List<SourceModel> resources;

  const AskyResourcesSection({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xffACB1C6).withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const AskyResourcesHeader(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              itemCount: resources.length,
              itemBuilder: (context, index) {
                return ResourceLinkCard(
                  resource: resources[index],
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AskyResourcesHeader extends StatelessWidget {
  const AskyResourcesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffACB1C6).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.link_rounded,
              color: Colors.white.withOpacity(0.9),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Text("Resources", style: AppStyles.styleSemiBold28(context)),
        ],
      ),
    );
  }
}

class ResourceLinkCard extends StatefulWidget {
  final SourceModel resource;
  final int index;

  const ResourceLinkCard({
    super.key,
    required this.resource,
    required this.index,
  });

  @override
  State<ResourceLinkCard> createState() => _ResourceLinkCardState();
}

class _ResourceLinkCardState extends State<ResourceLinkCard> {
  bool _isHovered = false;

  Color _getAccentColor() {
    final colors = [const Color(0xFFEC4899), const Color(0xFF3B82F6)];
    return colors[widget.index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _getAccentColor();

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {
            print("Resource selected: ${widget.resource.title}");
            print("ID: ${widget.resource.pmcId}");
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_isHovered ? 0.15 : 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isHovered
                    ? accentColor.withOpacity(0.5)
                    : Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                // Icon Container
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.description_rounded,
                    color: accentColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),

                // Content
                Expanded(
                  child: Text(
                    widget.resource.title,
                    style: AppStyles.styleSemiBold28(
                      context,
                    ).copyWith(fontSize: 18, color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Arrow Icon
                AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: _isHovered ? -0.125 : 0, // 45 degrees
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: accentColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Alternative Compact Version
class ResourceLinkCompact extends StatelessWidget {
  final ResourceLinkModel resource;
  final Color accentColor;

  const ResourceLinkCompact({
    super.key,
    required this.resource,
    this.accentColor = const Color(0xFF6366F1),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          print("Resource selected: ${resource.id}");
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
          ),
          child: Row(
            children: [
              Icon(Icons.description_rounded, color: accentColor, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  resource.title,
                  style: AppStyles.styleSemiBold18(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white.withOpacity(0.5),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Resource Model
class ResourceLinkModel {
  final String title;
  final String id;

  ResourceLinkModel({required this.title, required this.id});
}
