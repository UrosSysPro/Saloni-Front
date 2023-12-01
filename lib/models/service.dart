class Service{
  String name;
  int id,salonId,serviceId;
  double price;
  int? parentId;

  Service({
    required this.name,
    required this.id, 
    required this.parentId,
    required this.price,
    required this.salonId,
    required this.serviceId,
  });

  static Service fromJson(dynamic json){
    print(json["parentId"]);
    return Service(
      serviceId: json["serviceId"],
      name: json["name"], 
      id: json["id"]??0, 
      parentId: json["parentId"],
      price: double.parse(json["price"].toString()) ,
      salonId: json["salonId"],
    );
  }
}