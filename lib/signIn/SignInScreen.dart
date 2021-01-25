import 'package:untitled/app.dart';

class SignInScreen extends StatelessWidget {
  static const routeName ='/Sign-In';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (c)=>SignInController(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 200,),
                  Text('Login',style: Theme.of(context).textTheme.title,),
                  SizedBox(height: 10,),
                  Text(' Please sign in to continue.',style: TextStyle(
                      color:Colors.grey[600],fontWeight: FontWeight.w600,fontSize: 16),),
                  SizedBox(height: 50,),
                  Consumer<SignInController>(builder: (context,controller,child){
                    return Form(
                      key: controller.formKeySignIn,
                      child: Column(
                        children: [
                          Card(
                            elevation: controller.elev[0] ,
                            shadowColor: Colors.blue[900],
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextFiledWidget(
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
                                  iconColor: controller.elev[0]==0.5?Colors.black38:Colors.black,
                                  icon: FontAwesomeIcons.envelope,
                                  function: controller.changeElevEmail
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Card(
                            elevation: controller.elev[1] ,
                            shadowColor: Colors.blue[900],
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextFiledWidget(
                                  controller: controller.passwordController,
                                  appearForgot: true,
                                  validate: (value) {
                                    if (value.isEmpty ) {
                                      return 'Password Required';
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  obscure: true,
                                  title: 'PASSWORD',
                                  iconColor: controller.elev[1]==0.5?Colors.black38:Colors.black,
                                  icon: FontAwesomeIcons.lock,
                                  elev: controller.elev[1],
                                  function: controller.changeElevPass
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(height: 25),
                  Consumer<SignInController>(builder: (context,controller,child){
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
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('LOGIN  ',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 15),),
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
                      Text('Don\'t have an account? ', style: TextStyle(
                          color: Colors.black38,fontWeight: FontWeight.w600,fontSize: 14),),
                      InkWell(
                        onTap: (){
                          navigator.currentState.pushReplacementNamed(SingUpScreen.routeName);
                        },
                        child: Text('Sign UP', style: TextStyle(
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