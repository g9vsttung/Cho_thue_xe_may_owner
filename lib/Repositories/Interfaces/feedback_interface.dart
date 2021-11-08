import 'package:chothuexemay_owner/Repositories/generic_repository.dart';
import 'package:chothuexemay_owner/models/feedback_model.dart';

abstract class IFeedbackRepository extends GenericRepository {
  Future<List<FeedbackModel>> getByPage(int page, int size);
}
