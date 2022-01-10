import 'package:flutter/material.dart';
import 'package:growth/constants/nav_routes.dart';

class TermsConditionsText extends StatelessWidget {
  const TermsConditionsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 5.0,
        ),
        InkWell(
          child: Text(
            "Terms and Conditions",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(NavigationRoutes.termsRoute);
          },
        ),
      ],
    );
  }
}
