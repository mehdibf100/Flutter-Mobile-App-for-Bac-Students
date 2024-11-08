import 'package:first_project/screens/home.dart';
import 'package:get/get.dart';
import 'package:first_project/service/userService.dart';

class UserController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  final UserService _userService = UserService();

  @override
  void onInit() {
    super.onInit();
    loadUserInfo();
  }

  void loadUserInfo() async {
    final userInfo = await _userService.loadUserInfo();
    userName.value = userInfo['name'] ?? '';
    userEmail.value = userInfo['email'] ?? '';
  }
}
