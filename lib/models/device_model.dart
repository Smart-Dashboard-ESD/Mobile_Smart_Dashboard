// class DeviceModel {
//   String? waterid;
//   String? deviceid;
//   String? customerid;
//   String? cinId;
//   String? devui;
//   String? meternumber;
//   double? forwardflow;
//   String? reverseflow;
//   String? waterunit;
//   DateTime? waterdate;
//   String? statusbyte;
//   String? batteryvoltage;
//   String? checkbyte;

//   DeviceModel(
//       {this.waterid,
//       this.deviceid,
//       this.customerid,
//       this.cinId,
//       this.devui,
//       this.meternumber,
//       this.forwardflow,
//       this.reverseflow,
//       this.waterunit,
//       this.waterdate,
//       this.statusbyte,
//       this.batteryvoltage,
//       this.checkbyte});

//   DeviceModel.fromJson(Map<String, dynamic> json) {
//     waterid = json['waterid'];
//     deviceid = json['deviceid'];
//     customerid = json['customerid'];
//     cinId = json['cin_id'];
//     devui = json['devui'];
//     meternumber = json['meternumber'];
//     forwardflow = double.parse(json['forwardflow'].toString());
//     reverseflow = json['reverseflow'];
//     waterunit = json['waterunit'];
//     waterdate = DateTime.parse(json['waterdate']);
//     statusbyte = json['statusbyte'];
//     batteryvoltage = json['batteryvoltage'];
//     checkbyte = json['checkbyte'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['waterid'] = this.waterid;
//     data['deviceid'] = this.deviceid;
//     data['customerid'] = this.customerid;
//     data['cin_id'] = this.cinId;
//     data['devui'] = this.devui;
//     data['meternumber'] = this.meternumber;
//     data['forwardflow'] = this.forwardflow;
//     data['reverseflow'] = this.reverseflow;
//     data['waterunit'] = this.waterunit;
//     data['waterdate'] = this.waterdate.toString();
//     data['statusbyte'] = this.statusbyte;
//     data['batteryvoltage'] = this.batteryvoltage;
//     data['checkbyte'] = this.checkbyte;
//     return data;
//   }
// }

class DeviceModel {
  String? message;
  List<Data>? data;

  DeviceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? waterid;
  String? deviceid;
  String? customerid;
  String? cinId;
  String? devui;
  String? meternumber;
  String? forwardflow;
  String? reverseflow;
  String? waterunit;
  DateTime? waterdate;
  String? statusbyte;
  String? batteryvoltage;
  String? checkbyte;

  Data.fromJson(Map<String, dynamic> json) {
    waterid = json['waterid'];
    deviceid = json['deviceid'];
    customerid = json['customerid'];
    cinId = json['cin_id'];
    devui = json['devui'];
    meternumber = json['meternumber'];
    forwardflow = json['forwardflow'];
    reverseflow = json['reverseflow'];
    waterunit = json['waterunit'];
    waterdate = DateTime.parse(json['waterdate']);
    statusbyte = json['statusbyte'];
    batteryvoltage = json['batteryvoltage'];
    checkbyte = json['checkbyte'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['waterid'] = this.waterid;
    data['deviceid'] = this.deviceid;
    data['customerid'] = this.customerid;
    data['cin_id'] = this.cinId;
    data['devui'] = this.devui;
    data['meternumber'] = this.meternumber;
    data['forwardflow'] = this.forwardflow;
    data['reverseflow'] = this.reverseflow;
    data['waterunit'] = this.waterunit;
    data['waterdate'] = this.waterdate.toString();
    data['statusbyte'] = this.statusbyte;
    data['batteryvoltage'] = this.batteryvoltage;
    data['checkbyte'] = this.checkbyte;
    return data;
  }
}
