import 'package:company_description/constants.dart';
import 'package:company_description/widgets/send_btn.dart';
import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';

class Search extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.0,
        right: ResponsiveLayout.isSmallScreen(context) ? 4 : 74,
        top: 10,
        bottom: 40,
      ),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  flex: ResponsiveLayout.isSmallScreen(context) ? 7 : 8,
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email or phone number'),
                  )),
              Expanded(
                flex: ResponsiveLayout.isSmallScreen(context) ? 3 : 2,
                child: SendBtn(
                  onPress: () async{
                    await authController.emailOnly(textController.text);
                    textController.text = '';
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
