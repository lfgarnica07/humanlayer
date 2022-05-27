import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
        body: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                  blurRadius: 20.0,
                  spreadRadius:5.0,
                  offset: Offset(
                    5.0,5.0
                  )
              )
            ],
            color: Colors.amber ,
              borderRadius: BorderRadius.circular(20)
          ),
          margin: EdgeInsets.only(top: 50,left: 20, right: 20, bottom: 50 ),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("imagenes/Sesion.png",height: 160, ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email"
                      ),
                    ),
                    SizedBox(height: 50),
                    TextField(
                      controller: password,
                      decoration: InputDecoration(
                          hintText: "Contraseña"
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70 ),
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: FlatButton(
                        child: Text("Login", style: TextStyle(color: Colors.white,fontSize: 20),),
                        onPressed: (){},
                      ) ,
                    ),
                    SizedBox(height: 100),
                    Text("¿Nuevo Usuario? crea una cuenta")
                  ],
                ),
            ),
        ),
    );
  }
}

