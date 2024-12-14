class Rating {
  
  num? rate;
  int? count;

  Rating({
    required this.count,
    required this.rate,
  });

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

}
