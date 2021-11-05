import 'package:chothuexemay_owner/Repositories/generic_repository.dart';
import 'package:chothuexemay_owner/models/booking_transaction.dart';

abstract class IBookingRepository extends GenericRepository {
  Future<List<BookingTranstion>> getBookingTransactions();

  Future<BookingTranstion> getBookingTransactionById(String id);
}
