import 'package:Fitter/models/modelo.dart';
import 'package:flutter/material.dart';
import 'package:Fitter/Helper/HttpHelper.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(body: Page()),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicacion Gimnasio"),
      ),
      body: FutureBuilder<List<SolicitudModel>>(
        future: HttpHelper().obtenerClientes(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
             print("algo");
            List<SolicitudModel> cliente = snapshot.data;
            return ListView.builder(
              itemCount: cliente.length,
              itemBuilder: (context, index) => 
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Container(
                  //margin: egdse,
                  height: 100,
                  width: 50,
                  child: Card(
                    
                    child: Column(
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(cliente[index].nombre,
                          style: TextStyle(
                            fontSize: 30
                          ),
                          ),
                          Text("Peso: " + cliente[index].peso.toString(),
                          style: TextStyle(
                            fontSize: 20
                          ),
                          ),
                          Text("Talla: " + ((cliente[index].talla)/100).toString(),
                          style: TextStyle(
                            fontSize: 20
                          ),),
                        ]),
                  ),
                ),
              ),
            );

            //Text(snapshot.data.toString());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
