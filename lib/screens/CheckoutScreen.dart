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
  late String name;
  late String email;
  late int? phone;

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController addressController = TextEditingController();
  late bool isAdressValid;
  bool isCheckout = false;

  @override
  void initState() {
    super.initState();
    isAdressValid = true;
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(children: [
                      Container(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            widget.isOxygen
                                ? 'Tabung oksigen ${widget.oxygen!.size}'
                                : widget.medicine!.packageName,
                            style: kMainText,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      FutureBuilder<YoursUser>(
                          future: UserServices.getUser(user!.uid),
                          builder: (context, snapshots) {
                            if (snapshots.hasData) {
                              widget.name = snapshots.data!.name;
                              widget.email = snapshots.data!.email;
                              widget.phone = snapshots.data!.phone;

                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama: ' + snapshots.data!.name,
                                      style: kSeccondText,
                                    ),
                                    Text('Email: ' + snapshots.data!.email,
                                        style: kSeccondText),
                                    Text(
                                        'Telp: ' +
                                            snapshots.data!.phone.toString(),
                                        style: kSeccondText),
                                    Text(
                                        widget.isOxygen
                                            ? 'Harga: ' +
                                                NumberFormat.currency(
                                                        locale: 'id_IDR',
                                                        decimalDigits: 0,
                                                        symbol: 'Rp')
                                                    .format(
                                                        widget.oxygen!.price)
                                            : 'Harga: ' +
                                                NumberFormat.currency(
                                                        locale: 'id_IDR',
                                                        decimalDigits: 0,
                                                        symbol: 'Rp')
                                                    .format(
                                                        widget.medicine!.price),
                                        style: kSeccondText.copyWith(
                                            color: Colors.green))
                                  ]);
                            } else {
                              return SpinKitFadingCircle(
                                size: 50,
                                color: kPrussanBlue,
                              );
                            }
                          }),
                      Container(
                        height: 150,
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: TextField(
                            onChanged: (text) {
                              setState(() {
                                isAdressValid =
                                    addressController.text.length > 1;
                              });
                            },
                            controller: addressController,
                            keyboardType: TextInputType.multiline,
                            expands: true,
                            maxLines: null,
                            minLines: null,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.redAccent),
                                errorText: isAdressValid
                                    ? null
                                    : "Please fill the Address",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kPrussanBlue, width: 2)),
                                hintText: "Enter your Address",
                                labelText: 'Address',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)))),
                      ),
                      isCheckout
                          ? SpinKitFadingCircle(
                              size: 50,
                              color: kPrussanBlue,
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  fixedSize: Size(150, 38)),
                              onPressed: () async {
                                setState(() {
                                  isCheckout = true;
                                });
                                YoursTransaction transaction = YoursTransaction(
                                    userId: user.uid,
                                    item: widget.isOxygen
                                        ? 'Tabung oksigen ${widget.oxygen!.size}'
                                        : widget.medicine!.packageName,
                                    name: widget.name,
                                    email: widget.email,
                                    phone: widget.phone,
                                    price: widget.isOxygen
                                        ? widget.oxygen!.price
                                        : widget.medicine!.price,
                                    address: addressController.text);

                                var result =
                                    await TransactionServices.storeTransaction(
                                        transaction);

                                if (result.message != null) {
                                  Flushbar(
                                    duration: Duration(seconds: 2),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Color(0xFFFF5C83),
                                    message: result.message,
                                  )..show(context);
                                  setState(() {
                                    isCheckout = false;
                                  });
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                  Flushbar(
                                    duration: Duration(seconds: 5),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.green,
                                    message:
                                        'Pesanan anda berhasil di proses dan akan segera di kirim',
                                  )..show(context);
                                }
                              },
                              child: Center(
                                child: Text(
                                  'Checkout',
                                  style:
                                      kMainText.copyWith(color: Colors.white),
                                ),
                              ))
                    ]),
                  ),
                ),
              ),
            ),
            BlueHeaderWidget(text: 'Checkout'),
          ],
        ),
      ),
    );
  }
}
