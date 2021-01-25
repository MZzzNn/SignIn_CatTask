import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if(navigator==null){
    navigator=new GlobalKey<NavigatorState>();
  }
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Magic',
        navigatorKey: navigator,
        onGenerateRoute: onGenerateRoute,
        home: SignInScreen(),
        //initialRoute:Home.routeName,
        theme:ThemeData(
          primaryColor: Color(0xffF6C658),
          accentColor: Color(0xffFDA038),
          canvasColor:Color(0xffFFFFFF),
          fontFamily: 'Montserrat',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1:TextStyle(
                color: Color(0xff020804),
              ),
              body2:TextStyle(
                color: Color(0xff020804),
              ),
              title: TextStyle(
                fontSize: 45,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              )
          ),
        ) ,

      )
  );
}


Route onGenerateRoute(RouteSettings settings) {
  dynamic data=settings.arguments;
  switch(settings.name){
    case SignInScreen.routeName:
      return MaterialPageRoute(builder:(_)=>SignInScreen());
    case SingUpScreen.routeName:
      return MaterialPageRoute(builder:(_)=>SingUpScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder:(_)=>HomeScreen());


  }
}
