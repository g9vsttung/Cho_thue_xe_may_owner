import 'package:chothuexemay_owner/Repositories/Implementations/feedback_repository.dart';
import 'package:chothuexemay_owner/Repositories/Interfaces/feedback_interface.dart';
import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:flutter/cupertino.dart';

class FeedbackViewModel extends ChangeNotifier {
  final IFeedbackRepository _repository = FeedbackRepository();

  Future<List<FeedbackModel>> getAll() async {
    return await _repository.getAll();
  }
}
