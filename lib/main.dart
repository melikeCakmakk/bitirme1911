import 'package:bitirme_pjesi/anaSayfa.dart';
import 'package:bitirme_pjesi/lisansSayfasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 // bool durum=true;
//  bool durum2=false;
bool isChanged=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView( // o taşmayı çözen arkadaş
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/filigrankaldirildi.jpeg'), // Resim dosyasının yolu
                fit: BoxFit.cover, // Resmi ekranı tamamen kaplayacak şekilde ayarlar
              ),
            ),

            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 60,right: 10.0),
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: FloatingActionButton(
                      backgroundColor: Colors.grey,
                        child: Icon(Icons.settings),
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>lisansSayfasi()));
                        }

                    ),
                  ),
                ),
                
                Padding(padding: EdgeInsets.only(top:10),
                 child: Image.asset('images/dk1.png')),

                Padding(
                  padding: const EdgeInsets.only(top: 210),
                    child: Stack(
                      children: [
                      //  Image.asset("images/resim2.jpg"),
                        Container(
                          width: double.infinity,
                          color: Color.fromARGB(108, 247, 227, 227),
                          margin: EdgeInsets.all(30),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 500,
                                  height: 60,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return null;
                                      } else {}
                                    },
                                    onSaved: (value) {

                                    },
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                        hintText: "Kullanıcı kodu",
                                        filled: true,
                                        fillColor: Colors.white60,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 500,
                                  height: 60,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return null;
                                      } else {}
                                    },
                                    onSaved: (value) {

                                    },
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                        hintText: "Şifre",
                                        filled: true,
                                        fillColor: Colors.white60,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        )),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.only(top: 10),
                                      child: Checkbox(value: isChanged,

                                        onChanged: (newbool){
                                          setState(() {
                                            isChanged=newbool!;
                                          });
                                        },
                                      ),
                                    ),

                                    Padding(padding: EdgeInsets.only(top: 10,right: 200),
                                      child: Text("Şifremi Hatırla",style:TextStyle(fontSize: 14) ,),
                                    ),
                                  ],
                                ),
                              ),


                      Padding(padding: EdgeInsets.only(top: 15,left: 15,right: 15),child:SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>anaSayfa()));
                          }, child: Text("Giriş Yap"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey
                          ),),
                      ),
                      )  ],
                          )
                        ),
                      ],
                    ),

                ),
              ],
            ),

          ),
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
