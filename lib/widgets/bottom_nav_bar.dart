import 'package:flutter/material.dart';

enum NavTab { home, course, search, message, account }

class BottomNavBar extends StatelessWidget {
  final NavTab activeTab;
  final ValueChanged<NavTab>? onTabSelected;

  const BottomNavBar({super.key, required this.activeTab, this.onTabSelected});

  static const Color _activeColor = Color(0xFF4C63F2);
  static const Color _inactiveColor = Color(0xFF7B7B93);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // خلفية الشريط
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildItem(Icons.cottage, 'Home', NavTab.home),
                  _buildItem(Icons.book_rounded, 'Course', NavTab.course),
                  // مساحة فاضية عشان زرار البحث المرفوع
                  const SizedBox(width: 56),
                  _buildItem(Icons.sms, 'Message', NavTab.message),
                  _buildItem(Icons.person_rounded, 'Account', NavTab.account),
                ],
              ),
            ),
          ),

          // زرار البحث المرفوع في النص
          Positioned(
            top: -11,
            child: GestureDetector(
              onTap: () => onTabSelected?.call(NavTab.search),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff1F1F45),
                    ),
                    child: const Icon(
                      Icons.search_rounded,
                      color: Color(0xffB8B8D2),
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: activeTab == NavTab.search
                          ? _activeColor
                          : _inactiveColor,
                      fontSize: 14,
                      fontWeight: activeTab == NavTab.search
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String label, NavTab tab) {
    final bool isActive = tab == activeTab;
    final Color color = isActive ? _activeColor : _inactiveColor;

    return GestureDetector(
      onTap: () => onTabSelected?.call(tab),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
