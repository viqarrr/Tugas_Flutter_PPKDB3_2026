import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/models/meals_model.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/services/api_service.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/services/dio_client.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeMeal extends StatefulWidget {
  const HomeMeal({super.key});

  @override
  State<HomeMeal> createState() => _HomeMealState();
}

class _HomeMealState extends State<HomeMeal> {
  late final ApiService _apiService;
  late Future<MealsResponse> _mealsFuture;
  final PageController _carouselC = PageController();

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _refreshPosts();
  }

  void _refreshPosts() {
    setState(() {
      _mealsFuture = _apiService.getMeals();
      print(_mealsFuture);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          future: _mealsFuture,
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
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.surfaceContainer,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.wifi_off, size: 48, color: Colors.grey),
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
                        onPressed: _refreshPosts,
                        child: const Text('Refresh'),
                      ),
                    ],
                  ),
                ),
              );
            }

            final meals = snapshot.data?.meals;
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
                        final meal = meals[index];
                        final imageUrl = meal.strMealThumb ?? '';

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: imageUrl.isNotEmpty
                                ? DecorationImage(
                                    image: CachedNetworkImageProvider(imageUrl),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      meal.strMeal ?? 'Untitled',
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
                                            Row(
                                              spacing: 4,
                                              children: [
                                                Icon(
                                                  Icons.soup_kitchen,
                                                  color: AppColors.secondary,
                                                  size: 24,
                                                ),
                                                Text(
                                                  meal.ingredientCount
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: AppColors
                                                        .inverseSurface,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Ingredients",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: AppColors.inverseSurface,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
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
                                              color: AppColors.surfaceTint,
                                              size: 24,
                                            ),
                                            Text(
                                              meal.strCountry!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: AppColors.inverseSurface,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
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
      ],
    );
  }
}
