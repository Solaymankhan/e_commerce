class productModel {
  int storyCount;
  List<String> images;
  List<String> groceryItems;
  List<double> discounts;
  List<String> descriptions;
  List<double> prices;
  List<double> weights;

  productModel({
    required this.storyCount,
    required this.images,
    required this.groceryItems,
    required this.discounts,
    required this.descriptions,
    required this.prices,
    required this.weights,
  });

  factory productModel.fromJson(Map<String, dynamic> json) {
    return productModel(
      storyCount: json['story_count'],
      images: List<String>.from(json['images']),
      groceryItems: List<String>.from(json['groceryItems']),
      discounts: List<double>.from(json['discounts']),
      descriptions: List<String>.from(json['descriptions']),
      prices: List<double>.from(json['prices']),
      weights: List<double>.from(json['weights']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'story_count': storyCount,
      'images': images,
      'groceryItems': groceryItems,
      'discounts': discounts,
      'descriptions': descriptions,
      'prices': prices,
      'weights': weights,
    };
  }
}
