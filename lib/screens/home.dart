import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parxlab_project/helper/color_helper.dart';
import 'package:parxlab_project/helper/constants.dart';
import 'package:parxlab_project/utils/showSnackbar.dart';
import 'package:parxlab_project/services/status_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StatusService _statusService = StatusService();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showInSnackBar("Giriş Başarılı"));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 1 / 7,
              width: size.width,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.article,
                      size: 30,
                    ),
                    Text(
                      'Kayıtlar',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: size.height * .04,
                  width: size.width * .85,
                  margin: const EdgeInsets.only(bottom: 1.0),
                  decoration: BoxDecoration(
                    color: giris,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 0.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text('Plaka'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Text('Görevli'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Text('Lokasyon'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: size.height * .61,
                  width: size.width * .85,
                  margin: const EdgeInsets.only(bottom: 6.0),
                  decoration: BoxDecoration(
                    color: giris,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 0.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: StreamBuilder(
                    stream: _statusService.getStatus(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? CircularProgressIndicator()
                          : ListView.separated(
                              separatorBuilder: (BuildContext context, index) {
                                return Divider(
                                  color: Colors.black,
                                );
                              },
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot mypost =
                                    snapshot.data.documents[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text("${mypost['plaka']}"),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Text("${mypost['gorevli']}"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child:
                                                Text("${mypost['lokasyon']}"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
