part of 'Screens.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({
    Key? key,
    required this.isOxygen,
    this.oxygen,
    this.medicine,
  }) : super(key: key);

  final bool isOxygen;
  final Oxygen? oxygen;
  final Medicine? medicine;

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  BlueHeaderWidget(text: 'Checkout'),
                  Text(widget.isOxygen
                      ? 'Tabung oksigen ${widget.oxygen!.size}'
                      : widget.medicine!.packageName),
                  FutureBuilder<YoursUser>(
                      future: UserServices.getUser(user!.uid),
                      builder: (context, snapshots) {
                        if (snapshots.hasData) {
                          return Column(children: [
                            Text('Nama: ' + snapshots.data!.name),
                            Text('Email: ' + snapshots.data!.email),
                            Text('Telp: ' + snapshots.data!.phone.toString())
                          ]);
                        } else {
                          return SpinKitFadingCircle(
                            size: 50,
                            color: kPrussanBlue,
                          );
                        }
                      }),
                  TextField(controller: addressController),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, fixedSize: Size(150, 38)),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Checkout',
                          style: kMainText.copyWith(color: Colors.white),
                        ),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
