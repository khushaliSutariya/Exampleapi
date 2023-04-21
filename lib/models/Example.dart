class Example {
  String? calendarId;
  String? date;
  String? pickupTypeId;
  String? textColor;
  String? serviceInformation;
  String? routeId;
  String? name;

  Example(
      {this.calendarId,
        this.date,
        this.pickupTypeId,
        this.textColor,
        this.serviceInformation,
        this.routeId,
        this.name});

  Example.fromJson(Map<String, dynamic> json) {
    calendarId = json['calendar_id'];
    date = json['date'];
    pickupTypeId = json['pickup_type_id'];
    textColor = json['text_color'];
    serviceInformation = json['service_information'];
    routeId = json['route_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calendar_id'] = this.calendarId;
    data['date'] = this.date;
    data['pickup_type_id'] = this.pickupTypeId;
    data['text_color'] = this.textColor;
    data['service_information'] = this.serviceInformation;
    data['route_id'] = this.routeId;
    data['name'] = this.name;
    return data;
  }
}