import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/models/feedback_model.dart';
import 'package:mobile_smart_dashboard/services/feedback_service.dart';

class FeedbackProvider with ChangeNotifier {
  FeedbackModel? _userfeedback;

  FeedbackModel get userfeedback => _userfeedback!;

  set userfeedback(FeedbackModel userfeedback) {
    _userfeedback = userfeedback;
    notifyListeners();
  }

  Future<bool> feedback({
    String? name,
    String? kodeAlat,
    String? address,
    String? noHp,
    String? feedback,
  }) async {
    try {
      FeedbackModel userfeedback = await FeedbackService().feedback(
        name: name,
        kodeAlat: kodeAlat,
        address: address,
        noHp: noHp,
        feedback: feedback,
      );

      _userfeedback = userfeedback;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
