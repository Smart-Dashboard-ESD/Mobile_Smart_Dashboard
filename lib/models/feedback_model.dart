class FeedbackModel {
  String? feedbackID;
  String? status;
  String? feedback;
  String? customerid;

  FeedbackModel(
      {this.feedbackID,
      this.status,
      this.feedback,
      this.customerid,});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    feedbackID = json['feedbackID'];
    status = json['status'];
    feedback = json['feedback'];
    customerid = json['customerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feedbackID'] = this.feedbackID;
    data['status'] = this.status;
    data['feedback'] = this.feedback;
    data['customerid'] = this.customerid;
    return data;
  }
}
