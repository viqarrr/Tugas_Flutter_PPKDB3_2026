import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/models/meals_model.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/services/api_service.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/services/dio_client.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/views/meal_stat_card.dart';

class MealDetail extends StatefulWidget {
  final String? mealId;

  const MealDetail({super.key, required this.mealId});

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail>
    with SingleTickerProviderStateMixin {
  late final ApiService _apiService;
  late Future<MealsResponse> _mealFuture;
  late TabController _tabC;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _tabC = TabController(length: 2, vsync: this);

    _tabC.addListener(() {
      if (_tabC.index != _selectedTabIndex) {
        setState(() {
          _selectedTabIndex = _tabC.index;
        });
      }
    });

    _refreshMeal();
  }

  @override
  void dispose() {
    _tabC.dispose();
    super.dispose();
  }

  void _refreshMeal() {
    setState(() {
      _mealFuture = _apiService.getMealDetailById(id: widget.mealId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: FutureBuilder<MealsResponse>(
        future: _mealFuture,
        builder: (BuildContext context, AsyncSnapshot<MealsResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to load data:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refreshMeal,
                      child: const Text('Refresh'),
                    ),
                  ],
                ),
              ),
            );
          }

          final mealResponse = snapshot.data?.meals ?? [];
          if (mealResponse.isEmpty) {
            return const Center(
              child: Text(
                'No data.',
                style: TextStyle(color: AppColors.onSurface),
              ),
            );
          }

          final meal = mealResponse[0];

          return CustomScrollView(
            slivers: [
              _buildSliverHeader(meal),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.strMeal ?? 'Untitled',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: AppColors.onBackground,
                        ),
                      ),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: MealStatCard(
                              label: 'Ingredients',
                              value: '${meal.ingredientCount} items',
                              icon: Icons.soup_kitchen,
                              iconColor: AppColors.inversePrimary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: MealStatCard(
                              label: 'Origin',
                              value:
                                  meal.strCountry ?? meal.strArea ?? 'Global',
                              icon: Icons.location_on,
                              iconColor: AppColors.inversePrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      TabBar(
                        controller: _tabC,
                        onTap: (index) {
                          setState(() {
                            _selectedTabIndex = index;
                          });
                        },
                        indicatorColor: AppColors.primaryContainer,
                        labelColor: AppColors.primaryContainer,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 3,
                        dividerColor: AppColors.ghostBorder,
                        tabs: const [
                          Tab(text: "Ingredients"),
                          Tab(text: "How to cook"),
                        ],
                      ),

                      _selectedTabIndex == 0
                          ? _buildIngredientsList(meal)
                          : _buildInstructions(meal),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIngredientsList(Meal meal) {
    final items = meal.ingredientItems;

    if (items.isEmpty) {
      return Center(
        child: Text(
          'No ingredients information available.',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: meal.ingredientItems.length,
      separatorBuilder: (_, _) =>
          Divider(color: AppColors.ghostBorder, height: 16),
      itemBuilder: (context, index) {
        final item = meal.ingredientItems[index];

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              item.measure,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInstructions(Meal meal) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        meal.strInstructions?.trim().isNotEmpty == true
            ? meal.strInstructions!
            : 'No instructions provided.',
        style: const TextStyle(
          fontSize: 15,
          height: 1.6,
          color: AppColors.onSurface,
        ),
      ),
    );
  }

  Widget _buildCoverImage(Meal meal) {
    final imageUrl = meal.strMealThumb ?? '';
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (_, _) => Container(
        color: AppColors.surfaceContainer,
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      errorWidget: (_, _, _) => Container(
        color: AppColors.surfaceContainer,
        child: const Icon(Icons.broken_image, color: Colors.grey),
      ),
    );
  }

  Widget _buildSliverHeader(Meal meal) {
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      backgroundColor: AppColors.surface,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.8),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: AppColors.onBackground,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            _buildCoverImage(meal),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.background.withValues(alpha: 0.3),
                    Colors.transparent,
                    AppColors.background.withValues(alpha: 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
