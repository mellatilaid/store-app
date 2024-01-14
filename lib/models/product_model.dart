class ProductModel {
  final int id;
  final String title;
  final price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });

  factory ProductModel.fromjson(json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: RatingModel.fromjson(json['rating']));
  }

  /*factory ProductModel.fromFiresStore(json) {
    return ProductModel(
      id: json['id'],
      title: json[kProductName],
      description: json[kProductdesc],
      image: json[kProductImage],
      price: json[kProductPrice],
      category: '',
    );
  }*/
}

class RatingModel {
  final rate;
  final int count;

  const RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromjson(json) {
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
