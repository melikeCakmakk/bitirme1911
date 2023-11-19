import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'listeler/listeler.dart';
import 'modeller/MusteriModel.dart';
class Cari extends StatefulWidget {

  const Cari({Key? key,}) : super(key: key);

  @override
  State<Cari> createState() => _CariState();
}

class _CariState extends State<Cari> {
  var output = "0".obs; // get paketi kullanarak değişken böyle tanımlanıyor . obs diyon yani başının ucuna otur diyon bundan sonra artık output = "25" demiyon mesela şöyle d,yon output.value = "25" farkettiysen bundan sonra outpt nerde değişiyosa oraya output.value yazdım
  var sayi1 = 0.0;
  var sayi2 = 0.0;
  var islem = "";
  var ilktik = true;
  Color randomColor() {
    Random random = Random();
    int red = random.nextInt(128); // 0-127 arasında rastgele bir değer
    int green = random.nextInt(128);
    int blue = random.nextInt(128);
    return Color.fromARGB(255, red, green, blue);
  }
  buttonPressed(String buttonText) {
    if (ilktik) {
      output.value = "";
      ilktik = false;
    }


    if (buttonText == "TEMİZLE") {
      output.value = "0";
      sayi1 = 0.0;
      sayi2 = 0.0;
      islem = "";

    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      sayi1 = double.parse(output.value);
      islem = buttonText;
      output.value = sayi1.toString() + buttonText;
    } else if (buttonText == ".") {
      if (output.contains(".")) {
        print("Zaten Ondalık");
        return;
      } else {
        output.value = output.value + buttonText;
      }
    } else if (buttonText == "=") {
      if (islem == "+") {
        output.value = (sayi1 + sayi2).toString();
      }
      if (islem == "-") {
        output.value = (sayi1 - sayi2).toString();
      }
      if (islem == "X") {
        output.value = (sayi1 * sayi2).toString();
      }
      if (islem == "/") {
        output.value = (sayi1 / sayi2).toString();
      }
      sayi1 = 0.0;
      sayi2 = 0.0;
    } else {
      sayi2 = double.parse(buttonText);
      output.value =  output.value + buttonText;
    }
    print(output);
    // bak sildim mesela setstateyi

    output = output;
    print("OUt"+ output.value);

  }

  buildButton(String buttonText) {
    return Expanded(
        child: OutlinedButton(
          // padding: EdgeInsets.all(24),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            {buttonPressed(buttonText);};
          },
        ));
  }
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          //  backgroundColor: Colors.black,
          // title: Text('Bildirim'),
          // content: Text('Bu bir alert dialog örneğidir.'),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12,
                ),
                child: Obx(() => Text( // son olarak bu değişkeni kullandığın  yeri böyle obx widgeti ile sarman gerekiyo mesela ben texti sarmışım bak
                  output.value,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("X"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("+"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("TEMİZLE"),
                      buildButton("="),
                    ],),
                ],
              )
            ]
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'DÜKKAN CEPTE',
            style: TextStyle(
                fontWeight: FontWeight.normal
            ),
          ),
          backgroundColor: Color(0xE3011221),
          actions: [
            IconButton(onPressed: (){
              _showAlertDialog(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>hesap_makinesi()));
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>HesapMakinesi()));
            }, icon: Icon(Icons.calculate)),
            IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            IconButton(onPressed: (){}, icon: Icon(Icons.currency_lira))
          ],
        ),
        body:
         Column(
           children: [
              Row(
                children: [
                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width*0.85,
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
                                          prefixIcon: Icon(Icons.search),
                                            hintText: "Aranacak kelime(İsim/Kod/Marka)",
                                            filled: true,
                                            fillColor: Colors.white60,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            )),
                                      ),
                                    ),
                                  ),
                IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_outlined))                  
                ],
              ),
             Expanded(
               child: ListView.builder(
                   itemCount: Listeler.musteriList.length,
                   itemBuilder: (BuildContext context, int index) {
                     MusteriModel cariKart = Listeler.musteriList[index];
             
                     String trim = cariKart.ADI!.trim();
                     String harf1 = "";
                     String harf2 = "";
                     if (trim.length > 0) {
                harf1 = trim[0];
                if (trim.length == 1) {
                  harf2 = "K";
                } else {
                  harf2 = trim[1];
                }
                     } else {
                harf1 = "A";
                harf2 = "B";
                     }
                     return Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:5.0 ),
                          child: CircleAvatar(
                            child: Text(harf1+harf2!),
                            backgroundColor: randomColor(),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(cariKart.ADI!),
                            subtitle: Text(cariKart.IL!),
                            trailing: Text(cariKart.BAKIYE!.toString()),
                          ),
                        ),
                      ],
                    ),
                  ),
                 Divider(
                  height: 8.0,
                  color: Colors.black,
                  
                 ),
                ],
                     );
             
                   },
             
                 ),
             ),
           ],
         ) );

  }
}
