class CategoryModel {
  final String name;

  CategoryModel({required this.name});

  static List<CategoryModel>categories = [
    CategoryModel(name: "Breakfast"),
    CategoryModel(name: "Lunch"),
    CategoryModel(name: "Dinner"),
    CategoryModel(name: "Snacks"),
  ];
  
}
