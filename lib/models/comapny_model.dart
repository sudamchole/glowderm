class CompanyModel {
  List<Companies> companies;

  CompanyModel({this.companies});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      companies = new List<Companies>();
      json['companies'].forEach((v) {
        companies.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companies != null) {
      data['companies'] = this.companies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies {
  String logoUrl;
  String company;
  String ceo;
  String category;
  double hqLatitude;
  double hqLongitude;

  Companies(
    {this.logoUrl,
      this.company,
      this.ceo,
      this.category,
      this.hqLatitude,
      this.hqLongitude});

  Companies.fromJson(Map<String, dynamic> json) {
    logoUrl = json['logo_url'];
    company = json['company'];
    ceo = json['ceo'];
    category = json['category'];
    hqLatitude = json['hq_latitude'];
    hqLongitude = json['hq_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo_url'] = this.logoUrl;
    data['company'] = this.company;
    data['ceo'] = this.ceo;
    data['category'] = this.category;
    data['hq_latitude'] = this.hqLatitude;
    data['hq_longitude'] = this.hqLongitude;
    return data;
  }
}
