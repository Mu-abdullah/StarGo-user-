


class ProductModel  {
  String? id;
  String? name;
  String? category;
  String? image;
  String? adminToken;
  String? adminID;
  String? description;
  dynamic priceS;
  dynamic priceM;
  dynamic priceL;

  ProductModel({
    this.name,
    this.id,
    this.adminID,
    this.adminToken,
    this.priceS,
    this.priceM,
    this.priceL,
    this.description,
    this.category,
    this.image,
   
  });

  factory ProductModel.fromFirestore(Map<String, dynamic> data) {
    return ProductModel(
      category: data['category'],
      id: data['id'],
      adminToken: data['adminToken'],
      adminID: data['adminID'],
      name: data['name'],
      description: data['description'],
      priceL: data['priceL'],
      priceM: data['priceM'],
      priceS: data['priceS'],
      image: data['image'],
      
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (id != null) "id": id,
      if (adminID != null) "adminID": adminID,
      if (adminToken != null) "adminToken": adminToken,
      if (priceS != null) "priceS": priceS,
      if (priceM != null) "priceM": priceM,
      if (priceL != null) "priceL": priceL,
      if (description != null) "description": description,
      if (category != null) "category": category,
      if (image != null) "image": image,
    
    };
  }
}
