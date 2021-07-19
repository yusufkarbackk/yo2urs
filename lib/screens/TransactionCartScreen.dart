part of 'Screens.dart';

class TransactionCartScreen extends StatelessWidget {
  const TransactionCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of(context);
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: TransactionServices.getTransactions(user!.uid),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                List<Widget> list = [];
                final transactions = snapshots.data!.docs;
                for (var item in transactions) {
                  list.add(Container(
                    child: Card(
                        color: kPrussanBlue,
                        elevation: 3,
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Row(
                          children: [
                            Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(
                                    (item.data() as dynamic)['isOxygen']
                                        ? 'images/oxygen-logo.png'
                                        : 'images/medicine-logo.png')),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      'Barang: ' +
                                          (item.data() as dynamic)['item'],
                                      style: kMainText.copyWith(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      'Atas nama: ' +
                                          (item.data() as dynamic)['name'],
                                      style: kSeccondText.copyWith(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      'Alamat: ' +
                                          (item.data() as dynamic)['address'],
                                      style: kSeccondText.copyWith(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                        'Harga: ' +
                                            NumberFormat.currency(
                                                    locale: 'id_IDR',
                                                    decimalDigits: 0,
                                                    symbol: 'Rp')
                                                .format((item.data()
                                                    as dynamic)['price']),
                                        style: kSeccondText.copyWith(
                                            color: Colors.white, fontSize: 14)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text('Status: Dikirim',
                                        style: kSeccondText.copyWith(
                                            color: Colors.white, fontSize: 14)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ));
                }
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    padding: EdgeInsets.only(top: 50),
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: list[index],
                          );
                        }),
                  ),
                );
              } else {
                return Container();
              }
            }),
        BlueHeaderWidget(text: 'Your Cart'),
      ],
    )));
  }
}
