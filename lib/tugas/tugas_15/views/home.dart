import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/models/categories_model.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/models/meals_model.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/services/api_service.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/services/dio_client.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/views/meal_detail.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeMeal extends StatefulWidget {
  const HomeMeal({super.key});

  @override
  State<HomeMeal> createState() => _HomeMealState();
}

class _HomeMealState extends State<HomeMeal> {
  late final ApiService _apiService;
  late Future<MealsResponse> _featuredMealsFuture;
  late Future<MealsResponse> _filteredMeals;
  late Future<Categories> _categoriesFuture;
  final PageController _carouselC = PageController();
  String _selectedFilter = "Beef";

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _refreshFeaturedMeals();
    _refreshCategories();
    _refreshFilteredMeals();
  }

  void _refreshFeaturedMeals() {
    setState(() {
      _featuredMealsFuture = _apiService.getMeals();
    });
  }

  void _refreshCategories() {
    setState(() {
      _categoriesFuture = _apiService.getCategories();
    });
  }

  void _refreshFilteredMeals() {
    setState(() {
      _filteredMeals = _apiService.getMealsByCategory(
        category: _selectedFilter,
      );
    });
  }

  void onFilterSelected(String filter) {
    setState(() {
      _selectedFilter = filter;
      _refreshFilteredMeals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 24,
                top: 64,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Brian',
                    style: AppTypography.displayLarge.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: AppColors.onBackground,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'What do you want to eat today?',
                    style: AppTypography.footnoteRegular.copyWith(
                      fontSize: 16,
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<MealsResponse>(
              future: _featuredMealsFuture,
              builder: (BuildContext context, AsyncSnapshot<MealsResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 240,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (snapshot.hasError) {
                  return Container(
                    height: 240,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.surfaceContainer,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.wifi_off,
                            size: 48,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Failed to load data:\n${snapshot.error}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: _refreshFeaturedMeals,
                            child: const Text('Refresh'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                List<Meal>? meals = snapshot.data?.meals;
                if (meals == null || meals.isEmpty) {
                  return const SizedBox(
                    height: 240,
                    child: Center(
                      child: Text(
                        'No data.',
                        style: TextStyle(color: AppColors.inverseSurface),
                      ),
                    ),
                  );
                }

                meals = meals.sublist(0, 4);

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: SizedBox(
                        height: 240,
                        child: PageView.builder(
                          clipBehavior: Clip.none,
                          controller: _carouselC,
                          itemCount: meals.length,
                          itemBuilder: (context, index) {
                            final meal = meals?[index];
                            final imageUrl = meal?.strMealThumb ?? '';

                            return GestureDetector(
                              onTap: () {
                                context.push(MealDetail(mealId: meal?.idMeal));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: imageUrl.isNotEmpty
                                      ? DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            imageUrl,
                                          ),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                  color: AppColors.surfaceContainer,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withValues(alpha: 0.8),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            meal?.strMeal ?? 'Untitled',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            spacing: 12,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.soup_kitchen,
                                                    color: AppColors.secondary,
                                                    size: 24,
                                                  ),

                                                  Text(
                                                    "${meal?.ingredientCount.toString()} Ingredients",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      color: AppColors
                                                          .inverseSurface,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.location_pin,
                                                    color:
                                                        AppColors.surfaceTint,
                                                    size: 24,
                                                  ),
                                                  Text(
                                                    meal?.strCountry ??
                                                        meal?.strArea ??
                                                        'Unknown',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      color: AppColors
                                                          .inverseSurface,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _carouselC,
                      count: meals.length > 5
                          ? 5
                          : meals
                                .length, // Batasi dot indikator agar tidak kepanjangan
                      effect: const ExpandingDotsEffect(
                        activeDotColor: AppColors.primaryContainer,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                      onDotClicked: (index) {
                        _carouselC.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 16),
            FutureBuilder(
              future: _categoriesFuture,
              builder:
                  (BuildContext context, AsyncSnapshot<Categories> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 42,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (snapshot.hasError) {
                      return Container(
                        height: 42,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.wifi_off,
                                size: 48,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Failed to load data:\n${snapshot.error}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: _refreshCategories,
                                child: const Text('Refresh'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    final categories = snapshot.data?.categories;
                    if (categories == null || categories.isEmpty) {
                      return const SizedBox(
                        height: 42,
                        child: Center(
                          child: Text(
                            'No data.',
                            style: TextStyle(color: AppColors.inverseSurface),
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: [
                        SizedBox(
                          height: 42,
                          child: ListView.builder(
                            clipBehavior: Clip.none,
                            padding: EdgeInsets.only(left: 24),
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final filter = categories[index];
                              final isSelected =
                                  _selectedFilter == filter.strCategory;

                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: FilterChip(
                                  label: Text(filter.strCategory),
                                  selected: isSelected,
                                  onSelected: (_) =>
                                      onFilterSelected(filter.strCategory),
                                  selectedColor: AppColors.inversePrimary,
                                  backgroundColor: AppColors.surface,
                                  labelStyle: AppTypography.footnoteBold
                                      .copyWith(
                                        color: isSelected
                                            ? Colors.white
                                            : AppColors.onSurface,
                                      ),
                                  side: BorderSide(
                                    color: isSelected
                                        ? AppColors.inversePrimary
                                        : AppColors.ghostBorder,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  showCheckmark: false,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
            ),
            SizedBox(height: 16),
            FutureBuilder(
              future: _filteredMeals,
              builder:
                  (
                    BuildContext context,
                    AsyncSnapshot<MealsResponse> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 300,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (snapshot.hasError) {
                      return Container(
                        height: 300,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.wifi_off,
                                size: 48,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Failed to load data:\n${snapshot.error}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: _refreshFilteredMeals,
                                child: const Text('Refresh'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    final filteredMeals = snapshot.data?.meals;
                    if (filteredMeals == null || filteredMeals.isEmpty) {
                      return const SizedBox(
                        height: 300,
                        child: Center(
                          child: Text(
                            'No data.',
                            style: TextStyle(color: AppColors.inverseSurface),
                          ),
                        ),
                      );
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      clipBehavior: Clip.none,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.85,
                          ),
                      itemCount: filteredMeals.length,
                      itemBuilder: (context, index) {
                        final filteredMeal = filteredMeals[index];
                        return GestureDetector(
                          onTap: () {
                            context.push(
                              MealDetail(mealId: filteredMeal.idMeal!),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.overlaySurface,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: SizedBox(
                                    height: 144,
                                    width: double.infinity,
                                    child: CachedNetworkImage(
                                      imageUrl: filteredMeal.strMealThumb ?? '',
                                      fit: BoxFit.cover,
                                      placeholder: (_, _) => Container(
                                        color: AppColors.surfaceContainer,
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (_, _, _) => Container(
                                        color: AppColors.surfaceContainer,
                                        child: const Icon(
                                          Icons.broken_image,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filteredMeal.strMeal ?? 'Untitled',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      spacing: 4,
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: AppColors.surfaceTint,
                                          size: 16,
                                        ),
                                        Text(
                                          filteredMeal.strCountry ??
                                              filteredMeal.strArea ??
                                              'Unknown',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: AppColors.inverseSurface,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
            ),
          ],
        ),
      ),
    );
  }
}
