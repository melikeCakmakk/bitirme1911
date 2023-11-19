import 'package:bitirme_pjesi/main.dart';
import 'package:flutter/material.dart';
class lisansSayfasi extends StatefulWidget {
  const lisansSayfasi({Key? key}) : super(key: key);

  @override
  State<lisansSayfasi> createState() => _lisansSayfasiState();
}

class _lisansSayfasiState extends State<lisansSayfasi> {
  bool isChanged=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
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
                padding: EdgeInsets.only(top: 60,left: 10.0),
                alignment: Alignment.topLeft,
                child: SizedBox(
                  
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.arrow_back),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                      }

                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top:10),
                  child: Image.asset('images/dk1.png')),
              Padding(
                padding: const EdgeInsets.only(top: 160),
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
                                  keyboardType: TextInputType.number, //Klavyeyi numaralı yapar.
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
                                      prefixIcon: Icon(Icons.confirmation_num_outlined),
                                      hintText: "Lisans Numarası Giriniz",
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
                                 // obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.perm_contact_cal),
                                      hintText: "Kullanıcı Kodu Giriniz",
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
                                 // obscureText: true,  // girilen texti görünmez yapar.
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.apartment),
                                      hintText: "Şirket İsmi Giriniz",
                                      filled: true,
                                      fillColor: Colors.white60,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      )),
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15,left: 15,right: 15),child:SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: (){

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
    );
  }
}
