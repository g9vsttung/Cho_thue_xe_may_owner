import 'package:chothuexemay_owner/Repositories/generic_repository.dart';

abstract class ICustomerRepository extends GenericRepository {
  String sendOTP(String phone);
}
