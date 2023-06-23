class PackageModel {
  final bool status;
  final int code;
  final String message;
  final List<Item> data;

  PackageModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      status: json['status'] as bool,
      code: json['code'] as int,
      message: json['message'] as String,
      data: List<Item>.from(
          json['data'].map((x) => Item.fromJson(x as Map<String, dynamic>))),
    );
  }
}

class Item {
  final int id;
  final String name;
  final int price;
  final String storage;
  final String currencySymbol;
  final int isActive;
  final String description;
  final DateTime createdAt;
  final String createdBy;
  final DateTime updatedAt;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.storage,
    required this.currencySymbol,
    required this.isActive,
    required this.description,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      storage: json['storage'] as String,
      currencySymbol: json['currency_symbol'] as String,
      isActive: json['is_active'] as int,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}
