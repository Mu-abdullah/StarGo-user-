import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? category;
  @HiveField(3)
  String? image;
  @HiveField(4)
  String? description;
  @HiveField(5)
  double? price;
  @HiveField(6)
  String? time;
  @HiveField(7)
  int? quantity;
  @HiveField(8)
  String? size;
  String? addNotes;
  double? totalPrice;

  CartModel({
    this.name,
    this.id,
    this.price,
    this.size,
    this.description,
    this.category,
    this.image,
    this.time,
    this.quantity,
    this.addNotes,
  }) {
    calculateTotalPrice();
  }

  factory CartModel.fromFirestore(Map<String, dynamic> data) {
    return CartModel(
      category: data['category'],
      id: data['id'],
      name: data['name'],
      description: data['description'],
      price: data['price'],
      size: data['size'],
      image: data['image'],
      time: data['time'],
      quantity: data['quantity'],
      addNotes: data['addNotes'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (id != null) "id": id,
      if (price != null) "price": price,
      if (size != null) "size": size,
      if (description != null) "description": description,
      if (category != null) "category": category,
      if (image != null) "image": image,
      if (time != null) "time": time,
      if (quantity != null) "quantity": quantity,
      if (addNotes != null) "addNotes": addNotes,
    };
  }

  void calculateTotalPrice() {
    if (price != null) {
      totalPrice = price! * (quantity ?? 1);
    }
  }
}
