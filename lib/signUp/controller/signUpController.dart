import 'dart:convert';

import 'package:untitled/app.dart';


class SignUpController with ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController idePasswordController=TextEditingController();
  submitForm() {
    if (!formKey.currentState.validate()) {
      return ;
    }
    formKey.currentState.save();

     if(passwordController.text == passwordController.text) {
       return saveUser();
    }
  }

  saveUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print('start saving ');
    print(jsonEncode({
      'name':userNameController.text,
      'email':emailController.text,
      'password':passwordController.text,
    }).toString());
     await sharedPreferences.setString('userData',jsonEncode({
      'name':userNameController.text,
      'email':emailController.text,
      'password':passwordController.text,
    }));
     String data = sharedPreferences.getString('userData');
     Map map =jsonDecode(data);
     print(map.toString());
    navigator.currentState.pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  }


  bool isActive = false;

  notify(){
    if(isActive){
      notifyListeners();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("sign Up controller dispose --------------------");
    isActive = false;
    super.dispose();
  }


}
