import 'package:untitled/app.dart';
import 'package:untitled/signUp/controller/signUpController.dart';

class SingUpScreen extends StatefulWidget {
  static const routeName ='/Sign-Up';
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (c)=>SignUpController(),
      child:  Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading:IconButton(icon: Icon(Icons.arrow_back,size: 25,),
                onPressed:()=> navigator.currentState.pushReplacementNamed(SignInScreen.routeName)) ,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60,),
                  Text('Creat Account',style: Theme.of(context).textTheme.title.copyWith(fontSize: 35),),
                  SizedBox(height: 30,),
                  Consumer<SignUpController>(builder: (context,controller,child){
                    return  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Card(
                            shadowColor: Colors.blue[900],
                            child:  Padding(
                              padding:  EdgeInsets.symmetric(vertical: 5),
                              child: TextFiledWidget(
                                controller: controller.userNameController,
                                  appearForgot: false,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'UserName Required';
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  obscure: false,
                                  title: 'Full Name',
                                  iconColor:Colors.black38,
                                  icon:FontAwesomeIcons.user,
                              ),
                            ),
                          ),

                          SizedBox(height: 10),

                          Card(
                            shadowColor: Colors.blue[900],
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child:  TextFiledWidget(
                                controller: controller.emailController,

                                appearForgot: false,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'EMAIL Required';
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  obscure: false,
                                  title: 'EMAIL',
                                  iconColor:Colors.black38,
                                  icon:FontAwesomeIcons.envelope,
                                  ),
                            ),
                          ),

                          SizedBox(height: 10),

                          Card(
                            shadowColor: Colors.blue[900],
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child:   TextFiledWidget(
                                  controller: controller.passwordController,

                                  appearForgot: false,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'PASSWORD Required';
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  obscure: true,
                                  title: 'PASSWORD',
                                  iconColor:Colors.black38,
                                  icon:FontAwesomeIcons.lock
                              ),
                            ),
                          ),


                          SizedBox(height: 10),

                          Card(
                            shadowColor: Colors.blue[900],
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child:  TextFiledWidget(
                                controller: controller.idePasswordController,

                                appearForgot: false,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'PASSWORD Required';
                                    }
                                },
                                  keyboardType: TextInputType.number,
                                  obscure: true,
                                  title: 'Confirm PASSWORD',
                                  iconColor:Colors.black38,
                                  icon: FontAwesomeIcons.lock,
                                  ),
                            ),
                          ),


                        ],
                      ),
                    );
                  }),

                  SizedBox(height: 40),

                  Consumer<SignUpController>(builder: (context,controller,child){
                    return Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: controller.submitForm,
                        child: Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Theme.of(context).primaryColor.withOpacity(0.7), Theme.of(context).accentColor],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Sing UP  ', style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.w600,fontSize: 15),),
                                Icon( Icons.arrow_forward,color: Colors.white,size: 22,)
                              ],
                            )
                        ),
                      ),
                    );
                  }),


                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ', style: TextStyle(
                          color: Colors.black38,fontWeight: FontWeight.w600,fontSize: 14),),
                      InkWell(
                        onTap: (){
                          navigator.currentState.pushReplacementNamed(SignInScreen.routeName);
                        },
                        child: Text('Sign IN', style: TextStyle(
                            color: Theme.of(context).accentColor,fontWeight: FontWeight.w600,fontSize: 14),),
                      ),
                    ],
                  ),
                  SizedBox(height: 35,)
                ],
              ),
            ),
          )
      ),
    );
  }
}