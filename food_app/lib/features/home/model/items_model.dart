class ItemsModel {
  final String title;
  final String image;
  final String kcal;
  final String time;

  ItemsModel({
    required this.title,
    required this.image,
    required this.kcal,
    required this.time,
  });
  static List<ItemsModel> items = [
    ItemsModel(
      title: "Healthy Taco Salad",
      image: "assets/images/Healthy_Taco_Salad.png",
      kcal: "120 kcal",
      time: "20 min",
    ),
    ItemsModel(
      title: "Healthy Taco Salad",
      image: "assets/images/Healthy_Taco_Salad.png",
      kcal: "64 kcal",
      time: '12 min',
    ),
    ItemsModel(
      title: "Healthy Taco Salad",
      image: "assets/images/Japanese_style.png",
      kcal: "64 kcal",
      time: '12 min',
    ),
    ItemsModel(
      title: "Healthy Taco Salad",
      image: "assets/images/Japanese_style.png",
      kcal: "64 kcal",
      time: '12 min',
    ),
  ];
}
