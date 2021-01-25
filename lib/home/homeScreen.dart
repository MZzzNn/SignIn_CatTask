import 'package:untitled/app.dart';

class HomeScreen extends StatelessWidget {
  static const routeName ='/Home-Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/2.5,
          width: MediaQuery.of(context).size.width/2.5,
          decoration:BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/cat.jpg')
            )
          ) ,

        ),
      ),
    );
  }
}
