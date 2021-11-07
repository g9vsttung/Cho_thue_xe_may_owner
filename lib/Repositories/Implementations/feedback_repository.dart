import 'package:chothuexemay_owner/Repositories/Interfaces/feedback_interface.dart';
import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:chothuexemay_owner/services/feedback_service.dart';

class FeedbackRepository implements IFeedbackRepository {
  final FeedbackService _service = FeedbackService();
  @override
  Future<List<FeedbackModel>> getAll() async {
    return await _service.getAll();
  }

  @override
  Future<List<FeedbackModel>> getByPage(int page, int size) async {
    return await _service.getByPage(page, size);
  }
}
