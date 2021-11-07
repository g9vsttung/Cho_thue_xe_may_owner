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
  Future<BookingTranstion> getBookingTransactionById(String id) async {
    return await _bookingService.getById(id);
  }

  @override
  Future<List<BookingTranstion>> getBookingTransactions() async {
    return await _bookingService.getBookingTransactions();
  }

  @override
  Future<List<BookingTranstion>> getHistoryBookingTransactions(
      int page, int size) async {
    return await _bookingService.getHistoryBookingTransactions(page, size);
  }

  @override
  Future<List<BookingTranstion>> getOngoingBookingTransactions(
      int page, int size) async {
    return await _bookingService.getOngoingBookingTransactions(page, size);
  }

  @override
  Future<bool> cancelBooking(String id) async {
    return await _bookingService.cancelBooking(id);
  }

  @override
  Future<bool> requestMoveBookingToInProgress(String id) async {
    return await _bookingService.requestMoveBookingToInProgress(id);
  }
}
