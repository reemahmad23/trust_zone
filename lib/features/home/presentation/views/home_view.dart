import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/custom_menu_drawer.dart';
import 'package:trust_zone/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:trust_zone/features/home/presentation/manager/category_cubit/category_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String searchQuery = '';
  List filteredCategories = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CategoryCubit>().fetchCategories();
    });
  }

  void _filterCategories(String query, List categories) {
    final filtered = categories
        .where((cat) => cat.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      searchQuery = query;
      filteredCategories = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: const [
          Icon(Icons.person),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                List categories = [];
                if (state is CategoryLoaded) {
                  categories = state.categories;
                }

                return TextField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_alt),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onChanged: (value) {
                    if (state is CategoryLoaded) {
                      _filterCategories(value, state.categories);
                    }
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Categories",
                style: TextStyle(
                  color: Color(0xFF1B4965),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategoryLoaded) {
                  final categoriesToShow = searchQuery.isEmpty
                      ? state.categories
                      : filteredCategories;

                  if (categoriesToShow.isEmpty) {
                    return const Center(
                      child: Text('No categories match your search.'),
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemCount: categoriesToShow.length,
                    itemBuilder: (context, index) {
                      final category = categoriesToShow[index];
                      return GestureDetector(
                        onTap: () {
                          context.push(
                            '/places-view',
                            extra: {
                              'id': category.id,
                              'name': category.name,
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1B4965),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              category.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is CategoryError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Error: ${state.message}'),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<CategoryCubit>().fetchCategories(),
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text("No categories available."));
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: const Color(0xFF1B4965),
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
        ],
      ),
    );
  }
}
