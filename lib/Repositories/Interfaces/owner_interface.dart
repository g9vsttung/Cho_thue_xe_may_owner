import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/history_wallet_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/models/wallet_model.dart';

import '../generic_repository.dart';

abstract class IOwnerRepository extends GenericRepository {
  Future<int> login(String uid, String accessId);
  Future<List<Bike>> getListBike();
  Future<bool> updateProfile(String name, String phone, String address);
  Future<bool> logout();
  Future<int> acceptOrder(String customerId);
  Future<int> denyOrder(String customerId);
  Future<Owner> viewProfile();
  Future<Wallet> getWallet();
  Future<List<TransactionHistory>> getWalletTranstions(int page, int size);
  Future<List<TransactionHistory>> getWalletTranstionsByStatus(
      int page, int size, bool status);
}
