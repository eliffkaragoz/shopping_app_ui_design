import 'package:flutter/material.dart';
import '../../components/buttons/elevated_button_widget.dart';
import '../../theme/color_constants.dart';
import '../../extension/context_extension.dart';
import '../home/home_view.dart';
part 'welcome_string_values.dart';

// ignore: must_be_immutable
class WelcomeView extends StatelessWidget {
  WelcomeView({Key? key}) : super(key: key);

  final image =
      "https://img.freepik.com/premium-photo/online-shopping-mobile-phone_172660-107.jpg?w=1060";
  // ignore: library_private_types_in_public_api
  _HomeStringValues values = _HomeStringValues();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorScheme.instance.appBlack,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(),
        buildTopOfPageText(),
        SizedBox(
          height: context.mediumValue,
        ),
        buildTitleText(context),
        SizedBox(
          height: context.mediumValue,
        ),
        _buildMainImage(context),
        SizedBox(
          height: context.mediumValue,
        ),
        buildSignUpButton(context),
        SizedBox(
          height: context.normalValue,
        ),
        buildSignInButton(context),
        SizedBox(
          height: context.normalValue,
        ),
        buildBottomOfPageText(context)
      ]),
    );
  }

  SizedBox _buildMainImage(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.33),
      width: context.dynamicWidth(1),
      child: Center(child: Image.network(image)),
    );
  }

  Text buildTopOfPageText() {
    return Text(values.text_top_of_page,
        style: const TextStyle(color: Colors.white38, fontSize: 13));
  }

  Text buildTitleText(BuildContext context) {
    return Text(values.main_title,
        style: Theme.of(context).textTheme.headline6?.copyWith(
            color: CustomColorScheme.instance.appWhite, fontSize: 35));
  }

  MyElevatedButton buildSignUpButton(BuildContext context) {
    return MyElevatedButton(
      onPressed: () {},
      text: "Create an account",
      buttonWeight: context.dynamicWidth(0.9),
      textColor: CustomColorScheme.instance.appWhite,
      buttonColor: CustomColorScheme.instance.grayButton,
    );
  }

  MyElevatedButton buildSignInButton(BuildContext context) {
    return MyElevatedButton(
        buttonWeight: context.dynamicWidth(0.9),
        textColor: CustomColorScheme.instance.appBlack,
        buttonColor: CustomColorScheme.instance.appWhite,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeView()));
        },
        text: "Sign in ");
  }

  Padding buildBottomOfPageText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.dynamicWidth(0.06)),
      child: Text(values.description,
          style: const TextStyle(color: Colors.white38, fontSize: 13)),
    );
  }
}
