class Car {
  final String modelName;

  Car({this.modelName});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      modelName: json['modelName'],
    );
  }
}