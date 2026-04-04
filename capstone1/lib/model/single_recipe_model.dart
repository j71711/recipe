class SingleRecipeModel {
  final int id;
  final String title;
  final String image;
  final String category;
  final String cookTime;
  final String difficulty;
  final List<String> instructions;

  SingleRecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.instructions,
    required this.cookTime,
    required this.difficulty,
  });

  factory SingleRecipeModel.singleJsonMap(Map<String, dynamic> map) {
    return SingleRecipeModel(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      category: map['category'],
      cookTime: map['cook_time'],
      difficulty: map['difficulty'],
      instructions: List<String>.from(map['instructions']),
    );
  }

}