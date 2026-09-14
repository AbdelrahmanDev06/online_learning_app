import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/search_input_field.dart';
import '../widgets/course_card.dart';
import '../widgets/search_filter_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController(
    text: 'Product Design',
  );

  static const List<String> _quickCategories = [
    'Visual identiy',
    'Painting',
    'Coding',
    'Writing',
  ];

  int? _selectedCategoryIndex;

  final List<CourseModel> _results = const [
    CourseModel(
      title: 'Product Design v1.0',
      author: 'Robertson Connie',
      price: '\$190',
      duration: '16 hours',
      imagePath: 'assets/images/product_design.png',
    ),
    CourseModel(
      title: 'Product Design',
      author: 'Webb Landon',
      price: '\$250',
      duration: '14 hours',
      imagePath: 'assets/images/product_design.png',
    ),
    CourseModel(
      title: 'Product Design',
      author: 'Webb Kyle',
      price: '\$250',
      duration: '14 hours',
      imagePath: 'assets/images/product_design.png',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const SearchAppBar(),
              const SizedBox(height: 20),
              SearchInputField(
                controller: _controller,
                onChanged: (_) => setState(() {}),
                onClear: () => setState(() => _controller.clear()),
                onFilterTap: () => SearchFilterSheet.show(context),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _quickCategories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final bool isSelected = _selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () => setState(
                        () =>
                            _selectedCategoryIndex = isSelected ? null : index,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.secondary
                              : AppColors.darkCard,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _quickCategories[index],
                          style: TextStyle(
                            color: AppColors.textPrimaryLight,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Results',
                style: TextStyle(
                  color: AppColors.textPrimaryLight,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _results.length,
                  itemBuilder: (context, index) =>
                      CourseCard(course: _results[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
