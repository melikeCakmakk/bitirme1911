import 'dart:convert';
import 'dart:ffi';

import 'package:bitirme_pjesi/cari.dart';
import 'package:bitirme_pjesi/listeler/listeler.dart';
import 'package:bitirme_pjesi/modeller/MusteriModel.dart';
import 'package:bitirme_pjesi/modeller/stokModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class YanMenu extends StatefulWidget {
  @override
  State<YanMenu> createState() => _YanMenuState();
}

class _YanMenuState extends State<YanMenu> {
  String _currentDateTime = '';

  @override
  void initState() {
    super.initState();
    // Widget oluşturulduğunda, zamanı güncelleyen bir işlem başlatılır.
    updateDateTime();
  }

  void updateDateTime() {
    setState(() {
      _currentDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    });

    // Her saniye tekrar güncelleme yapar.
    Future.delayed(Duration(seconds: 1), updateDateTime);
  }

  //const YanMenu({Key? key}) : super(key: key);
  String tempMusteriJson='''
  [{"ID":"0","KOD":"001","ADI":"HANÖNÜ POS SATIŞLARI","ILCE":"","IL":"","ADRES":"","VERGIDAIRESI":"","VERGINO":"","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"","FAX":"","FIYAT":"1","ULKEID":"1","EMAIL":"","WEB":"","PLASIYERID":"0","ISKONTO":"0.00","EFATURAMI":"H","VADEGUNU":"0","BAKIYE":"-185.3700","KOSULID":"0"},{"ID":"0","KOD":"002","ADI":"DUMLUPINAR POS SATIŞLARI","ILCE":"","IL":"","ADRES":"","VERGIDAIRESI":"","VERGINO":"","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"","FAX":"","FIYAT":"1","ULKEID":"1","EMAIL":"","WEB":"","PLASIYERID":"0","ISKONTO":"0.00","EFATURAMI":"H","VADEGUNU":"0","BAKIYE":"-2010637.3200","KOSULID":"0"},{"ID":"0","KOD":"120-0008022","ADI":"SERASAN YAPI TEKNİKLERİ SANAYİ VE TİCARET LİMİTED ŞİRKETİ","ILCE":"SANDIKLI","IL":"AFYON","ADRES":"YUNUS EMRE MAH. ANTALYA CAD.  37","VERGIDAIRESI":"SANDIKLI","VERGINO":"7610538301","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"90272","FAX":"","FIYAT":"1","ULKEID":"1","EMAIL":"info@serasan.com.tr","WEB":"www.serasan.com.tr","PLASIYERID":"0","ISKONTO":"25.00","EFATURAMI":"E","VADEGUNU":"0","BAKIYE":"-25729.1800","KOSULID":"0"},{"ID":"0","KOD":"120-0008793","ADI":"AFM OTOMOTİV MEHMETALİ ÇALIŞIR","ILCE":"MERKEZ","IL":"AFYON","ADRES":"VEYSELKARANİ MAH.1145 SOK.NO:106\/A","VERGIDAIRESI":"","VERGINO":"20023253658","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"90272","FAX":"","FIYAT":"1","ULKEID":"0","EMAIL":"","WEB":"","PLASIYERID":"0","ISKONTO":"0.00","EFATURAMI":"H","VADEGUNU":"0","BAKIYE":"-214390.7200","KOSULID":"0"},{"ID":"0","KOD":"120-0008794","ADI":"DERİN VADİ SİTESİ ABDURRAHMAN GÖRGÜN","ILCE":"BODRUM","IL":"MUĞLA","ADRES":"YALI KAVAK MAH.70.SOKAK ","VERGIDAIRESI":"","VERGINO":"61759152174","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"90252","FAX":"","FIYAT":"1","ULKEID":"0","EMAIL":"","WEB":"","PLASIYERID":"0","ISKONTO":"0.00","EFATURAMI":"H","VADEGUNU":"0","BAKIYE":"640.0300","KOSULID":"0"},{"ID":"0","KOD":"120-0008795","ADI":"YILMAZ HOBİ EVİ  -  ALİ YILMAZ","ILCE":"MERKEZ","IL":"AFYON","ADRES":"AKMESCİT MAH.YUKARI PAZAR CD.NO:40-B","VERGIDAIRESI":"","VERGINO":"9670270425","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"90272","FAX":"","FIYAT":"1","ULKEID":"1","EMAIL":"","WEB":"","PLASIYERID":"0","ISKONTO":"0.00","EFATURAMI":"H","VADEGUNU":"0","BAKIYE":"-125878.0400","KOSULID":"0"},{"ID":"0","KOD":"120-0008796","ADI":"TCDD 7.BÖLGE EMLAK MÜDÜRLÜĞÜ","ILCE":"","IL":"","ADRES":"","VERGIDAIRESI":"","VERGINO":"2940034188","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"","FAX":"","FIYAT":"1","ULKEID":"0","EMAIL":"","WEB":"","PLASIYERID":"0","ISKONTO":"0.00","EFATURAMI":"H","VADEGUNU":"0","BAKIYE":"1010.5000","KOSULID":"0"},{"ID":"0","KOD":"120-0008797","ADI":"GİZEM KURT HEPSİBURADA.COM","ILCE":"BUHARKENT","IL":"AYDIN","ADRES":"FESLEK MAH.NO:160  BUHARKENT","VERGIDAIRESI":"","VERGINO":"","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"90256","FAX":"","FIYAT":"1","ULKEID":"1","EMAIL":"","WEB":"","PLASIYERID":"0","ISKONTO":"0.00","EFATURAMI":"H","VADEGUNU":"0","BAKIYE":"54452.4445","KOSULID":"7"},{"ID":"0","KOD":"120-0008798","ADI":"ÖZMAK GIDA SAN.TİC.LTD.ŞTİ.","ILCE":"MERKEZ","IL":"AFYONKARAHİSAR","ADRES":"Taşoluk Kasabası ","VERGIDAIRESI":"SİNANPAŞA MAL MÜD.","VERGINO":"6620084572","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"90272","FAX":"","FIYAT":"1","ULKEID":"0","EMAIL":"","WEB":"","PLASIYERID":"0","ISKONTO":"0.00","EFATURAMI":"H","VADEGUNU":"0","BAKIYE":"99900.0000","KOSULID":"0"},{"ID":"0","KOD":"120-0008799","ADI":"ŞEHNAZ ÖZDEMİR","ILCE":"","IL":"","ADRES":"","VERGIDAIRESI":"","VERGINO":"","KIMLIKNO":"","TIPI":"Alıcı","TELEFON":"","FAX":"","FIYAT":"1","ULKEID":"0","EMAIL":"","WEB":"","PLASIYERID":"0","ISKONTO":"0.00","EFATURAMI":"H","VADEGUNU":"0","BAKIYE":"-225.0000","KOSULID":"0"}]

''';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.0),
      child: Drawer( //Sürüklenebilir menü
        backgroundColor: Color.fromARGB(255, 29, 29,29),
      child:Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 20),
                child: Text(  '$_currentDateTime',
                  style: TextStyle(fontSize: 17,color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 70),
                child: IconButton(
                  onPressed: (){
                    showModalBottomSheet(
                        backgroundColor: Colors.black,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20)
                          ),

                        ),
                        builder: (context)=>Container(child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.image,color: Colors.amber,),
                              title: Text('Logomu Değiştir',style: TextStyle(color: Colors.white),),
                            ),
                            ListTile(
                                leading: Icon(Icons.update,color: Colors.green,),
                                title: Text('Tüm Verileri Güncelle',style: TextStyle(color: Colors.white,),)
                            ),
                            ListTile(
                              leading: Icon(Icons.exit_to_app,color: Colors.red,),
                              title: Text('Çıkış Yap',style: TextStyle(color: Colors.white),),
                            ),
                          ],
                        ),
                        ));
                  },
                  icon: Icon(Icons.more_vert,color: Colors.white,),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Image.asset('images/dk1.png'),
          ),
          Row(
            children: [
                Padding(padding: EdgeInsets.only(top: 20,left: 70),
                child: Text('HER ZAMAN SİZİNLE...',style: TextStyle(color: Colors.white,fontSize:15.0 ),),
                ),


            ],
          ),
          Expanded(child: ListView(
            children: [
            ExpansionTile(// leading-title-trealing
                leading: Icon(Icons.group,color: Colors.white,),
                title: Text('Cari İşlemler',style:TextStyle(color: Colors.white,fontSize: 15.0) ,),
                trailing: Icon(Icons.expand_more,color: Colors.white,),
              children: [
                 Container(
                   margin: EdgeInsets.only(left: 10.0),
                   child: ListTile(
                     leading: Icon(Icons.list,color: Colors.white,),
                     title: Text('Cari Kart Listesi',style: TextStyle(color: Colors.white),),
                     onTap: (){
                    //  Listeler listeler=Listeler();
                    //  listeler.
                   List<dynamic> jsonulisteyecevir= json.decode(tempMusteriJson); //JSON String-->MAP CEVİRCEK.
                   for (var element in jsonulisteyecevir) {
                    MusteriModel model=MusteriModel.fromJson(element);
                    Listeler.musteriList.add(model);

                   }

                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Cari(

                   )));
                     },
                   ),
                 ),
               ],
                //trailing: Icon(Icons.expand_more,color: Colors.white,),
               // onTap: (){  Navigator.pop(context); },
              ),
              Divider(
                height: 15.0,
                color:  Colors.black,
              ),

              ExpansionTile(
                  leading: Icon(Icons.receipt,color: Colors.white,),
                  title: Text('Fatura İşlemleri',style:TextStyle(color: Colors.white,fontSize: 15.0) ,),
                  trailing: Icon(Icons.expand_more,color: Colors.white,),
                children:[
                  Container(
                    child: Padding(padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.shopping_bag,color: Colors.white,),
                      title: Text('Satış Fatura Kayıt',style: TextStyle(color: Colors.white),),
                    ),),
                  ),
                  Container(
                    child: Padding(padding: EdgeInsets.only(left: 10.0),
                      child: ListTile(
                        leading: Icon(Icons.receipt_long,color: Colors.white,),
                        title: Text('Alış İrsaliye Kayıt',style: TextStyle(color: Colors.white),),
                      ),),
                  ),
                ]

              ),


              ExpansionTile(
                  title: Text('Stok İşlemleri',style: TextStyle(color: Colors.white),),
                  leading:Icon( Icons.category,color: Colors.white,),
                  trailing: Icon(Icons.expand_more,color: Colors.white,),
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.app_registration,color: Colors.white,),
                      title: Text('Stok Kart Listesi',style: TextStyle(color: Colors.white),),
                      onTap: (){  
                      List<dynamic> jsonulisteyecevir= json.decode(StokModel.tempStokJson); //JSON String-->MAP CEVİRCEK.
                   for (var element in jsonulisteyecevir) {
                    StokModel model=StokModel.fromJson(element);
                    Listeler.stokList.add(model);

                   }
                   print("oke");
                   print(Listeler.stokList.length);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.local_shipping,color: Colors.white,),
                      title: Text('Depo Transfer',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.content_paste_search,color: Colors.white,),
                      title: Text('Sayım Kayıt Fişi',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                ],
              ),

              ExpansionTile(
                title:  Text('Tahsilat ve Ödeme İşlemleri',style:TextStyle(color: Colors.white,fontSize: 15.0) ,),
                leading: Icon(Icons.credit_card,color: Colors.white,),
                trailing: Icon(Icons.expand_more,color: Colors.white,),
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 10.0),
                   child: ListTile(// leading-title-trealing
                     leading: Icon(Icons.add_card,color: Colors.white,),
                     title: Text('Tahsilat',style: TextStyle(color: Colors.white),),
                     onTap: (){  Navigator.pop(context); },
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.only(left: 10.0),
                   child: ListTile(// leading-title-trealing
                     leading: Icon(Icons.account_balance_wallet,color: Colors.white,),
                     title: Text('Ödeme',style: TextStyle(color: Colors.white),),
                     onTap: (){  Navigator.pop(context); },
                   ),
                 ),
               ],
              ),
              Divider(
                height: 15.0,
                color:  Colors.black,
              ),

              ExpansionTile(
                  leading: Icon(Icons.insert_chart,color: Colors.white,),
                  title:Text('Raporlar',style:TextStyle(color: Colors.white,fontSize: 15.0) ,),
                  trailing: Icon(Icons.expand_more,color: Colors.white,),
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.badge,color: Colors.white,),
                      title: Text('Cari Raporları',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.query_stats,color: Colors.white,),
                      title: Text('Stok Raporları',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.bar_chart,color: Colors.white,),
                      title: Text('Fatura Raporları',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.cloud_upload,color: Colors.white,),
                      title: Text('Gönderilmiş Faturalar',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.cloud_upload,color: Colors.white,),
                      title: Text('Gönderilmiş Tahsilat & Ödemeler',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.cloud_upload,color: Colors.white,),
                      title: Text('Gönderilmiş Sayımlar',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),

                ],
              ),



            ],
          ))
        ],
      ),
      ),
    );
  }
}
