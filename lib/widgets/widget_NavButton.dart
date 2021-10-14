<<<<<<< HEAD:lib/widgets/widget_NavButton.dart
import 'package:flutter/material.dart';

class WidgetNavButton extends StatelessWidget {
  final rotulo;
  final proximaPag;
  final cor;
  const WidgetNavButton(this.rotulo, this.cor, {this.proximaPag, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(
          rotulo,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            cor,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(200, 50),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, proximaPag);
        },
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

class WidgetNavButton extends StatelessWidget {
  final rotulo;
  final proximaPag;
  final cor;
  const WidgetNavButton(this.rotulo, this.cor, {this.proximaPag, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(
          rotulo,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            cor,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(200, 50),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, proximaPag);
        },
      ),
    );
  }
}
>>>>>>> f79389f196062577a04bd3946dfa4390c6dd2714:lib/widgets/widget_myButton.dart
