import 'package:flutter/material.dart';

/// Bottom nav bar with 4 regular tabs and a raised circular
/// Search button floating above the bar (matches the design).
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNavBar({super.key, required this.currentIndex, this.onTap});

  static const int searchIndex = 2;

  static const _sideItems = [
    _NavItemData(0, Icons.home, 'Home'),
    _NavItemData(1, Icons.menu_book_outlined, 'Course'),
    _NavItemData(3, Icons.chat_bubble_outline, 'Message'),
    _NavItemData(4, Icons.person_outline, 'Account'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 64,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildItem(_sideItems[0]),
                  _buildItem(_sideItems[1]),
                  const SizedBox(width: 56),
                  _buildItem(_sideItems[2]),
                  _buildItem(_sideItems[3]),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => onTap?.call(searchIndex),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1B33),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.search, color: Colors.white, size: 26),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(_NavItemData item) {
    final bool isSelected = currentIndex == item.index;
    final Color color = isSelected ? Colors.deepPurple : Colors.grey;

    return InkWell(
      onTap: () => onTap?.call(item.index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(item.icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(item.label, style: TextStyle(color: color, fontSize: 11)),
        ],
      ),
    );
  }
}

class _NavItemData {
  final int index;
  final IconData icon;
  final String label;
  const _NavItemData(this.index, this.icon, this.label);
}
