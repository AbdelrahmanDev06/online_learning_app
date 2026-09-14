import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class SearchFilterSheet extends StatefulWidget {
  const SearchFilterSheet({
    super.key,
    this.initialCategories = const {},
    this.initialPriceRange = const RangeValues(90, 200),
    this.initialDurations = const {},
    this.onApply,
  });

  final Set<String> initialCategories;
  final RangeValues initialPriceRange;
  final Set<String> initialDurations;
  final void Function(
    Set<String> categories,
    RangeValues priceRange,
    Set<String> durations,
  )?
  onApply;

  static Future<void> show(
    BuildContext context, {
    Set<String> initialCategories = const {},
    RangeValues initialPriceRange = const RangeValues(90, 200),
    Set<String> initialDurations = const {},
    void Function(
      Set<String> categories,
      RangeValues priceRange,
      Set<String> durations,
    )?
    onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => SearchFilterSheet(
        initialCategories: initialCategories,
        initialPriceRange: initialPriceRange,
        initialDurations: initialDurations,
        onApply: onApply,
      ),
    );
  }

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  static const List<String> _categories = [
    'Design',
    'Painting',
    'Coding',
    'Music',
    'Visual identiy',
    'Mathmatics',
  ];

  static const List<String> _durations = [
    '3-8 Hours',
    '8-14 Hours',
    '14-20 Hours',
    '20-24 Hours',
    '24-30 Hours',
  ];

  late Set<String> _selectedCategories;
  late Set<String> _selectedDurations;
  late RangeValues _priceRange;

  @override
  void initState() {
    super.initState();
    _selectedCategories = {...widget.initialCategories};
    _selectedDurations = {...widget.initialDurations};
    _priceRange = widget.initialPriceRange;
  }

  void _toggle(Set<String> set, String value) {
    setState(() {
      if (set.contains(value)) {
        set.remove(value);
      } else {
        set.add(value);
      }
    });
  }

  void _clear() {
    setState(() {
      _selectedCategories.clear();
      _selectedDurations.clear();
      _priceRange = const RangeValues(90, 200);
    });
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _optionChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : AppColors.darkCard,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? AppColors.textPrimaryLight
                : AppColors.textSecondaryLight,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: AppColors.textPrimaryLight),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Search Filter',
                      style: TextStyle(
                        color: AppColors.textPrimaryLight,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 24),
            _sectionTitle('Categories'),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _categories
                  .map(
                    (category) => _optionChip(
                      label: category,
                      isSelected: _selectedCategories.contains(category),
                      onTap: () => _toggle(_selectedCategories, category),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 28),
            _sectionTitle('Price'),
            const SizedBox(height: 8),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColors.secondary,
                inactiveTrackColor: AppColors.dividerLight,
                thumbColor: AppColors.surfaceWhite,
                overlayColor: AppColors.secondary.withValues(alpha: 0.2),
                rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 10,
                ),
              ),
              child: RangeSlider(
                values: _priceRange,
                min: 0,
                max: 500,
                onChanged: (values) => setState(() => _priceRange = values),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${_priceRange.start.round()}',
                    style: TextStyle(
                      color: AppColors.textPrimaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\$${_priceRange.end.round()}',
                    style: TextStyle(
                      color: AppColors.textPrimaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _sectionTitle('Duration'),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _durations
                  .map(
                    (duration) => _optionChip(
                      label: duration,
                      isSelected: _selectedDurations.contains(duration),
                      onTap: () => _toggle(_selectedDurations, duration),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _clear,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.darkCard,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        color: AppColors.textPrimaryLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply?.call(
                        _selectedCategories,
                        _priceRange,
                        _selectedDurations,
                      );
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Apply Filter',
                      style: TextStyle(
                        color: AppColors.textPrimaryLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
