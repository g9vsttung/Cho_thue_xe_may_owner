import 'package:chothuexemay_owner/Repositories/Interfaces/booking_interface.dart';
import 'package:chothuexemay_owner/models/booking_transaction.dart';
import 'package:chothuexemay_owner/services/booking_service.dart';

class BookingRepository implements IBookingRepository {
  final BookingService _bookingService = BookingService();
  @override
  Future<void> getAll() {
    //Get All Booking of customer
    throw UnimplementedError();
  }

  @override
  Future<BookingTranstion> getBookingTransactionById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<BookingTranstion>> getBookingTransactions() async {
    return await _bookingService.getBookingTransactions();
  }
}
