import 'package:flutter/material.dart';

/// [TermsText] includes the "Terms and Conditions" text with a flavor text.
class TermsText extends StatelessWidget {
  const TermsText({
    Key? key,
    required this.flavorText,
  }) : super(key: key);

  final String flavorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          flavorText,
        ),
        const SizedBox(
          height: 5.0,
        ),
        InkWell(
          child: Text(
            "Terms and Conditions",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/terms");
          },
        ),
      ],
    );
  }
}
