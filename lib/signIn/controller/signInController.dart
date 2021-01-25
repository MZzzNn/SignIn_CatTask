import 'package:untitled/app.dart';


class SignInController with ChangeNotifier{
  GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  List<double> elev=[0.5,0.5];
  submitForm()async{
    if (!formKeySignIn.currentState.validate()) {
      return;
    }
    formKeySignIn.currentState.save();
    if (await userE()) {
      Map user = await getUser();
      navigator.currentState.pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    }else{
      navigator.currentState.pushReplacementNamed(SingUpScreen.routeName);
    }
  }


  Future<bool> userE() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data =sharedPreferences.getString('userData');
    return data.contains(emailController.text);
  }

  Future<Map> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return jsonDecode(sharedPreferences.getString('userData'));
  }



  changeElevEmail() {
        elev[1]=0.5;
        elev[0]=4.0;
      notifyListeners();
  }

  changeElevPass() {
        elev[0]=0.5;
        elev[1]=4.0;
        notifyListeners();
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
    print("sign in controller dispose --------------------");
    isActive = false;
    super.dispose();
  }
}
