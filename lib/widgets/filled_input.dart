import 'package:flutter/material.dart';

class FilledInput extends StatelessWidget {
  final String? placeholder,initialValue;
  final Widget? icon;
  final bool hiddenText;
  final void Function(String value)? onChange;
  const FilledInput({
    this.onChange,
    this.placeholder,
    this.initialValue,
    this.icon,
    this.hiddenText=false,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: icon!=null?EdgeInsets.only(
        left: 35,top: 10,bottom: 10,right: 20):EdgeInsets.symmetric(horizontal: 35,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(

        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChange??(value){},
              obscureText: hiddenText,
              style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),
              initialValue: initialValue,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          FittedBox(child: icon,)
        ],
      ),
    );
  }
}