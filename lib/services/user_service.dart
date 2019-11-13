import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/storage/mock_store.dart';

abstract class UserService {
  Stream<ECommerceUser> streamUserInformation();
  Future addUserProduct(Product p);
  Future updateUserInformation(ECommerceUser user);
}

class MockUserService implements UserService {
  final AppStore store;

  MockUserService(this.store);

  @override
  Stream<ECommerceUser> streamUserInformation() {
    return store.userNotifier.stream.map((snapshot) => store.user);
  }

  @override
  Future addUserProduct(Product p) async {
    store.user.userProducts.add(p);
  }

  @override
  Future updateUserInformation(ECommerceUser user) async {
    store.user = user;
  }
}
