class Meal {
  final String title;
  final String image;
  final String kcal;
  final String time;
  final String mealType;

  Meal({
    required this.title,
    required this.image,
    required this.kcal,
    required this.time,
    required this.mealType,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'kcal': kcal,
      'time': time,
      'mealType': mealType,
    };
  }

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      kcal: json['kcal'] ?? '',
      time: json['time'] ?? '',
      mealType: json['mealType'] ?? '',
    );
  }
}
