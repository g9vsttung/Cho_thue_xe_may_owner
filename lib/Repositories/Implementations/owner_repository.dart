import 'package:chothuexemay_owner/Repositories/Interfaces/owner_interface.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/history_wallet_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/models/wallet_model.dart';
import 'package:chothuexemay_owner/services/owner_service.dart';
import 'package:chothuexemay_owner/services/wallet_service.dart';

class OwnerRepository implements IOwnerRepository {
  OwnerService service = OwnerService();
  final WalletService _walletService = WalletService();
  @override
  Future<List<Owner>> getAll() async {
    Future.delayed(const Duration(seconds: 5));
    return service.getAll();
  }

  @override
  Future<int> login(String uid, String accessId) async {
    return service.login(uid, accessId);
  }

  @override
  Future<List<Bike>> getListBike() {
    return service.getListBike();
  }

  @override
  Future<bool> logout() {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateProfile(String name, String phone, String address) {
    return service.updateProfile(name, phone, address);
  }

  @override
  Future<int> acceptOrder(String customerId) {
    return service.acceptOrder(customerId);
  }

  @override
  Future<int> denyOrder(String customerId) {
    return service.denyOrder(customerId);
  }

  @override
  Future<Owner> viewProfile() {
    return service.viewProfile();
  }

  @override
  Future<Wallet> getWallet() {
    return _walletService.getWallet();
  }

  @override
  Future<List<TransactionHistory>> getWalletTranstions(
      int page, int size) async {
    return await _walletService.getWalletTransaction(page, size);
  }

  @override
  Future<List<TransactionHistory>> getWalletTranstionsByStatus(
      int page, int size, bool status) async {
    return await _walletService.getWalletTransactionByStatus(
        page, size, status);
  }

  @override
  Future<int> register(
      String email, String accessToken, String displayName) async {
    return await service.register(email, accessToken, displayName);
  }
}
