import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  HomePage({super.key});

  void addData() {
    _firestore.collection('brand').add({
      'brandId': '5',
      'title': DateTime.now().millisecond.toString(),
      'imageUrl': 'http',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: addData,
            child: const Text('Add Brand'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _firestore.collection('brand').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final brand = snapshot.data?.docs;
                return ListView.builder(
                  itemCount: brand?.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(brand?[index]['title']),
                      subtitle: Text('${brand?[index]['imageUrl']}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
