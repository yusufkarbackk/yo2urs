part of 'Widgets.dart';

class ActivityWidget extends StatelessWidget {
  final Widget child;
  final Function()? onTap;

  ActivityWidget({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: child),
        ));
  }
}
