import 'package:flutter/material.dart';

class OfferViewDetail extends StatelessWidget {
  final String user, imageUrl ,briefChat, date;

  const OfferViewDetail({
    super.key,
    required this.user,
    required this.imageUrl,
    required this.briefChat,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
        width: width,
        height: 100.0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               Padding(
                  padding: const EdgeInsets.only(left: 10.0),                  
                  child: Container(
                  width: 40.0,
                  height: 40.0,  
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        imageUrl,
                        width: 58.0,
                        height: 58.0,
                        fit: BoxFit.cover,                      
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              user,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "From: "+date,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                Text(
                                  "Till: "+date,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            )
                          ),
                          Text(
                            briefChat,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ClipOval(
                  child: Material(
                    child: IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                     onPressed: () {
                          showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => 
                          AlertDialog(
                            title: const Text('Comfirmation!'),
                            content: const Text('Do you realy want to Accept Offer'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
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
                ClipOval(
                  child: Material(
                    child: 
                    IconButton(
                      icon: const Icon(Icons.cancel_outlined, color: Colors.red),
                      onPressed: () {
                          showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => 
                          AlertDialog(
                            title: const Text('Comfirmation!'),
                            content: const Text('Do you realy want to Decline Offer'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
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
