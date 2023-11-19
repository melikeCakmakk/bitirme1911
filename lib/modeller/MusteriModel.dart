class MusteriModel{
  int? ID;
  String? KOD = "";
  String? ADI = "";
  String? ILCE = "";
  String? IL = "";
  String? ADRES = "";         //MODEL OLUŞTURMA
  String? VERGIDAIRESI = "";
  String? VERGINO = "";
  String? KIMLIKNO = "";
  String? TELEFON = "";
  String? EMAIL = "";
  double? BAKIYE = 0.0;


  MusteriModel(
      {
    this.ID,
    this.KOD,              //OLUŞTURULAN MODELİN CONSRACTORI
    this.ADI,
    this.ILCE,
    this.IL,
    this.ADRES,
    this.VERGIDAIRESI,
    this. VERGINO,
    this.KIMLIKNO,
    this.TELEFON,
    this.EMAIL,
    this.BAKIYE,
  }
  );
  MusteriModel.fromJson(Map<String,dynamic> json ){
    ID=int.parse(json["ID"].toString());
    KOD=json["KOD"];
    ADI=json["ADI"];
    ILCE=json["ILCE"];
    IL=json["IL"];
    ADRES=json["ADRES"];
    VERGIDAIRESI=json["VERGIDAIRESI"];     //MODELİ JSONLA DOLDURMAK.
    VERGINO=json[" VERGINO"];
    KIMLIKNO=json[" KIMLIKNO"];
    TELEFON=json["TELEFON"];
    EMAIL=json["EMAIL"];
 
    BAKIYE=double.parse(json["BAKIYE"].toString());


  }


}