import 'package:flutter/material.dart';
import '../data/data_sources/recipe.api.dart';
import '../domain/models/recipe.dart';
import 'common_widgets/recipe_card.dart';
import 'package:workout_application/data/const/colors.dart' as color;

void main(List<String> args) {
  runApp(MaterialApp(home: newMeals()));
}

class newMeals extends StatefulWidget {
  @override
  _newMeals createState() => _newMeals();
}

class _newMeals extends State<newMeals> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restaurant_menu),
                SizedBox(width: 10),
                Text('Food Recipe')
              ],
            ),
          ),
          body: _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                        title: _recipes[index].name,
                        cookTime: _recipes[index].totalTime,
                        rating: _recipes[index].rating.toString(),
                        thumbnailUrl: _recipes[index].images);
                  },
                )),
    );
  }
}
