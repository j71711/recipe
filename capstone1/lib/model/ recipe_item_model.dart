
class RecipeItemModel {
  final int id;
  final String title;
  final String image;
  final String category;
  final double rating;
  final String? cookTime;
  final String? difficulty;
  final double? price;

  RecipeItemModel({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.rating,
    this.cookTime,
    this.difficulty,
    this.price,
  });

  factory RecipeItemModel.fromMap(Map<String, dynamic> map) {
    return RecipeItemModel(
      id: map['id'] ,
      title: map['title'] ,
      image: map['image'],
      category: map['category'],
      rating: (map['rating'] ).toDouble(),
      cookTime: map['cook_time'],
      difficulty: map['difficulty'],
      price: map['price'] 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'category': category,
      'rating': rating,
      'cook_time': cookTime,
      'difficulty': difficulty,
      'price': price,
    };
  }
}
