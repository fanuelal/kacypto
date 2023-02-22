import 'package:casypto/providers/user.dart';
import 'package:flutter/material.dart';
import '../Styles/theme.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';
import './profileScreen.dart';

class UserInfoAdd extends StatefulWidget {
  @override
  State<UserInfoAdd> createState() => _UserInfoAddState();
}

class _UserInfoAddState extends State<UserInfoAdd> {
  CustomAppBar _customAppBar = CustomAppBar();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _teleController = TextEditingController();

  TextEditingController _profielImage = TextEditingController();

  bool isAdding = false;

  Widget textField(
      TextEditingController controller, IconData icon, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: AppColor.iceWhite),
      decoration: InputDecoration(
          prefixIconColor: Colors.white,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 165, 0, 143)),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.white),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: label,
          labelStyle: TextStyle(color: AppColor.iceWhite),
          hintStyle: TextStyle(color: AppColor.white)),
    );
  }

  void _showErrorDialog(String title, String message, bool isSuccess) {
    QuickAlert.show(
        context: context,
        type: isSuccess ? QuickAlertType.success : QuickAlertType.error,
        title: title,
        titleColor: AppColor.iceWhite,
        text: message,
        textColor: AppColor.iceWhite,
        confirmBtnColor: AppColor.purple,
        confirmBtnText: 'OK',
        onConfirmBtnTap: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ProfileScreen()));
          Navigator.of(context).pop();
        },
        backgroundColor: AppColor.Darkgrey);
  }

  Future<void> addInfo() async {
    setState(() {
      isAdding = true;
    });
    Provider.of<UserProvider>(context, listen: false)
        .addUser(_nameController.text, _teleController.text, _profielImage.text)
        .then((value) {
      setState(() {
        isAdding = false;
      });
      value
          ? _showErrorDialog("Info added SuccessFul",
              "you can press ok button and goto profile", value)
          : _showErrorDialog(
              "Error occured ",
              "you can press ok and edit chechk your connection and try again",
              value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.firstDarkColor,
      appBar: _customAppBar.mainAppBar("User Info", 0),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isAdding
                  ? LottieBuilder.asset("assets/lottie/loadingAnim.json")
                  : Image.asset("assets/images/login3.webp"),
              textField(_nameController, Icons.person, "name"),
              SizedBox(height: 10),
              textField(
                  _teleController, Icons.account_balance, "TeleBirr account"),
              SizedBox(height: 10),
              textField(_profielImage, Icons.image, "Profile Image"),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 5, 69, 126),
                      AppColor.purple,
                    ])),
                child: ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.isEmpty ||
                          _teleController.text.isEmpty ||
                          _profielImage.text.isEmpty) {
                        return;
                      }
                      addInfo();
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width - 30, 50),
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      "Save",
                      style: TextStyle(color: AppColor.iceWhite),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
