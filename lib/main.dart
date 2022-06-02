import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/registro.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
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
  validarDatos() async{
    try{
      CollectionReference ref= FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot Usuario= await ref.get();
      if(Usuario.docs.length !=0){
        for(var cursor in Usuario.docs) {
          if (cursor.get("email") == email.text) {
            print("Usuario encontrado");
            print(cursor.get("Telefono"));
            if (cursor.get("Contraseña") == password.text) {
              print("Acceso aceptado");
              print("estado"+cursor.get("Nombre"));
            }
          }
        }
      }else {
        print("No se encuentra registrado");
      }
    }catch(e){
      print("Error...."+e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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
            color: Colors.amber,
              borderRadius: BorderRadius.circular(20)
          ),
          margin: EdgeInsets.only(top: 50,left: 20, right: 20, bottom: 50 ),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("imagenes/Sesion.png",height: 120, ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 50),
                    TextField(
                      controller: password,
                      decoration: InputDecoration(
                          hintText: "Contraseña",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70 ),
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: ElevatedButton(
                        child: Text("Login", style: TextStyle(color: Colors.white,fontSize: 20),),
                        onPressed: (){
                          print(email.text);
                          print(password.text);
                          validarDatos();
                          print("presionado");
                          validarDatos();
                          email.clear();
                          password.clear();
                        },
                      ) ,
                    ),
                    SizedBox(height: 10),
                    Container(
                    child: ElevatedButton(
                      child: Text("¿Nuevo Usuario? crea una cuenta"),
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (_)=>registro()));
                      },
                    ) ,
                    ),
                  ],
                ),
            ),
        ),
    );
  }
}

