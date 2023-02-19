import 'package:flutter/material.dart';
import 'DetailEdit.dart';

class postedItemDetail extends StatelessWidget {
  final Map<String, dynamic> item;

  const postedItemDetail({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black87),
          borderRadius: BorderRadius.circular(20),
        ),
        //width: 160,
        height: 75.0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child:
                        // Image.asset(
                        //   imageUrl,
                        //   width: 58.0,
                        //   height: 58.0,
                        //   fit: BoxFit.cover,
                        // ),

                        Container(
                      margin: EdgeInsets.all(6.0),
                      width: 58.0,
                      height: 58.0,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage("" + item['images'][0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10.0, left: 5),
                              child: Text(
                                item['title'],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                (item['description'].length > 30)
                                    ? (item['description']
                                            .toString()
                                            .substring(0, 30) +
                                        '...')
                                    : (item['description'].toString()),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ClipOval(
                  child: Material(
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.black54),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditDetailView(
                                      id: item['id'],
                                      title: item['title'],
                                      category: item['category_id'],
                                      description: item['description'],
                                      price: item['price'].toString(),
                                      guaranteePrice:
                                          item['guarantee_price'].toString(),
                                      days: '1',
                                      quantity: item['quantity'].toString(),
                                    )));
                      },
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.black54),
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Comfirmation!'),
                            content: const Text(
                                'Do you realy want to delete your posted Item'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
