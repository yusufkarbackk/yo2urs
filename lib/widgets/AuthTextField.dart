part of 'Widgets.dart';

class AuthTextWidget extends StatefulWidget {
  final void Function(String?) onChanged;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscure;

  AuthTextWidget(
      {required this.onChanged,
      this.keyboardType,
      required this.obscure,
      required this.controller,
      required this.hintText,
      required this.labelText,
      required this.errorText});

  @override
  _AuthTextWidgetState createState() => _AuthTextWidgetState();
}

class _AuthTextWidgetState extends State<AuthTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscure,
      onChanged: widget.onChanged,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          errorText: widget.errorText,
          errorStyle: TextStyle(color: Colors.redAccent),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrussanBlue, width: 2)),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.grey),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
