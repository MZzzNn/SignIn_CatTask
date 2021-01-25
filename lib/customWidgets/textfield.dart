import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextFiledWidget extends StatelessWidget {
  double elev;
  bool appearForgot,obscure;
  Function validate,function;
  TextInputType keyboardType ;
  String title;
  Color iconColor;
  IconData icon;
  TextEditingController controller;
  TextFiledWidget(
      {this.controller,
      this.elev,
      this.appearForgot,
      this.obscure,
      this.validate,
      this.function,
      this.keyboardType,
      this.title,
      this.iconColor,
      this.icon});
@override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 9,
                child: TextFormField(
                  controller: controller,
                  style: Theme.of(context).textTheme.title.copyWith(fontSize: 15,height: 1.4),
                  cursorColor: Theme.of(context).primaryColor,
                  validator: validate,
                  keyboardType: keyboardType,
                  obscureText: obscure,
                  onTap: function,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top:15,left:12),
                    prefixIcon:  Icon(icon,color: iconColor,size:22,),
                    labelText: title ,
                    errorStyle:  TextStyle(fontSize: 10),
                    labelStyle: TextStyle(color: Colors.black38,fontSize: 13),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                  ),
                ),
              ),
              appearForgot==true?Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: (){},
                    child: Text('FORGOT',
                      style: TextStyle(color: elev ==0.5?Theme.of(context).primaryColor:Theme.of(context).accentColor,
                          fontSize: 11,fontWeight: FontWeight.w600),),
                  )):Container(),
            ],
          );
  }
}

