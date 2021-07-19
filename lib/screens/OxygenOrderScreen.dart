part of 'Screens.dart';

class OxygenOrderScreen extends StatelessWidget {
  const OxygenOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(bottom: 18),
              child: Column(
                children: [
                  BlueHeaderWidget(text: 'Pesan Oksigen'),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 18),
                      child: ListView.builder(
                          itemCount: oxygens.length,
                          itemBuilder: (context, index) {
                            final Oxygen oxygen = oxygens[index];
                            return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                margin: EdgeInsets.only(bottom: 16),
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
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tabung oksigen ukuran ${oxygen.size}',
                                      style: kMainText.copyWith(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            'Harga: ' +
                                                NumberFormat.currency(
                                                        locale: 'id_IDR',
                                                        decimalDigits: 0,
                                                        symbol: 'Rp')
                                                    .format(oxygen.price),
                                            style: kSeccondText.copyWith(
                                                fontSize: 14,
                                                color: Colors.green)),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.green),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CheckoutScreen(
                                                            isOxygen: true,
                                                            oxygen: oxygen,
                                                          )));
                                            },
                                            child: Center(
                                              child: Text('Beli'),
                                            ))
                                      ],
                                    )
                                  ],
                                ));
                          }),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
