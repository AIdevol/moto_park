import 'package:get/get.dart';
import 'package:moto_park/response_model/register_response_model.dart';

class GetLoginModalService extends GetxService {
  UserDetails? _userDataModal;



  @override
  void onInit() {
    super.onInit();
  }
  UserDetails? getUserDataModal() {
    return _userDataModal;
  }

  void setUserDataModal({required UserDetails? userDataModal}) {
    _userDataModal = userDataModal;
  }


}