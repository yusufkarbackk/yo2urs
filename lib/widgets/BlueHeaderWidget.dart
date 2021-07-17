part of 'Widgets.dart';

class BlueHeaderWidget extends StatelessWidget {
  final String text;

  BlueHeaderWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          color: kPrussanBlue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
              )),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 18),
              child: Text(
                text,
                style: kMainText.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
