// To parse this JSON data, do
//
//     final plantDetailsDropdown = plantDetailsDropdownFromJson(jsonString);

import 'dart:convert';

PlantDetailsDropdown plantDetailsDropdownFromJson(String str) =>
    PlantDetailsDropdown.fromJson(json.decode(str));

String plantDetailsDropdownToJson(PlantDetailsDropdown data) =>
    json.encode(data.toJson());

class PlantDetailsDropdown {
  List<Plant> plants;
  Trains trains;
  Passes passes;
  Stages stages;

  PlantDetailsDropdown({
    required this.plants,
    required this.trains,
    required this.passes,
    required this.stages,
  });

  factory PlantDetailsDropdown.fromJson(Map<String, dynamic> json) =>
      PlantDetailsDropdown(
        plants: List<Plant>.from(json["plants"].map((x) => Plant.fromJson(x))),
        trains: Trains.fromJson(json["trains"]),
        passes: Passes.fromJson(json["passes"]),
        stages: Stages.fromJson(json["stages"]),
      );

  Map<String, dynamic> toJson() => {
        "plants": List<dynamic>.from(plants.map((x) => x.toJson())),
        "trains": trains.toJson(),
        "passes": passes.toJson(),
        "stages": stages.toJson(),
      };
}

class Passes {
  List<Train1P1328> train1P1328;
  List<Train2P1328> train2P1328;
  List<Train1P2328> train1P2328;
  List<Train1E4C0Sin> train1E4C0Sin;
  List<Train1Lx58Zqj> train1Lx58Zqj;
  List<dynamic> train133C5Bvm;
  List<Train1164Jy> train1164Jies;
  List<Train2M5T3Ckb> train2M5T3Ckb;
  List<dynamic> train16Zj32Wv;
  List<Train1Tq7N7Ky> train1Tq7N7Ky;
  List<Train1Oki7Pv> train1Oki7Pvs;
  List<Train1Guo387O> train1Guo387O;
  List<dynamic> train1Abh70Ca;
  List<Train1Qup3G0K> train1Qup3G0K;
  List<Train11Dou7Lh> train11Dou7Lh;
  List<Train1Kicdsq9> train1Kicdsq9;
  List<Train1Mgmf51C> train1Mgmf51C;
  List<dynamic> train1Xhm3H69;
  List<Train1Chbb5Mk> train1Chbb5Mk;
  List<Train1Xnz904J> train1Xnz904J;
  List<Train1Ruqjbob> train1Ruqjbob;
  List<Train1H4Hj6Lq> train1H4Hj6Lq;
  List<Train113Fty6Z> train113Fty6Z;
  List<Train15P3W7Fm> train15P3W7Fm;
  List<Train1Xr2Irdh> train1Xr2Irdh;
  List<Train1A6Ent5F> train1A6Ent5F;
  List<Train1Oe5Luwb> train1Oe5Luwb;
  List<Train1Nttjv94> train1Nttjv94;
  List<Train1Bvura03> train1Bvura03;
  List<Train1Xudv4J> train1Xudv4Js;
  List<Train1Amu73Ml> train1Amu73Ml;
  List<Train11G9Xzgv> train11G9Xzgv;
  List<Train1I25P7En> train1I25P7En;
  List<Train1Pd2Br6I> train1Pd2Br6I;
  List<Train20Mxdhzr> train20Mxdhzr;
  List<Train3Xyx01Kz> train3Xyx01Kz;
  List<Train1Tt3Lsjm> train1Tt3Lsjm;
  List<Train1O0V1Jqc> train1O0V1Jqc;
  List<Train1Se4C0Nz> train1Se4C0Nz;
  List<Train1Kjvwy3B> train1Kjvwy3B;
  List<Train1Wgyn2Gv> train1Wgyn2Gv;
  List<Train14Ej4Hum> train14Ej4Hum;
  List<Train1X0Udbql> train1X0Udbql;

  Passes({
    required this.train1P1328,
    required this.train2P1328,
    required this.train1P2328,
    required this.train1E4C0Sin,
    required this.train1Lx58Zqj,
    required this.train133C5Bvm,
    required this.train1164Jies,
    required this.train2M5T3Ckb,
    required this.train16Zj32Wv,
    required this.train1Tq7N7Ky,
    required this.train1Oki7Pvs,
    required this.train1Guo387O,
    required this.train1Abh70Ca,
    required this.train1Qup3G0K,
    required this.train11Dou7Lh,
    required this.train1Kicdsq9,
    required this.train1Mgmf51C,
    required this.train1Xhm3H69,
    required this.train1Chbb5Mk,
    required this.train1Xnz904J,
    required this.train1Ruqjbob,
    required this.train1H4Hj6Lq,
    required this.train113Fty6Z,
    required this.train15P3W7Fm,
    required this.train1Xr2Irdh,
    required this.train1A6Ent5F,
    required this.train1Oe5Luwb,
    required this.train1Nttjv94,
    required this.train1Bvura03,
    required this.train1Xudv4Js,
    required this.train1Amu73Ml,
    required this.train11G9Xzgv,
    required this.train1I25P7En,
    required this.train1Pd2Br6I,
    required this.train20Mxdhzr,
    required this.train3Xyx01Kz,
    required this.train1Tt3Lsjm,
    required this.train1O0V1Jqc,
    required this.train1Se4C0Nz,
    required this.train1Kjvwy3B,
    required this.train1Wgyn2Gv,
    required this.train14Ej4Hum,
    required this.train1X0Udbql,
  });

  factory Passes.fromJson(Map<String, dynamic> json) => Passes(
        train1P1328: List<Train1P1328>.from(
            json["TRAIN-1-P1-328"].map((x) => Train1P1328.fromJson(x))),
        train2P1328: List<Train2P1328>.from(
            json["TRAIN-2-P1-328"].map((x) => Train2P1328.fromJson(x))),
        train1P2328: List<Train1P2328>.from(
            json["TRAIN-1-P2-328"].map((x) => Train1P2328.fromJson(x))),
        train1E4C0Sin: List<Train1E4C0Sin>.from(
            json["TRAIN-1-E4C0SIN"].map((x) => Train1E4C0Sin.fromJson(x))),
        train1Lx58Zqj: List<Train1Lx58Zqj>.from(
            json["TRAIN-1-LX58ZQJ"].map((x) => Train1Lx58Zqj.fromJson(x))),
        train133C5Bvm:
            List<dynamic>.from(json["TRAIN-1-33C5BVM"].map((x) => x)),
        train1164Jies: List<Train1164Jy>.from(
            json["TRAIN-1-164JIES"].map((x) => Train1164Jy.fromJson(x))),
        train2M5T3Ckb: List<Train2M5T3Ckb>.from(
            json["TRAIN-2-M5T3CKB"].map((x) => Train2M5T3Ckb.fromJson(x))),
        train16Zj32Wv:
            List<dynamic>.from(json["TRAIN-1-6ZJ32WV"].map((x) => x)),
        train1Tq7N7Ky: List<Train1Tq7N7Ky>.from(
            json["TRAIN-1-TQ7N7KY"].map((x) => Train1Tq7N7Ky.fromJson(x))),
        train1Oki7Pvs: List<Train1Oki7Pv>.from(
            json["TRAIN-1-OKI7PVS"].map((x) => Train1Oki7Pv.fromJson(x))),
        train1Guo387O: List<Train1Guo387O>.from(
            json["TRAIN-1-GUO387O"].map((x) => Train1Guo387O.fromJson(x))),
        train1Abh70Ca:
            List<dynamic>.from(json["TRAIN-1-ABH70CA"].map((x) => x)),
        train1Qup3G0K: List<Train1Qup3G0K>.from(
            json["TRAIN-1-QUP3G0K"].map((x) => Train1Qup3G0K.fromJson(x))),
        train11Dou7Lh: List<Train11Dou7Lh>.from(
            json["TRAIN-1-1DOU7LH"].map((x) => Train11Dou7Lh.fromJson(x))),
        train1Kicdsq9: List<Train1Kicdsq9>.from(
            json["TRAIN-1-KICDSQ9"].map((x) => Train1Kicdsq9.fromJson(x))),
        train1Mgmf51C: List<Train1Mgmf51C>.from(
            json["TRAIN-1-MGMF51C"].map((x) => Train1Mgmf51C.fromJson(x))),
        train1Xhm3H69:
            List<dynamic>.from(json["TRAIN-1-XHM3H69"].map((x) => x)),
        train1Chbb5Mk: List<Train1Chbb5Mk>.from(
            json["TRAIN-1-CHBB5MK"].map((x) => Train1Chbb5Mk.fromJson(x))),
        train1Xnz904J: List<Train1Xnz904J>.from(
            json["TRAIN-1-XNZ904J"].map((x) => Train1Xnz904J.fromJson(x))),
        train1Ruqjbob: List<Train1Ruqjbob>.from(
            json["TRAIN-1-RUQJBOB"].map((x) => Train1Ruqjbob.fromJson(x))),
        train1H4Hj6Lq: List<Train1H4Hj6Lq>.from(
            json["TRAIN-1-H4HJ6LQ"].map((x) => Train1H4Hj6Lq.fromJson(x))),
        train113Fty6Z: List<Train113Fty6Z>.from(
            json["TRAIN-1-13FTY6Z"].map((x) => Train113Fty6Z.fromJson(x))),
        train15P3W7Fm: List<Train15P3W7Fm>.from(
            json["TRAIN-1-5P3W7FM"].map((x) => Train15P3W7Fm.fromJson(x))),
        train1Xr2Irdh: List<Train1Xr2Irdh>.from(
            json["TRAIN-1-XR2IRDH"].map((x) => Train1Xr2Irdh.fromJson(x))),
        train1A6Ent5F: List<Train1A6Ent5F>.from(
            json["TRAIN-1-A6ENT5F"].map((x) => Train1A6Ent5F.fromJson(x))),
        train1Oe5Luwb: List<Train1Oe5Luwb>.from(
            json["TRAIN-1-OE5LUWB"].map((x) => Train1Oe5Luwb.fromJson(x))),
        train1Nttjv94: List<Train1Nttjv94>.from(
            json["TRAIN-1-NTTJV94"].map((x) => Train1Nttjv94.fromJson(x))),
        train1Bvura03: List<Train1Bvura03>.from(
            json["TRAIN-1-BVURA03"].map((x) => Train1Bvura03.fromJson(x))),
        train1Xudv4Js: List<Train1Xudv4J>.from(
            json["TRAIN-1-XUDV4JS"].map((x) => Train1Xudv4J.fromJson(x))),
        train1Amu73Ml: List<Train1Amu73Ml>.from(
            json["TRAIN-1-AMU73ML"].map((x) => Train1Amu73Ml.fromJson(x))),
        train11G9Xzgv: List<Train11G9Xzgv>.from(
            json["TRAIN-1-1G9XZGV"].map((x) => Train11G9Xzgv.fromJson(x))),
        train1I25P7En: List<Train1I25P7En>.from(
            json["TRAIN-1-I25P7EN"].map((x) => Train1I25P7En.fromJson(x))),
        train1Pd2Br6I: List<Train1Pd2Br6I>.from(
            json["TRAIN-1-PD2BR6I"].map((x) => Train1Pd2Br6I.fromJson(x))),
        train20Mxdhzr: List<Train20Mxdhzr>.from(
            json["TRAIN-2-0MXDHZR"].map((x) => Train20Mxdhzr.fromJson(x))),
        train3Xyx01Kz: List<Train3Xyx01Kz>.from(
            json["TRAIN-3-XYX01KZ"].map((x) => Train3Xyx01Kz.fromJson(x))),
        train1Tt3Lsjm: List<Train1Tt3Lsjm>.from(
            json["TRAIN-1-TT3LSJM"].map((x) => Train1Tt3Lsjm.fromJson(x))),
        train1O0V1Jqc: List<Train1O0V1Jqc>.from(
            json["TRAIN-1-O0V1JQC"].map((x) => Train1O0V1Jqc.fromJson(x))),
        train1Se4C0Nz: List<Train1Se4C0Nz>.from(
            json["TRAIN-1-SE4C0NZ"].map((x) => Train1Se4C0Nz.fromJson(x))),
        train1Kjvwy3B: List<Train1Kjvwy3B>.from(
            json["TRAIN-1-KJVWY3B"].map((x) => Train1Kjvwy3B.fromJson(x))),
        train1Wgyn2Gv: List<Train1Wgyn2Gv>.from(
            json["TRAIN-1-WGYN2GV"].map((x) => Train1Wgyn2Gv.fromJson(x))),
        train14Ej4Hum: List<Train14Ej4Hum>.from(
            json["TRAIN-1-4EJ4HUM"].map((x) => Train14Ej4Hum.fromJson(x))),
        train1X0Udbql: List<Train1X0Udbql>.from(
            json["TRAIN-1-X0UDBQL"].map((x) => Train1X0Udbql.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-P1-328":
            List<dynamic>.from(train1P1328.map((x) => x.toJson())),
        "TRAIN-2-P1-328":
            List<dynamic>.from(train2P1328.map((x) => x.toJson())),
        "TRAIN-1-P2-328":
            List<dynamic>.from(train1P2328.map((x) => x.toJson())),
        "TRAIN-1-E4C0SIN":
            List<dynamic>.from(train1E4C0Sin.map((x) => x.toJson())),
        "TRAIN-1-LX58ZQJ":
            List<dynamic>.from(train1Lx58Zqj.map((x) => x.toJson())),
        "TRAIN-1-33C5BVM": List<dynamic>.from(train133C5Bvm.map((x) => x)),
        "TRAIN-1-164JIES":
            List<dynamic>.from(train1164Jies.map((x) => x.toJson())),
        "TRAIN-2-M5T3CKB":
            List<dynamic>.from(train2M5T3Ckb.map((x) => x.toJson())),
        "TRAIN-1-6ZJ32WV": List<dynamic>.from(train16Zj32Wv.map((x) => x)),
        "TRAIN-1-TQ7N7KY":
            List<dynamic>.from(train1Tq7N7Ky.map((x) => x.toJson())),
        "TRAIN-1-OKI7PVS":
            List<dynamic>.from(train1Oki7Pvs.map((x) => x.toJson())),
        "TRAIN-1-GUO387O":
            List<dynamic>.from(train1Guo387O.map((x) => x.toJson())),
        "TRAIN-1-ABH70CA": List<dynamic>.from(train1Abh70Ca.map((x) => x)),
        "TRAIN-1-QUP3G0K":
            List<dynamic>.from(train1Qup3G0K.map((x) => x.toJson())),
        "TRAIN-1-1DOU7LH":
            List<dynamic>.from(train11Dou7Lh.map((x) => x.toJson())),
        "TRAIN-1-KICDSQ9":
            List<dynamic>.from(train1Kicdsq9.map((x) => x.toJson())),
        "TRAIN-1-MGMF51C":
            List<dynamic>.from(train1Mgmf51C.map((x) => x.toJson())),
        "TRAIN-1-XHM3H69": List<dynamic>.from(train1Xhm3H69.map((x) => x)),
        "TRAIN-1-CHBB5MK":
            List<dynamic>.from(train1Chbb5Mk.map((x) => x.toJson())),
        "TRAIN-1-XNZ904J":
            List<dynamic>.from(train1Xnz904J.map((x) => x.toJson())),
        "TRAIN-1-RUQJBOB":
            List<dynamic>.from(train1Ruqjbob.map((x) => x.toJson())),
        "TRAIN-1-H4HJ6LQ":
            List<dynamic>.from(train1H4Hj6Lq.map((x) => x.toJson())),
        "TRAIN-1-13FTY6Z":
            List<dynamic>.from(train113Fty6Z.map((x) => x.toJson())),
        "TRAIN-1-5P3W7FM":
            List<dynamic>.from(train15P3W7Fm.map((x) => x.toJson())),
        "TRAIN-1-XR2IRDH":
            List<dynamic>.from(train1Xr2Irdh.map((x) => x.toJson())),
        "TRAIN-1-A6ENT5F":
            List<dynamic>.from(train1A6Ent5F.map((x) => x.toJson())),
        "TRAIN-1-OE5LUWB":
            List<dynamic>.from(train1Oe5Luwb.map((x) => x.toJson())),
        "TRAIN-1-NTTJV94":
            List<dynamic>.from(train1Nttjv94.map((x) => x.toJson())),
        "TRAIN-1-BVURA03":
            List<dynamic>.from(train1Bvura03.map((x) => x.toJson())),
        "TRAIN-1-XUDV4JS":
            List<dynamic>.from(train1Xudv4Js.map((x) => x.toJson())),
        "TRAIN-1-AMU73ML":
            List<dynamic>.from(train1Amu73Ml.map((x) => x.toJson())),
        "TRAIN-1-1G9XZGV":
            List<dynamic>.from(train11G9Xzgv.map((x) => x.toJson())),
        "TRAIN-1-I25P7EN":
            List<dynamic>.from(train1I25P7En.map((x) => x.toJson())),
        "TRAIN-1-PD2BR6I":
            List<dynamic>.from(train1Pd2Br6I.map((x) => x.toJson())),
        "TRAIN-2-0MXDHZR":
            List<dynamic>.from(train20Mxdhzr.map((x) => x.toJson())),
        "TRAIN-3-XYX01KZ":
            List<dynamic>.from(train3Xyx01Kz.map((x) => x.toJson())),
        "TRAIN-1-TT3LSJM":
            List<dynamic>.from(train1Tt3Lsjm.map((x) => x.toJson())),
        "TRAIN-1-O0V1JQC":
            List<dynamic>.from(train1O0V1Jqc.map((x) => x.toJson())),
        "TRAIN-1-SE4C0NZ":
            List<dynamic>.from(train1Se4C0Nz.map((x) => x.toJson())),
        "TRAIN-1-KJVWY3B":
            List<dynamic>.from(train1Kjvwy3B.map((x) => x.toJson())),
        "TRAIN-1-WGYN2GV":
            List<dynamic>.from(train1Wgyn2Gv.map((x) => x.toJson())),
        "TRAIN-1-4EJ4HUM":
            List<dynamic>.from(train14Ej4Hum.map((x) => x.toJson())),
        "TRAIN-1-X0UDBQL":
            List<dynamic>.from(train1X0Udbql.map((x) => x.toJson())),
      };
}

class Train113Fty6Z {
  String pass160Jjemn;

  Train113Fty6Z({
    required this.pass160Jjemn,
  });

  factory Train113Fty6Z.fromJson(Map<String, dynamic> json) => Train113Fty6Z(
        pass160Jjemn: json["PASS-1-60JJEMN"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-60JJEMN": pass160Jjemn,
      };
}

class Train1164Jy {
  String pass1U8M3Mrs;

  Train1164Jy({
    required this.pass1U8M3Mrs,
  });

  factory Train1164Jy.fromJson(Map<String, dynamic> json) => Train1164Jy(
        pass1U8M3Mrs: json["PASS-1-U8M3MRS"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-U8M3MRS": pass1U8M3Mrs,
      };
}

class Train11Dou7Lh {
  String pass1Ie53Oq9;

  Train11Dou7Lh({
    required this.pass1Ie53Oq9,
  });

  factory Train11Dou7Lh.fromJson(Map<String, dynamic> json) => Train11Dou7Lh(
        pass1Ie53Oq9: json["PASS-1-IE53OQ9"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-IE53OQ9": pass1Ie53Oq9,
      };
}

class Train11G9Xzgv {
  String pass158Ly838;

  Train11G9Xzgv({
    required this.pass158Ly838,
  });

  factory Train11G9Xzgv.fromJson(Map<String, dynamic> json) => Train11G9Xzgv(
        pass158Ly838: json["PASS-1-58LY838"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-58LY838": pass158Ly838,
      };
}

class Train14Ej4Hum {
  String pass1Ycabhve;

  Train14Ej4Hum({
    required this.pass1Ycabhve,
  });

  factory Train14Ej4Hum.fromJson(Map<String, dynamic> json) => Train14Ej4Hum(
        pass1Ycabhve: json["PASS-1-YCABHVE"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-YCABHVE": pass1Ycabhve,
      };
}

class Train15P3W7Fm {
  String pass1Owyfqh2;

  Train15P3W7Fm({
    required this.pass1Owyfqh2,
  });

  factory Train15P3W7Fm.fromJson(Map<String, dynamic> json) => Train15P3W7Fm(
        pass1Owyfqh2: json["PASS-1-OWYFQH2"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-OWYFQH2": pass1Owyfqh2,
      };
}

class Train1A6Ent5F {
  String pass1Yb27Ib8;

  Train1A6Ent5F({
    required this.pass1Yb27Ib8,
  });

  factory Train1A6Ent5F.fromJson(Map<String, dynamic> json) => Train1A6Ent5F(
        pass1Yb27Ib8: json["PASS-1-YB27IB8"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-YB27IB8": pass1Yb27Ib8,
      };
}

class Train1Amu73Ml {
  String pass194Dxtz9;

  Train1Amu73Ml({
    required this.pass194Dxtz9,
  });

  factory Train1Amu73Ml.fromJson(Map<String, dynamic> json) => Train1Amu73Ml(
        pass194Dxtz9: json["PASS-1-94DXTZ9"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-94DXTZ9": pass194Dxtz9,
      };
}

class Train1Bvura03 {
  String pass1Douxxxb;

  Train1Bvura03({
    required this.pass1Douxxxb,
  });

  factory Train1Bvura03.fromJson(Map<String, dynamic> json) => Train1Bvura03(
        pass1Douxxxb: json["PASS-1-DOUXXXB"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-DOUXXXB": pass1Douxxxb,
      };
}

class Train1Chbb5Mk {
  String pass1Di5Lq2R;

  Train1Chbb5Mk({
    required this.pass1Di5Lq2R,
  });

  factory Train1Chbb5Mk.fromJson(Map<String, dynamic> json) => Train1Chbb5Mk(
        pass1Di5Lq2R: json["PASS-1-DI5LQ2R"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-DI5LQ2R": pass1Di5Lq2R,
      };
}

class Train1E4C0Sin {
  String pass1Lowk8Pq;

  Train1E4C0Sin({
    required this.pass1Lowk8Pq,
  });

  factory Train1E4C0Sin.fromJson(Map<String, dynamic> json) => Train1E4C0Sin(
        pass1Lowk8Pq: json["PASS-1-LOWK8PQ"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-LOWK8PQ": pass1Lowk8Pq,
      };
}

class Train1Guo387O {
  String pass1W69Baqw;

  Train1Guo387O({
    required this.pass1W69Baqw,
  });

  factory Train1Guo387O.fromJson(Map<String, dynamic> json) => Train1Guo387O(
        pass1W69Baqw: json["PASS-1-W69BAQW"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-W69BAQW": pass1W69Baqw,
      };
}

class Train1H4Hj6Lq {
  String pass1V1Kkqfm;

  Train1H4Hj6Lq({
    required this.pass1V1Kkqfm,
  });

  factory Train1H4Hj6Lq.fromJson(Map<String, dynamic> json) => Train1H4Hj6Lq(
        pass1V1Kkqfm: json["PASS-1-V1KKQFM"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-V1KKQFM": pass1V1Kkqfm,
      };
}

class Train1I25P7En {
  String? pass160Mpupp;
  String? pass2Ih3Evvn;

  Train1I25P7En({
    this.pass160Mpupp,
    this.pass2Ih3Evvn,
  });

  factory Train1I25P7En.fromJson(Map<String, dynamic> json) => Train1I25P7En(
        pass160Mpupp: json["PASS-1-60MPUPP"],
        pass2Ih3Evvn: json["PASS-2-IH3EVVN"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-60MPUPP": pass160Mpupp,
        "PASS-2-IH3EVVN": pass2Ih3Evvn,
      };
}

class Train1Kicdsq9 {
  String pass1Ocr1Eah;

  Train1Kicdsq9({
    required this.pass1Ocr1Eah,
  });

  factory Train1Kicdsq9.fromJson(Map<String, dynamic> json) => Train1Kicdsq9(
        pass1Ocr1Eah: json["PASS-1-OCR1EAH"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-OCR1EAH": pass1Ocr1Eah,
      };
}

class Train1Kjvwy3B {
  String pass1Op6Y5Ro;

  Train1Kjvwy3B({
    required this.pass1Op6Y5Ro,
  });

  factory Train1Kjvwy3B.fromJson(Map<String, dynamic> json) => Train1Kjvwy3B(
        pass1Op6Y5Ro: json["PASS-1-OP6Y5RO"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-OP6Y5RO": pass1Op6Y5Ro,
      };
}

class Train1Lx58Zqj {
  String pass1Rc0Gs0X;

  Train1Lx58Zqj({
    required this.pass1Rc0Gs0X,
  });

  factory Train1Lx58Zqj.fromJson(Map<String, dynamic> json) => Train1Lx58Zqj(
        pass1Rc0Gs0X: json["PASS-1-RC0GS0X"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-RC0GS0X": pass1Rc0Gs0X,
      };
}

class Train1Mgmf51C {
  String pass1P7Bj9Lh;

  Train1Mgmf51C({
    required this.pass1P7Bj9Lh,
  });

  factory Train1Mgmf51C.fromJson(Map<String, dynamic> json) => Train1Mgmf51C(
        pass1P7Bj9Lh: json["PASS-1-P7BJ9LH"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-P7BJ9LH": pass1P7Bj9Lh,
      };
}

class Train1Nttjv94 {
  String pass16Qvists;

  Train1Nttjv94({
    required this.pass16Qvists,
  });

  factory Train1Nttjv94.fromJson(Map<String, dynamic> json) => Train1Nttjv94(
        pass16Qvists: json["PASS-1-6QVISTS"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-6QVISTS": pass16Qvists,
      };
}

class Train1O0V1Jqc {
  String? pass1Utv4Oyn;
  String? pass2Xgbys8X;

  Train1O0V1Jqc({
    this.pass1Utv4Oyn,
    this.pass2Xgbys8X,
  });

  factory Train1O0V1Jqc.fromJson(Map<String, dynamic> json) => Train1O0V1Jqc(
        pass1Utv4Oyn: json["PASS-1-UTV4OYN"],
        pass2Xgbys8X: json["PASS-2-XGBYS8X"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-UTV4OYN": pass1Utv4Oyn,
        "PASS-2-XGBYS8X": pass2Xgbys8X,
      };
}

class Train1Oe5Luwb {
  String pass126Az6Pe;

  Train1Oe5Luwb({
    required this.pass126Az6Pe,
  });

  factory Train1Oe5Luwb.fromJson(Map<String, dynamic> json) => Train1Oe5Luwb(
        pass126Az6Pe: json["PASS-1-26AZ6PE"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-26AZ6PE": pass126Az6Pe,
      };
}

class Train1Oki7Pv {
  String pass17Km2Vz3;

  Train1Oki7Pv({
    required this.pass17Km2Vz3,
  });

  factory Train1Oki7Pv.fromJson(Map<String, dynamic> json) => Train1Oki7Pv(
        pass17Km2Vz3: json["PASS-1-7KM2VZ3"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-7KM2VZ3": pass17Km2Vz3,
      };
}

class Train1P1328 {
  String pass1T1P1328;

  Train1P1328({
    required this.pass1T1P1328,
  });

  factory Train1P1328.fromJson(Map<String, dynamic> json) => Train1P1328(
        pass1T1P1328: json["PASS-1-T1P1-328"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-T1P1-328": pass1T1P1328,
      };
}

class Train1P2328 {
  String pass1T1P2328;

  Train1P2328({
    required this.pass1T1P2328,
  });

  factory Train1P2328.fromJson(Map<String, dynamic> json) => Train1P2328(
        pass1T1P2328: json["PASS-1-T1P2-328"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-T1P2-328": pass1T1P2328,
      };
}

class Train1Pd2Br6I {
  String pass1Znxh1Ba;

  Train1Pd2Br6I({
    required this.pass1Znxh1Ba,
  });

  factory Train1Pd2Br6I.fromJson(Map<String, dynamic> json) => Train1Pd2Br6I(
        pass1Znxh1Ba: json["PASS-1-ZNXH1BA"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-ZNXH1BA": pass1Znxh1Ba,
      };
}

class Train1Qup3G0K {
  String pass1Qx0Thpp;

  Train1Qup3G0K({
    required this.pass1Qx0Thpp,
  });

  factory Train1Qup3G0K.fromJson(Map<String, dynamic> json) => Train1Qup3G0K(
        pass1Qx0Thpp: json["PASS-1-QX0THPP"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-QX0THPP": pass1Qx0Thpp,
      };
}

class Train1Ruqjbob {
  String pass1Nvbtvc0;

  Train1Ruqjbob({
    required this.pass1Nvbtvc0,
  });

  factory Train1Ruqjbob.fromJson(Map<String, dynamic> json) => Train1Ruqjbob(
        pass1Nvbtvc0: json["PASS-1-NVBTVC0"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-NVBTVC0": pass1Nvbtvc0,
      };
}

class Train1Se4C0Nz {
  String pass13X64Dt0;

  Train1Se4C0Nz({
    required this.pass13X64Dt0,
  });

  factory Train1Se4C0Nz.fromJson(Map<String, dynamic> json) => Train1Se4C0Nz(
        pass13X64Dt0: json["PASS-1-3X64DT0"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-3X64DT0": pass13X64Dt0,
      };
}

class Train1Tq7N7Ky {
  String pass12Hvlhor;

  Train1Tq7N7Ky({
    required this.pass12Hvlhor,
  });

  factory Train1Tq7N7Ky.fromJson(Map<String, dynamic> json) => Train1Tq7N7Ky(
        pass12Hvlhor: json["PASS-1-2HVLHOR"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-2HVLHOR": pass12Hvlhor,
      };
}

class Train1Tt3Lsjm {
  String pass1Eilcvom;

  Train1Tt3Lsjm({
    required this.pass1Eilcvom,
  });

  factory Train1Tt3Lsjm.fromJson(Map<String, dynamic> json) => Train1Tt3Lsjm(
        pass1Eilcvom: json["PASS-1-EILCVOM"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-EILCVOM": pass1Eilcvom,
      };
}

class Train1Wgyn2Gv {
  String pass1Ygyn4Wc;

  Train1Wgyn2Gv({
    required this.pass1Ygyn4Wc,
  });

  factory Train1Wgyn2Gv.fromJson(Map<String, dynamic> json) => Train1Wgyn2Gv(
        pass1Ygyn4Wc: json["PASS-1-YGYN4WC"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-YGYN4WC": pass1Ygyn4Wc,
      };
}

class Train1X0Udbql {
  String pass1Urgnhib;

  Train1X0Udbql({
    required this.pass1Urgnhib,
  });

  factory Train1X0Udbql.fromJson(Map<String, dynamic> json) => Train1X0Udbql(
        pass1Urgnhib: json["PASS-1-URGNHIB"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-URGNHIB": pass1Urgnhib,
      };
}

class Train1Xnz904J {
  String pass1Twxctfc;

  Train1Xnz904J({
    required this.pass1Twxctfc,
  });

  factory Train1Xnz904J.fromJson(Map<String, dynamic> json) => Train1Xnz904J(
        pass1Twxctfc: json["PASS-1-TWXCTFC"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-TWXCTFC": pass1Twxctfc,
      };
}

class Train1Xr2Irdh {
  String pass1A7Eomch;

  Train1Xr2Irdh({
    required this.pass1A7Eomch,
  });

  factory Train1Xr2Irdh.fromJson(Map<String, dynamic> json) => Train1Xr2Irdh(
        pass1A7Eomch: json["PASS-1-A7EOMCH"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-A7EOMCH": pass1A7Eomch,
      };
}

class Train1Xudv4J {
  String pass1Dd7Bz59;

  Train1Xudv4J({
    required this.pass1Dd7Bz59,
  });

  factory Train1Xudv4J.fromJson(Map<String, dynamic> json) => Train1Xudv4J(
        pass1Dd7Bz59: json["PASS-1-DD7BZ59"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-DD7BZ59": pass1Dd7Bz59,
      };
}

class Train20Mxdhzr {
  String? pass1Queeya2;
  String? pass2Xgo9Gmz;

  Train20Mxdhzr({
    this.pass1Queeya2,
    this.pass2Xgo9Gmz,
  });

  factory Train20Mxdhzr.fromJson(Map<String, dynamic> json) => Train20Mxdhzr(
        pass1Queeya2: json["PASS-1-QUEEYA2"],
        pass2Xgo9Gmz: json["PASS-2-XGO9GMZ"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-QUEEYA2": pass1Queeya2,
        "PASS-2-XGO9GMZ": pass2Xgo9Gmz,
      };
}

class Train2M5T3Ckb {
  String pass1Xooftbb;

  Train2M5T3Ckb({
    required this.pass1Xooftbb,
  });

  factory Train2M5T3Ckb.fromJson(Map<String, dynamic> json) => Train2M5T3Ckb(
        pass1Xooftbb: json["PASS-1-XOOFTBB"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-XOOFTBB": pass1Xooftbb,
      };
}

class Train2P1328 {
  String? pass1T2P1328;
  String? pass2T2P1328;

  Train2P1328({
    this.pass1T2P1328,
    this.pass2T2P1328,
  });

  factory Train2P1328.fromJson(Map<String, dynamic> json) => Train2P1328(
        pass1T2P1328: json["PASS-1-T2P1-328"],
        pass2T2P1328: json["PASS-2-T2P1-328"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-T2P1-328": pass1T2P1328,
        "PASS-2-T2P1-328": pass2T2P1328,
      };
}

class Train3Xyx01Kz {
  String pass17Ezaax2;

  Train3Xyx01Kz({
    required this.pass17Ezaax2,
  });

  factory Train3Xyx01Kz.fromJson(Map<String, dynamic> json) => Train3Xyx01Kz(
        pass17Ezaax2: json["PASS-1-7EZAAX2"],
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-7EZAAX2": pass17Ezaax2,
      };
}

class Plant {
  String? plant1328;
  String? plant2328;
  String? plant3225M07U;
  String? plant41Ivjeu8;
  String? plant522794Qz;
  String? plant6A830Fjz;
  String? plant79Oinat7;
  String? plant8Zg13B9Y;
  String? plant9Wy5Br96;
  String? plant10G0Mrlkp;
  String? plant117C2T2Qd;
  String? plant129K9Gzo7;
  String? plant130Pzobyd;
  String? plant1482Vafe2;
  String? plant15E1Oq6C7;
  String? plant16Yuferv4;
  String? plant1742Pj17W;
  String? plant18Lp0Kdya;
  String? plant191Kd2Yxx;
  String? plant20Sejlw0O;
  String? plant2104Rw62M;
  String? plant22Jgvxawf;
  String? plant23Wg7Fi5R;
  String? plant24V12Xteg;
  String? plant25Wqo6Hqh;
  String? plant263Kymw4D;
  String? plant27X5Mgmkm;
  String? plant28Oxgkc1N;
  String? plant29J6X50T3;
  String? plant30Tk1L669;
  String? plant31Vlzdnqu;
  String? plant32Dfa1Mgz;
  String? plant330G4R85E;
  String? plant34O7Nkryk;
  String? plant35Zg69Y2H;
  String? plant36Rmf1B91;
  String? plant379Xt0Zg0;
  String? plant38Oogeev1;
  String? plant3949Alq33;
  String? plant40Hzfrb6A;

  Plant({
    this.plant1328,
    this.plant2328,
    this.plant3225M07U,
    this.plant41Ivjeu8,
    this.plant522794Qz,
    this.plant6A830Fjz,
    this.plant79Oinat7,
    this.plant8Zg13B9Y,
    this.plant9Wy5Br96,
    this.plant10G0Mrlkp,
    this.plant117C2T2Qd,
    this.plant129K9Gzo7,
    this.plant130Pzobyd,
    this.plant1482Vafe2,
    this.plant15E1Oq6C7,
    this.plant16Yuferv4,
    this.plant1742Pj17W,
    this.plant18Lp0Kdya,
    this.plant191Kd2Yxx,
    this.plant20Sejlw0O,
    this.plant2104Rw62M,
    this.plant22Jgvxawf,
    this.plant23Wg7Fi5R,
    this.plant24V12Xteg,
    this.plant25Wqo6Hqh,
    this.plant263Kymw4D,
    this.plant27X5Mgmkm,
    this.plant28Oxgkc1N,
    this.plant29J6X50T3,
    this.plant30Tk1L669,
    this.plant31Vlzdnqu,
    this.plant32Dfa1Mgz,
    this.plant330G4R85E,
    this.plant34O7Nkryk,
    this.plant35Zg69Y2H,
    this.plant36Rmf1B91,
    this.plant379Xt0Zg0,
    this.plant38Oogeev1,
    this.plant3949Alq33,
    this.plant40Hzfrb6A,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        plant1328: json["PLANT-1-328"],
        plant2328: json["PLANT-2-328"],
        plant3225M07U: json["PLANT-3-225M07U"],
        plant41Ivjeu8: json["PLANT-4-1IVJEU8"],
        plant522794Qz: json["PLANT-5-22794QZ"],
        plant6A830Fjz: json["PLANT-6-A830FJZ"],
        plant79Oinat7: json["PLANT-7-9OINAT7"],
        plant8Zg13B9Y: json["PLANT-8-ZG13B9Y"],
        plant9Wy5Br96: json["PLANT-9-WY5BR96"],
        plant10G0Mrlkp: json["PLANT-10-G0MRLKP"],
        plant117C2T2Qd: json["PLANT-11-7C2T2QD"],
        plant129K9Gzo7: json["PLANT-12-9K9GZO7"],
        plant130Pzobyd: json["PLANT-13-0PZOBYD"],
        plant1482Vafe2: json["PLANT-14-82VAFE2"],
        plant15E1Oq6C7: json["PLANT-15-E1OQ6C7"],
        plant16Yuferv4: json["PLANT-16-YUFERV4"],
        plant1742Pj17W: json["PLANT-17-42PJ17W"],
        plant18Lp0Kdya: json["PLANT-18-LP0KDYA"],
        plant191Kd2Yxx: json["PLANT-19-1KD2YXX"],
        plant20Sejlw0O: json["PLANT-20-SEJLW0O"],
        plant2104Rw62M: json["PLANT-21-04RW62M"],
        plant22Jgvxawf: json["PLANT-22-JGVXAWF"],
        plant23Wg7Fi5R: json["PLANT-23-WG7FI5R"],
        plant24V12Xteg: json["PLANT-24-V12XTEG"],
        plant25Wqo6Hqh: json["PLANT-25-WQO6HQH"],
        plant263Kymw4D: json["PLANT-26-3KYMW4D"],
        plant27X5Mgmkm: json["PLANT-27-X5MGMKM"],
        plant28Oxgkc1N: json["PLANT-28-OXGKC1N"],
        plant29J6X50T3: json["PLANT-29-J6X50T3"],
        plant30Tk1L669: json["PLANT-30-TK1L669"],
        plant31Vlzdnqu: json["PLANT-31-VLZDNQU"],
        plant32Dfa1Mgz: json["PLANT-32-DFA1MGZ"],
        plant330G4R85E: json["PLANT-33-0G4R85E"],
        plant34O7Nkryk: json["PLANT-34-O7NKRYK"],
        plant35Zg69Y2H: json["PLANT-35-ZG69Y2H"],
        plant36Rmf1B91: json["PLANT-36-RMF1B91"],
        plant379Xt0Zg0: json["PLANT-37-9XT0ZG0"],
        plant38Oogeev1: json["PLANT-38-OOGEEV1"],
        plant3949Alq33: json["PLANT-39-49ALQ33"],
        plant40Hzfrb6A: json["PLANT-40-HZFRB6A"],
      );

  Map<String, dynamic> toJson() => {
        "PLANT-1-328": plant1328,
        "PLANT-2-328": plant2328,
        "PLANT-3-225M07U": plant3225M07U,
        "PLANT-4-1IVJEU8": plant41Ivjeu8,
        "PLANT-5-22794QZ": plant522794Qz,
        "PLANT-6-A830FJZ": plant6A830Fjz,
        "PLANT-7-9OINAT7": plant79Oinat7,
        "PLANT-8-ZG13B9Y": plant8Zg13B9Y,
        "PLANT-9-WY5BR96": plant9Wy5Br96,
        "PLANT-10-G0MRLKP": plant10G0Mrlkp,
        "PLANT-11-7C2T2QD": plant117C2T2Qd,
        "PLANT-12-9K9GZO7": plant129K9Gzo7,
        "PLANT-13-0PZOBYD": plant130Pzobyd,
        "PLANT-14-82VAFE2": plant1482Vafe2,
        "PLANT-15-E1OQ6C7": plant15E1Oq6C7,
        "PLANT-16-YUFERV4": plant16Yuferv4,
        "PLANT-17-42PJ17W": plant1742Pj17W,
        "PLANT-18-LP0KDYA": plant18Lp0Kdya,
        "PLANT-19-1KD2YXX": plant191Kd2Yxx,
        "PLANT-20-SEJLW0O": plant20Sejlw0O,
        "PLANT-21-04RW62M": plant2104Rw62M,
        "PLANT-22-JGVXAWF": plant22Jgvxawf,
        "PLANT-23-WG7FI5R": plant23Wg7Fi5R,
        "PLANT-24-V12XTEG": plant24V12Xteg,
        "PLANT-25-WQO6HQH": plant25Wqo6Hqh,
        "PLANT-26-3KYMW4D": plant263Kymw4D,
        "PLANT-27-X5MGMKM": plant27X5Mgmkm,
        "PLANT-28-OXGKC1N": plant28Oxgkc1N,
        "PLANT-29-J6X50T3": plant29J6X50T3,
        "PLANT-30-TK1L669": plant30Tk1L669,
        "PLANT-31-VLZDNQU": plant31Vlzdnqu,
        "PLANT-32-DFA1MGZ": plant32Dfa1Mgz,
        "PLANT-33-0G4R85E": plant330G4R85E,
        "PLANT-34-O7NKRYK": plant34O7Nkryk,
        "PLANT-35-ZG69Y2H": plant35Zg69Y2H,
        "PLANT-36-RMF1B91": plant36Rmf1B91,
        "PLANT-37-9XT0ZG0": plant379Xt0Zg0,
        "PLANT-38-OOGEEV1": plant38Oogeev1,
        "PLANT-39-49ALQ33": plant3949Alq33,
        "PLANT-40-HZFRB6A": plant40Hzfrb6A,
      };
}

class Stages {
  List<Pass1T1P1328> pass1T1P1328;
  List<Pass1T2P1328> pass1T2P1328;
  List<Pass2T2P1328> pass2T2P1328;
  List<Pass1T1P2328> pass1T1P2328;
  List<Pass1Lowk8Pq> pass1Lowk8Pq;
  List<Pass1Rc0Gs0X> pass1Rc0Gs0X;
  List<Pass1U8M3Mr> pass1U8M3Mrs;
  List<Pass1Xooftbb> pass1Xooftbb;
  List<Pass12Hvlhor> pass12Hvlhor;
  List<Pass17Km2Vz3> pass17Km2Vz3;
  List<Pass1W69Baqw> pass1W69Baqw;
  List<Pass1Qx0Thpp> pass1Qx0Thpp;
  List<Pass1Ie53Oq9> pass1Ie53Oq9;
  List<Pass1Ocr1Eah> pass1Ocr1Eah;
  List<Pass1P7Bj9Lh> pass1P7Bj9Lh;
  List<Pass1Di5Lq2R> pass1Di5Lq2R;
  List<Pass1Twxctfc> pass1Twxctfc;
  List<Pass1Nvbtvc0> pass1Nvbtvc0;
  List<Pass1V1Kkqfm> pass1V1Kkqfm;
  List<Pass160Jjemn> pass160Jjemn;
  List<Pass1Owyfqh2> pass1Owyfqh2;
  List<Pass1A7Eomch> pass1A7Eomch;
  List<Pass1Yb27Ib8> pass1Yb27Ib8;
  List<dynamic> pass126Az6Pe;
  List<Pass16Qvist> pass16Qvists;
  List<Pass1Douxxxb> pass1Douxxxb;
  List<dynamic> pass1Dd7Bz59;
  List<Pass194Dxtz9> pass194Dxtz9;
  List<Pass158Ly838> pass158Ly838;
  List<Pass160Mpupp> pass160Mpupp;
  List<Pass2Ih3Evvn> pass2Ih3Evvn;
  List<Pass1Znxh1Ba> pass1Znxh1Ba;
  List<Pass1Queeya2> pass1Queeya2;
  List<Pass2Xgo9Gmz> pass2Xgo9Gmz;
  List<Pass17Ezaax2> pass17Ezaax2;
  List<Pass1Eilcvom> pass1Eilcvom;
  List<Pass1Utv4Oyn> pass1Utv4Oyn;
  List<Pass2Xgbys8X> pass2Xgbys8X;
  List<Pass13X64Dt0> pass13X64Dt0;
  List<Pass1Op6Y5Ro> pass1Op6Y5Ro;
  List<Pass1Ygyn4Wc> pass1Ygyn4Wc;
  List<Pass1Ycabhve> pass1Ycabhve;
  List<Pass1Urgnhib> pass1Urgnhib;

  Stages({
    required this.pass1T1P1328,
    required this.pass1T2P1328,
    required this.pass2T2P1328,
    required this.pass1T1P2328,
    required this.pass1Lowk8Pq,
    required this.pass1Rc0Gs0X,
    required this.pass1U8M3Mrs,
    required this.pass1Xooftbb,
    required this.pass12Hvlhor,
    required this.pass17Km2Vz3,
    required this.pass1W69Baqw,
    required this.pass1Qx0Thpp,
    required this.pass1Ie53Oq9,
    required this.pass1Ocr1Eah,
    required this.pass1P7Bj9Lh,
    required this.pass1Di5Lq2R,
    required this.pass1Twxctfc,
    required this.pass1Nvbtvc0,
    required this.pass1V1Kkqfm,
    required this.pass160Jjemn,
    required this.pass1Owyfqh2,
    required this.pass1A7Eomch,
    required this.pass1Yb27Ib8,
    required this.pass126Az6Pe,
    required this.pass16Qvists,
    required this.pass1Douxxxb,
    required this.pass1Dd7Bz59,
    required this.pass194Dxtz9,
    required this.pass158Ly838,
    required this.pass160Mpupp,
    required this.pass2Ih3Evvn,
    required this.pass1Znxh1Ba,
    required this.pass1Queeya2,
    required this.pass2Xgo9Gmz,
    required this.pass17Ezaax2,
    required this.pass1Eilcvom,
    required this.pass1Utv4Oyn,
    required this.pass2Xgbys8X,
    required this.pass13X64Dt0,
    required this.pass1Op6Y5Ro,
    required this.pass1Ygyn4Wc,
    required this.pass1Ycabhve,
    required this.pass1Urgnhib,
  });

  factory Stages.fromJson(Map<String, dynamic> json) => Stages(
        pass1T1P1328: List<Pass1T1P1328>.from(
            json["PASS-1-T1P1-328"].map((x) => Pass1T1P1328.fromJson(x))),
        pass1T2P1328: List<Pass1T2P1328>.from(
            json["PASS-1-T2P1-328"].map((x) => Pass1T2P1328.fromJson(x))),
        pass2T2P1328: List<Pass2T2P1328>.from(
            json["PASS-2-T2P1-328"].map((x) => Pass2T2P1328.fromJson(x))),
        pass1T1P2328: List<Pass1T1P2328>.from(
            json["PASS-1-T1P2-328"].map((x) => Pass1T1P2328.fromJson(x))),
        pass1Lowk8Pq: List<Pass1Lowk8Pq>.from(
            json["PASS-1-LOWK8PQ"].map((x) => Pass1Lowk8Pq.fromJson(x))),
        pass1Rc0Gs0X: List<Pass1Rc0Gs0X>.from(
            json["PASS-1-RC0GS0X"].map((x) => Pass1Rc0Gs0X.fromJson(x))),
        pass1U8M3Mrs: List<Pass1U8M3Mr>.from(
            json["PASS-1-U8M3MRS"].map((x) => Pass1U8M3Mr.fromJson(x))),
        pass1Xooftbb: List<Pass1Xooftbb>.from(
            json["PASS-1-XOOFTBB"].map((x) => Pass1Xooftbb.fromJson(x))),
        pass12Hvlhor: List<Pass12Hvlhor>.from(
            json["PASS-1-2HVLHOR"].map((x) => Pass12Hvlhor.fromJson(x))),
        pass17Km2Vz3: List<Pass17Km2Vz3>.from(
            json["PASS-1-7KM2VZ3"].map((x) => Pass17Km2Vz3.fromJson(x))),
        pass1W69Baqw: List<Pass1W69Baqw>.from(
            json["PASS-1-W69BAQW"].map((x) => Pass1W69Baqw.fromJson(x))),
        pass1Qx0Thpp: List<Pass1Qx0Thpp>.from(
            json["PASS-1-QX0THPP"].map((x) => Pass1Qx0Thpp.fromJson(x))),
        pass1Ie53Oq9: List<Pass1Ie53Oq9>.from(
            json["PASS-1-IE53OQ9"].map((x) => Pass1Ie53Oq9.fromJson(x))),
        pass1Ocr1Eah: List<Pass1Ocr1Eah>.from(
            json["PASS-1-OCR1EAH"].map((x) => Pass1Ocr1Eah.fromJson(x))),
        pass1P7Bj9Lh: List<Pass1P7Bj9Lh>.from(
            json["PASS-1-P7BJ9LH"].map((x) => Pass1P7Bj9Lh.fromJson(x))),
        pass1Di5Lq2R: List<Pass1Di5Lq2R>.from(
            json["PASS-1-DI5LQ2R"].map((x) => Pass1Di5Lq2R.fromJson(x))),
        pass1Twxctfc: List<Pass1Twxctfc>.from(
            json["PASS-1-TWXCTFC"].map((x) => Pass1Twxctfc.fromJson(x))),
        pass1Nvbtvc0: List<Pass1Nvbtvc0>.from(
            json["PASS-1-NVBTVC0"].map((x) => Pass1Nvbtvc0.fromJson(x))),
        pass1V1Kkqfm: List<Pass1V1Kkqfm>.from(
            json["PASS-1-V1KKQFM"].map((x) => Pass1V1Kkqfm.fromJson(x))),
        pass160Jjemn: List<Pass160Jjemn>.from(
            json["PASS-1-60JJEMN"].map((x) => Pass160Jjemn.fromJson(x))),
        pass1Owyfqh2: List<Pass1Owyfqh2>.from(
            json["PASS-1-OWYFQH2"].map((x) => Pass1Owyfqh2.fromJson(x))),
        pass1A7Eomch: List<Pass1A7Eomch>.from(
            json["PASS-1-A7EOMCH"].map((x) => Pass1A7Eomch.fromJson(x))),
        pass1Yb27Ib8: List<Pass1Yb27Ib8>.from(
            json["PASS-1-YB27IB8"].map((x) => Pass1Yb27Ib8.fromJson(x))),
        pass126Az6Pe: List<dynamic>.from(json["PASS-1-26AZ6PE"].map((x) => x)),
        pass16Qvists: List<Pass16Qvist>.from(
            json["PASS-1-6QVISTS"].map((x) => Pass16Qvist.fromJson(x))),
        pass1Douxxxb: List<Pass1Douxxxb>.from(
            json["PASS-1-DOUXXXB"].map((x) => Pass1Douxxxb.fromJson(x))),
        pass1Dd7Bz59: List<dynamic>.from(json["PASS-1-DD7BZ59"].map((x) => x)),
        pass194Dxtz9: List<Pass194Dxtz9>.from(
            json["PASS-1-94DXTZ9"].map((x) => Pass194Dxtz9.fromJson(x))),
        pass158Ly838: List<Pass158Ly838>.from(
            json["PASS-1-58LY838"].map((x) => Pass158Ly838.fromJson(x))),
        pass160Mpupp: List<Pass160Mpupp>.from(
            json["PASS-1-60MPUPP"].map((x) => Pass160Mpupp.fromJson(x))),
        pass2Ih3Evvn: List<Pass2Ih3Evvn>.from(
            json["PASS-2-IH3EVVN"].map((x) => Pass2Ih3Evvn.fromJson(x))),
        pass1Znxh1Ba: List<Pass1Znxh1Ba>.from(
            json["PASS-1-ZNXH1BA"].map((x) => Pass1Znxh1Ba.fromJson(x))),
        pass1Queeya2: List<Pass1Queeya2>.from(
            json["PASS-1-QUEEYA2"].map((x) => Pass1Queeya2.fromJson(x))),
        pass2Xgo9Gmz: List<Pass2Xgo9Gmz>.from(
            json["PASS-2-XGO9GMZ"].map((x) => Pass2Xgo9Gmz.fromJson(x))),
        pass17Ezaax2: List<Pass17Ezaax2>.from(
            json["PASS-1-7EZAAX2"].map((x) => Pass17Ezaax2.fromJson(x))),
        pass1Eilcvom: List<Pass1Eilcvom>.from(
            json["PASS-1-EILCVOM"].map((x) => Pass1Eilcvom.fromJson(x))),
        pass1Utv4Oyn: List<Pass1Utv4Oyn>.from(
            json["PASS-1-UTV4OYN"].map((x) => Pass1Utv4Oyn.fromJson(x))),
        pass2Xgbys8X: List<Pass2Xgbys8X>.from(
            json["PASS-2-XGBYS8X"].map((x) => Pass2Xgbys8X.fromJson(x))),
        pass13X64Dt0: List<Pass13X64Dt0>.from(
            json["PASS-1-3X64DT0"].map((x) => Pass13X64Dt0.fromJson(x))),
        pass1Op6Y5Ro: List<Pass1Op6Y5Ro>.from(
            json["PASS-1-OP6Y5RO"].map((x) => Pass1Op6Y5Ro.fromJson(x))),
        pass1Ygyn4Wc: List<Pass1Ygyn4Wc>.from(
            json["PASS-1-YGYN4WC"].map((x) => Pass1Ygyn4Wc.fromJson(x))),
        pass1Ycabhve: List<Pass1Ycabhve>.from(
            json["PASS-1-YCABHVE"].map((x) => Pass1Ycabhve.fromJson(x))),
        pass1Urgnhib: List<Pass1Urgnhib>.from(
            json["PASS-1-URGNHIB"].map((x) => Pass1Urgnhib.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PASS-1-T1P1-328":
            List<dynamic>.from(pass1T1P1328.map((x) => x.toJson())),
        "PASS-1-T2P1-328":
            List<dynamic>.from(pass1T2P1328.map((x) => x.toJson())),
        "PASS-2-T2P1-328":
            List<dynamic>.from(pass2T2P1328.map((x) => x.toJson())),
        "PASS-1-T1P2-328":
            List<dynamic>.from(pass1T1P2328.map((x) => x.toJson())),
        "PASS-1-LOWK8PQ":
            List<dynamic>.from(pass1Lowk8Pq.map((x) => x.toJson())),
        "PASS-1-RC0GS0X":
            List<dynamic>.from(pass1Rc0Gs0X.map((x) => x.toJson())),
        "PASS-1-U8M3MRS":
            List<dynamic>.from(pass1U8M3Mrs.map((x) => x.toJson())),
        "PASS-1-XOOFTBB":
            List<dynamic>.from(pass1Xooftbb.map((x) => x.toJson())),
        "PASS-1-2HVLHOR":
            List<dynamic>.from(pass12Hvlhor.map((x) => x.toJson())),
        "PASS-1-7KM2VZ3":
            List<dynamic>.from(pass17Km2Vz3.map((x) => x.toJson())),
        "PASS-1-W69BAQW":
            List<dynamic>.from(pass1W69Baqw.map((x) => x.toJson())),
        "PASS-1-QX0THPP":
            List<dynamic>.from(pass1Qx0Thpp.map((x) => x.toJson())),
        "PASS-1-IE53OQ9":
            List<dynamic>.from(pass1Ie53Oq9.map((x) => x.toJson())),
        "PASS-1-OCR1EAH":
            List<dynamic>.from(pass1Ocr1Eah.map((x) => x.toJson())),
        "PASS-1-P7BJ9LH":
            List<dynamic>.from(pass1P7Bj9Lh.map((x) => x.toJson())),
        "PASS-1-DI5LQ2R":
            List<dynamic>.from(pass1Di5Lq2R.map((x) => x.toJson())),
        "PASS-1-TWXCTFC":
            List<dynamic>.from(pass1Twxctfc.map((x) => x.toJson())),
        "PASS-1-NVBTVC0":
            List<dynamic>.from(pass1Nvbtvc0.map((x) => x.toJson())),
        "PASS-1-V1KKQFM":
            List<dynamic>.from(pass1V1Kkqfm.map((x) => x.toJson())),
        "PASS-1-60JJEMN":
            List<dynamic>.from(pass160Jjemn.map((x) => x.toJson())),
        "PASS-1-OWYFQH2":
            List<dynamic>.from(pass1Owyfqh2.map((x) => x.toJson())),
        "PASS-1-A7EOMCH":
            List<dynamic>.from(pass1A7Eomch.map((x) => x.toJson())),
        "PASS-1-YB27IB8":
            List<dynamic>.from(pass1Yb27Ib8.map((x) => x.toJson())),
        "PASS-1-26AZ6PE": List<dynamic>.from(pass126Az6Pe.map((x) => x)),
        "PASS-1-6QVISTS":
            List<dynamic>.from(pass16Qvists.map((x) => x.toJson())),
        "PASS-1-DOUXXXB":
            List<dynamic>.from(pass1Douxxxb.map((x) => x.toJson())),
        "PASS-1-DD7BZ59": List<dynamic>.from(pass1Dd7Bz59.map((x) => x)),
        "PASS-1-94DXTZ9":
            List<dynamic>.from(pass194Dxtz9.map((x) => x.toJson())),
        "PASS-1-58LY838":
            List<dynamic>.from(pass158Ly838.map((x) => x.toJson())),
        "PASS-1-60MPUPP":
            List<dynamic>.from(pass160Mpupp.map((x) => x.toJson())),
        "PASS-2-IH3EVVN":
            List<dynamic>.from(pass2Ih3Evvn.map((x) => x.toJson())),
        "PASS-1-ZNXH1BA":
            List<dynamic>.from(pass1Znxh1Ba.map((x) => x.toJson())),
        "PASS-1-QUEEYA2":
            List<dynamic>.from(pass1Queeya2.map((x) => x.toJson())),
        "PASS-2-XGO9GMZ":
            List<dynamic>.from(pass2Xgo9Gmz.map((x) => x.toJson())),
        "PASS-1-7EZAAX2":
            List<dynamic>.from(pass17Ezaax2.map((x) => x.toJson())),
        "PASS-1-EILCVOM":
            List<dynamic>.from(pass1Eilcvom.map((x) => x.toJson())),
        "PASS-1-UTV4OYN":
            List<dynamic>.from(pass1Utv4Oyn.map((x) => x.toJson())),
        "PASS-2-XGBYS8X":
            List<dynamic>.from(pass2Xgbys8X.map((x) => x.toJson())),
        "PASS-1-3X64DT0":
            List<dynamic>.from(pass13X64Dt0.map((x) => x.toJson())),
        "PASS-1-OP6Y5RO":
            List<dynamic>.from(pass1Op6Y5Ro.map((x) => x.toJson())),
        "PASS-1-YGYN4WC":
            List<dynamic>.from(pass1Ygyn4Wc.map((x) => x.toJson())),
        "PASS-1-YCABHVE":
            List<dynamic>.from(pass1Ycabhve.map((x) => x.toJson())),
        "PASS-1-URGNHIB":
            List<dynamic>.from(pass1Urgnhib.map((x) => x.toJson())),
      };
}

class Pass12Hvlhor {
  String stage18Uyeqi1;

  Pass12Hvlhor({
    required this.stage18Uyeqi1,
  });

  factory Pass12Hvlhor.fromJson(Map<String, dynamic> json) => Pass12Hvlhor(
        stage18Uyeqi1: json["STAGE-1-8UYEQI1"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-8UYEQI1": stage18Uyeqi1,
      };
}

class Pass13X64Dt0 {
  String stage16Uxylc2;

  Pass13X64Dt0({
    required this.stage16Uxylc2,
  });

  factory Pass13X64Dt0.fromJson(Map<String, dynamic> json) => Pass13X64Dt0(
        stage16Uxylc2: json["STAGE-1-6UXYLC2"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-6UXYLC2": stage16Uxylc2,
      };
}

class Pass158Ly838 {
  String stage1Uogei6Y;

  Pass158Ly838({
    required this.stage1Uogei6Y,
  });

  factory Pass158Ly838.fromJson(Map<String, dynamic> json) => Pass158Ly838(
        stage1Uogei6Y: json["STAGE-1-UOGEI6Y"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-UOGEI6Y": stage1Uogei6Y,
      };
}

class Pass160Jjemn {
  String stage1Jmk09Db;

  Pass160Jjemn({
    required this.stage1Jmk09Db,
  });

  factory Pass160Jjemn.fromJson(Map<String, dynamic> json) => Pass160Jjemn(
        stage1Jmk09Db: json["STAGE-1-JMK09DB"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-JMK09DB": stage1Jmk09Db,
      };
}

class Pass160Mpupp {
  String stage1Imb1Qir;

  Pass160Mpupp({
    required this.stage1Imb1Qir,
  });

  factory Pass160Mpupp.fromJson(Map<String, dynamic> json) => Pass160Mpupp(
        stage1Imb1Qir: json["STAGE-1-IMB1QIR"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-IMB1QIR": stage1Imb1Qir,
      };
}

class Pass16Qvist {
  String stage1R7Cx665;

  Pass16Qvist({
    required this.stage1R7Cx665,
  });

  factory Pass16Qvist.fromJson(Map<String, dynamic> json) => Pass16Qvist(
        stage1R7Cx665: json["STAGE-1-R7CX665"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-R7CX665": stage1R7Cx665,
      };
}

class Pass17Ezaax2 {
  String stage1Mmzhr8G;

  Pass17Ezaax2({
    required this.stage1Mmzhr8G,
  });

  factory Pass17Ezaax2.fromJson(Map<String, dynamic> json) => Pass17Ezaax2(
        stage1Mmzhr8G: json["STAGE-1-MMZHR8G"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-MMZHR8G": stage1Mmzhr8G,
      };
}

class Pass17Km2Vz3 {
  String stage1U9Qcd6V;

  Pass17Km2Vz3({
    required this.stage1U9Qcd6V,
  });

  factory Pass17Km2Vz3.fromJson(Map<String, dynamic> json) => Pass17Km2Vz3(
        stage1U9Qcd6V: json["STAGE-1-U9QCD6V"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-U9QCD6V": stage1U9Qcd6V,
      };
}

class Pass194Dxtz9 {
  String stage1J5Jakhr;

  Pass194Dxtz9({
    required this.stage1J5Jakhr,
  });

  factory Pass194Dxtz9.fromJson(Map<String, dynamic> json) => Pass194Dxtz9(
        stage1J5Jakhr: json["STAGE-1-J5JAKHR"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-J5JAKHR": stage1J5Jakhr,
      };
}

class Pass1A7Eomch {
  String stage1Bnh1Yyo;

  Pass1A7Eomch({
    required this.stage1Bnh1Yyo,
  });

  factory Pass1A7Eomch.fromJson(Map<String, dynamic> json) => Pass1A7Eomch(
        stage1Bnh1Yyo: json["STAGE-1-BNH1YYO"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-BNH1YYO": stage1Bnh1Yyo,
      };
}

class Pass1Di5Lq2R {
  String stage11Jevovy;

  Pass1Di5Lq2R({
    required this.stage11Jevovy,
  });

  factory Pass1Di5Lq2R.fromJson(Map<String, dynamic> json) => Pass1Di5Lq2R(
        stage11Jevovy: json["STAGE-1-1JEVOVY"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-1JEVOVY": stage11Jevovy,
      };
}

class Pass1Douxxxb {
  String stage1Rpp1Ttq;

  Pass1Douxxxb({
    required this.stage1Rpp1Ttq,
  });

  factory Pass1Douxxxb.fromJson(Map<String, dynamic> json) => Pass1Douxxxb(
        stage1Rpp1Ttq: json["STAGE-1-RPP1TTQ"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-RPP1TTQ": stage1Rpp1Ttq,
      };
}

class Pass1Eilcvom {
  String stage1Hqe32T7;

  Pass1Eilcvom({
    required this.stage1Hqe32T7,
  });

  factory Pass1Eilcvom.fromJson(Map<String, dynamic> json) => Pass1Eilcvom(
        stage1Hqe32T7: json["STAGE-1-HQE32T7"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-HQE32T7": stage1Hqe32T7,
      };
}

class Pass1Ie53Oq9 {
  String stage1A6Ypzlz;

  Pass1Ie53Oq9({
    required this.stage1A6Ypzlz,
  });

  factory Pass1Ie53Oq9.fromJson(Map<String, dynamic> json) => Pass1Ie53Oq9(
        stage1A6Ypzlz: json["STAGE-1-A6YPZLZ"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-A6YPZLZ": stage1A6Ypzlz,
      };
}

class Pass1Lowk8Pq {
  String stage1Mp3Mpzp;

  Pass1Lowk8Pq({
    required this.stage1Mp3Mpzp,
  });

  factory Pass1Lowk8Pq.fromJson(Map<String, dynamic> json) => Pass1Lowk8Pq(
        stage1Mp3Mpzp: json["STAGE-1-MP3MPZP"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-MP3MPZP": stage1Mp3Mpzp,
      };
}

class Pass1Nvbtvc0 {
  String stage15Ubarvr;

  Pass1Nvbtvc0({
    required this.stage15Ubarvr,
  });

  factory Pass1Nvbtvc0.fromJson(Map<String, dynamic> json) => Pass1Nvbtvc0(
        stage15Ubarvr: json["STAGE-1-5UBARVR"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-5UBARVR": stage15Ubarvr,
      };
}

class Pass1Ocr1Eah {
  String stage1Bbd0Iwb;

  Pass1Ocr1Eah({
    required this.stage1Bbd0Iwb,
  });

  factory Pass1Ocr1Eah.fromJson(Map<String, dynamic> json) => Pass1Ocr1Eah(
        stage1Bbd0Iwb: json["STAGE-1-BBD0IWB"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-BBD0IWB": stage1Bbd0Iwb,
      };
}

class Pass1Op6Y5Ro {
  String stage1Fcv3Mg0;

  Pass1Op6Y5Ro({
    required this.stage1Fcv3Mg0,
  });

  factory Pass1Op6Y5Ro.fromJson(Map<String, dynamic> json) => Pass1Op6Y5Ro(
        stage1Fcv3Mg0: json["STAGE-1-FCV3MG0"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-FCV3MG0": stage1Fcv3Mg0,
      };
}

class Pass1Owyfqh2 {
  String stage1Ux8Sfi4;

  Pass1Owyfqh2({
    required this.stage1Ux8Sfi4,
  });

  factory Pass1Owyfqh2.fromJson(Map<String, dynamic> json) => Pass1Owyfqh2(
        stage1Ux8Sfi4: json["STAGE-1-UX8SFI4"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-UX8SFI4": stage1Ux8Sfi4,
      };
}

class Pass1P7Bj9Lh {
  String stage1Rkis7Et;

  Pass1P7Bj9Lh({
    required this.stage1Rkis7Et,
  });

  factory Pass1P7Bj9Lh.fromJson(Map<String, dynamic> json) => Pass1P7Bj9Lh(
        stage1Rkis7Et: json["STAGE-1-RKIS7ET"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-RKIS7ET": stage1Rkis7Et,
      };
}

class Pass1Queeya2 {
  String stage153T03C3;

  Pass1Queeya2({
    required this.stage153T03C3,
  });

  factory Pass1Queeya2.fromJson(Map<String, dynamic> json) => Pass1Queeya2(
        stage153T03C3: json["STAGE-1-53T03C3"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-53T03C3": stage153T03C3,
      };
}

class Pass1Qx0Thpp {
  String stage19Okbrel;

  Pass1Qx0Thpp({
    required this.stage19Okbrel,
  });

  factory Pass1Qx0Thpp.fromJson(Map<String, dynamic> json) => Pass1Qx0Thpp(
        stage19Okbrel: json["STAGE-1-9OKBREL"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-9OKBREL": stage19Okbrel,
      };
}

class Pass1Rc0Gs0X {
  String stage1K0Pvfh5;

  Pass1Rc0Gs0X({
    required this.stage1K0Pvfh5,
  });

  factory Pass1Rc0Gs0X.fromJson(Map<String, dynamic> json) => Pass1Rc0Gs0X(
        stage1K0Pvfh5: json["STAGE-1-K0PVFH5"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-K0PVFH5": stage1K0Pvfh5,
      };
}

class Pass1T1P1328 {
  String? stage1P1T1P1328;
  String? stage2P1T1P1328;
  String? stage3P1T1P1328;

  Pass1T1P1328({
    this.stage1P1T1P1328,
    this.stage2P1T1P1328,
    this.stage3P1T1P1328,
  });

  factory Pass1T1P1328.fromJson(Map<String, dynamic> json) => Pass1T1P1328(
        stage1P1T1P1328: json["STAGE-1-P1T1P1-328"],
        stage2P1T1P1328: json["STAGE-2-P1T1P1-328"],
        stage3P1T1P1328: json["STAGE-3-P1T1P1-328"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-P1T1P1-328": stage1P1T1P1328,
        "STAGE-2-P1T1P1-328": stage2P1T1P1328,
        "STAGE-3-P1T1P1-328": stage3P1T1P1328,
      };
}

class Pass1T1P2328 {
  String stage1P1T1P2328;

  Pass1T1P2328({
    required this.stage1P1T1P2328,
  });

  factory Pass1T1P2328.fromJson(Map<String, dynamic> json) => Pass1T1P2328(
        stage1P1T1P2328: json["STAGE-1-P1T1P2-328"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-P1T1P2-328": stage1P1T1P2328,
      };
}

class Pass1T2P1328 {
  String stage1P1T2P1328;

  Pass1T2P1328({
    required this.stage1P1T2P1328,
  });

  factory Pass1T2P1328.fromJson(Map<String, dynamic> json) => Pass1T2P1328(
        stage1P1T2P1328: json["STAGE-1-P1T2P1-328"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-P1T2P1-328": stage1P1T2P1328,
      };
}

class Pass1Twxctfc {
  String stage13Oad4Hj;

  Pass1Twxctfc({
    required this.stage13Oad4Hj,
  });

  factory Pass1Twxctfc.fromJson(Map<String, dynamic> json) => Pass1Twxctfc(
        stage13Oad4Hj: json["STAGE-1-3OAD4HJ"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-3OAD4HJ": stage13Oad4Hj,
      };
}

class Pass1U8M3Mr {
  String? stage1Yk2Wnan;
  String? stage2O60Xvm2;

  Pass1U8M3Mr({
    this.stage1Yk2Wnan,
    this.stage2O60Xvm2,
  });

  factory Pass1U8M3Mr.fromJson(Map<String, dynamic> json) => Pass1U8M3Mr(
        stage1Yk2Wnan: json["STAGE-1-YK2WNAN"],
        stage2O60Xvm2: json["STAGE-2-O60XVM2"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-YK2WNAN": stage1Yk2Wnan,
        "STAGE-2-O60XVM2": stage2O60Xvm2,
      };
}

class Pass1Urgnhib {
  String stage1Q9Jof2G;

  Pass1Urgnhib({
    required this.stage1Q9Jof2G,
  });

  factory Pass1Urgnhib.fromJson(Map<String, dynamic> json) => Pass1Urgnhib(
        stage1Q9Jof2G: json["STAGE-1-Q9JOF2G"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-Q9JOF2G": stage1Q9Jof2G,
      };
}

class Pass1Utv4Oyn {
  String stage14Eskmm9;

  Pass1Utv4Oyn({
    required this.stage14Eskmm9,
  });

  factory Pass1Utv4Oyn.fromJson(Map<String, dynamic> json) => Pass1Utv4Oyn(
        stage14Eskmm9: json["STAGE-1-4ESKMM9"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-4ESKMM9": stage14Eskmm9,
      };
}

class Pass1V1Kkqfm {
  String stage16A5Zvn7;

  Pass1V1Kkqfm({
    required this.stage16A5Zvn7,
  });

  factory Pass1V1Kkqfm.fromJson(Map<String, dynamic> json) => Pass1V1Kkqfm(
        stage16A5Zvn7: json["STAGE-1-6A5ZVN7"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-6A5ZVN7": stage16A5Zvn7,
      };
}

class Pass1W69Baqw {
  String stage1Pbpfmqm;

  Pass1W69Baqw({
    required this.stage1Pbpfmqm,
  });

  factory Pass1W69Baqw.fromJson(Map<String, dynamic> json) => Pass1W69Baqw(
        stage1Pbpfmqm: json["STAGE-1-PBPFMQM"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-PBPFMQM": stage1Pbpfmqm,
      };
}

class Pass1Xooftbb {
  String? stage12Vqxrim;
  String? stage2Uzsi1Zx;

  Pass1Xooftbb({
    this.stage12Vqxrim,
    this.stage2Uzsi1Zx,
  });

  factory Pass1Xooftbb.fromJson(Map<String, dynamic> json) => Pass1Xooftbb(
        stage12Vqxrim: json["STAGE-1-2VQXRIM"],
        stage2Uzsi1Zx: json["STAGE-2-UZSI1ZX"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-2VQXRIM": stage12Vqxrim,
        "STAGE-2-UZSI1ZX": stage2Uzsi1Zx,
      };
}

class Pass1Yb27Ib8 {
  String stage1Jafv9Vs;

  Pass1Yb27Ib8({
    required this.stage1Jafv9Vs,
  });

  factory Pass1Yb27Ib8.fromJson(Map<String, dynamic> json) => Pass1Yb27Ib8(
        stage1Jafv9Vs: json["STAGE-1-JAFV9VS"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-JAFV9VS": stage1Jafv9Vs,
      };
}

class Pass1Ycabhve {
  String stage1I0I9Sfx;

  Pass1Ycabhve({
    required this.stage1I0I9Sfx,
  });

  factory Pass1Ycabhve.fromJson(Map<String, dynamic> json) => Pass1Ycabhve(
        stage1I0I9Sfx: json["STAGE-1-I0I9SFX"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-I0I9SFX": stage1I0I9Sfx,
      };
}

class Pass1Ygyn4Wc {
  String stage1Sahpjsm;

  Pass1Ygyn4Wc({
    required this.stage1Sahpjsm,
  });

  factory Pass1Ygyn4Wc.fromJson(Map<String, dynamic> json) => Pass1Ygyn4Wc(
        stage1Sahpjsm: json["STAGE-1-SAHPJSM"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-SAHPJSM": stage1Sahpjsm,
      };
}

class Pass1Znxh1Ba {
  String stage11Vj4Evi;

  Pass1Znxh1Ba({
    required this.stage11Vj4Evi,
  });

  factory Pass1Znxh1Ba.fromJson(Map<String, dynamic> json) => Pass1Znxh1Ba(
        stage11Vj4Evi: json["STAGE-1-1VJ4EVI"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-1VJ4EVI": stage11Vj4Evi,
      };
}

class Pass2Ih3Evvn {
  String stage19Jmc9Ql;

  Pass2Ih3Evvn({
    required this.stage19Jmc9Ql,
  });

  factory Pass2Ih3Evvn.fromJson(Map<String, dynamic> json) => Pass2Ih3Evvn(
        stage19Jmc9Ql: json["STAGE-1-9JMC9QL"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-9JMC9QL": stage19Jmc9Ql,
      };
}

class Pass2T2P1328 {
  String? stage1P2T2P1328;
  String? stage2P2T2P1328;

  Pass2T2P1328({
    this.stage1P2T2P1328,
    this.stage2P2T2P1328,
  });

  factory Pass2T2P1328.fromJson(Map<String, dynamic> json) => Pass2T2P1328(
        stage1P2T2P1328: json["STAGE-1-P2T2P1-328"],
        stage2P2T2P1328: json["STAGE-2-P2T2P1-328"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-P2T2P1-328": stage1P2T2P1328,
        "STAGE-2-P2T2P1-328": stage2P2T2P1328,
      };
}

class Pass2Xgbys8X {
  String? stage1Roh7S4E;
  String? stage27Xnyn7Y;

  Pass2Xgbys8X({
    this.stage1Roh7S4E,
    this.stage27Xnyn7Y,
  });

  factory Pass2Xgbys8X.fromJson(Map<String, dynamic> json) => Pass2Xgbys8X(
        stage1Roh7S4E: json["STAGE-1-ROH7S4E"],
        stage27Xnyn7Y: json["STAGE-2-7XNYN7Y"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-ROH7S4E": stage1Roh7S4E,
        "STAGE-2-7XNYN7Y": stage27Xnyn7Y,
      };
}

class Pass2Xgo9Gmz {
  String stage1Gfi6Wx0;

  Pass2Xgo9Gmz({
    required this.stage1Gfi6Wx0,
  });

  factory Pass2Xgo9Gmz.fromJson(Map<String, dynamic> json) => Pass2Xgo9Gmz(
        stage1Gfi6Wx0: json["STAGE-1-GFI6WX0"],
      );

  Map<String, dynamic> toJson() => {
        "STAGE-1-GFI6WX0": stage1Gfi6Wx0,
      };
}

class Trains {
  List<Plant1328> plant1328;
  List<Plant2328> plant2328;
  List<Plant3225M07U> plant3225M07U;
  List<Plant41Ivjeu8> plant41Ivjeu8;
  List<Plant522794Qz> plant522794Qz;
  List<Plant6A830Fjz> plant6A830Fjz;
  List<Plant79Oinat7> plant79Oinat7;
  List<Plant8Zg13B9Y> plant8Zg13B9Y;
  List<Plant9Wy5Br96> plant9Wy5Br96;
  List<Plant10G0Mrlkp> plant10G0Mrlkp;
  List<Plant117C2T2Qd> plant117C2T2Qd;
  List<Plant129K9Gzo7> plant129K9Gzo7;
  List<Plant130Pzobyd> plant130Pzobyd;
  List<Plant1482Vafe2> plant1482Vafe2;
  List<Plant15E1Oq6C7> plant15E1Oq6C7;
  List<Plant16Yuferv4> plant16Yuferv4;
  List<Plant1742Pj17W> plant1742Pj17W;
  List<Plant18Lp0Kdya> plant18Lp0Kdya;
  List<Plant191Kd2Yxx> plant191Kd2Yxx;
  List<dynamic> plant20Sejlw0O;
  List<Plant2104Rw62M> plant2104Rw62M;
  List<Plant22Jgvxawf> plant22Jgvxawf;
  List<Plant23Wg7Fi5R> plant23Wg7Fi5R;
  List<Plant24V12Xteg> plant24V12Xteg;
  List<Plant25Wqo6Hqh> plant25Wqo6Hqh;
  List<Plant263Kymw4D> plant263Kymw4D;
  List<Plant27X5Mgmkm> plant27X5Mgmkm;
  List<Plant28Oxgkc1N> plant28Oxgkc1N;
  List<Plant29J6X50T3> plant29J6X50T3;
  List<Plant30Tk1L669> plant30Tk1L669;
  List<Plant31Vlzdnqu> plant31Vlzdnqu;
  List<Plant32Dfa1Mgz> plant32Dfa1Mgz;
  List<Plant330G4R85E> plant330G4R85E;
  List<Plant34O7Nkryk> plant34O7Nkryk;
  List<Plant35Zg69Y2H> plant35Zg69Y2H;
  List<Plant36Rmf1B91> plant36Rmf1B91;
  List<Plant379Xt0Zg0> plant379Xt0Zg0;
  List<Plant38Oogeev1> plant38Oogeev1;
  List<Plant3949Alq33> plant3949Alq33;
  List<Plant40Hzfrb6A> plant40Hzfrb6A;

  Trains({
    required this.plant1328,
    required this.plant2328,
    required this.plant3225M07U,
    required this.plant41Ivjeu8,
    required this.plant522794Qz,
    required this.plant6A830Fjz,
    required this.plant79Oinat7,
    required this.plant8Zg13B9Y,
    required this.plant9Wy5Br96,
    required this.plant10G0Mrlkp,
    required this.plant117C2T2Qd,
    required this.plant129K9Gzo7,
    required this.plant130Pzobyd,
    required this.plant1482Vafe2,
    required this.plant15E1Oq6C7,
    required this.plant16Yuferv4,
    required this.plant1742Pj17W,
    required this.plant18Lp0Kdya,
    required this.plant191Kd2Yxx,
    required this.plant20Sejlw0O,
    required this.plant2104Rw62M,
    required this.plant22Jgvxawf,
    required this.plant23Wg7Fi5R,
    required this.plant24V12Xteg,
    required this.plant25Wqo6Hqh,
    required this.plant263Kymw4D,
    required this.plant27X5Mgmkm,
    required this.plant28Oxgkc1N,
    required this.plant29J6X50T3,
    required this.plant30Tk1L669,
    required this.plant31Vlzdnqu,
    required this.plant32Dfa1Mgz,
    required this.plant330G4R85E,
    required this.plant34O7Nkryk,
    required this.plant35Zg69Y2H,
    required this.plant36Rmf1B91,
    required this.plant379Xt0Zg0,
    required this.plant38Oogeev1,
    required this.plant3949Alq33,
    required this.plant40Hzfrb6A,
  });

  factory Trains.fromJson(Map<String, dynamic> json) => Trains(
        plant1328: List<Plant1328>.from(
            json["PLANT-1-328"].map((x) => Plant1328.fromJson(x))),
        plant2328: List<Plant2328>.from(
            json["PLANT-2-328"].map((x) => Plant2328.fromJson(x))),
        plant3225M07U: List<Plant3225M07U>.from(
            json["PLANT-3-225M07U"].map((x) => Plant3225M07U.fromJson(x))),
        plant41Ivjeu8: List<Plant41Ivjeu8>.from(
            json["PLANT-4-1IVJEU8"].map((x) => Plant41Ivjeu8.fromJson(x))),
        plant522794Qz: List<Plant522794Qz>.from(
            json["PLANT-5-22794QZ"].map((x) => Plant522794Qz.fromJson(x))),
        plant6A830Fjz: List<Plant6A830Fjz>.from(
            json["PLANT-6-A830FJZ"].map((x) => Plant6A830Fjz.fromJson(x))),
        plant79Oinat7: List<Plant79Oinat7>.from(
            json["PLANT-7-9OINAT7"].map((x) => Plant79Oinat7.fromJson(x))),
        plant8Zg13B9Y: List<Plant8Zg13B9Y>.from(
            json["PLANT-8-ZG13B9Y"].map((x) => Plant8Zg13B9Y.fromJson(x))),
        plant9Wy5Br96: List<Plant9Wy5Br96>.from(
            json["PLANT-9-WY5BR96"].map((x) => Plant9Wy5Br96.fromJson(x))),
        plant10G0Mrlkp: List<Plant10G0Mrlkp>.from(
            json["PLANT-10-G0MRLKP"].map((x) => Plant10G0Mrlkp.fromJson(x))),
        plant117C2T2Qd: List<Plant117C2T2Qd>.from(
            json["PLANT-11-7C2T2QD"].map((x) => Plant117C2T2Qd.fromJson(x))),
        plant129K9Gzo7: List<Plant129K9Gzo7>.from(
            json["PLANT-12-9K9GZO7"].map((x) => Plant129K9Gzo7.fromJson(x))),
        plant130Pzobyd: List<Plant130Pzobyd>.from(
            json["PLANT-13-0PZOBYD"].map((x) => Plant130Pzobyd.fromJson(x))),
        plant1482Vafe2: List<Plant1482Vafe2>.from(
            json["PLANT-14-82VAFE2"].map((x) => Plant1482Vafe2.fromJson(x))),
        plant15E1Oq6C7: List<Plant15E1Oq6C7>.from(
            json["PLANT-15-E1OQ6C7"].map((x) => Plant15E1Oq6C7.fromJson(x))),
        plant16Yuferv4: List<Plant16Yuferv4>.from(
            json["PLANT-16-YUFERV4"].map((x) => Plant16Yuferv4.fromJson(x))),
        plant1742Pj17W: List<Plant1742Pj17W>.from(
            json["PLANT-17-42PJ17W"].map((x) => Plant1742Pj17W.fromJson(x))),
        plant18Lp0Kdya: List<Plant18Lp0Kdya>.from(
            json["PLANT-18-LP0KDYA"].map((x) => Plant18Lp0Kdya.fromJson(x))),
        plant191Kd2Yxx: List<Plant191Kd2Yxx>.from(
            json["PLANT-19-1KD2YXX"].map((x) => Plant191Kd2Yxx.fromJson(x))),
        plant20Sejlw0O:
            List<dynamic>.from(json["PLANT-20-SEJLW0O"].map((x) => x)),
        plant2104Rw62M: List<Plant2104Rw62M>.from(
            json["PLANT-21-04RW62M"].map((x) => Plant2104Rw62M.fromJson(x))),
        plant22Jgvxawf: List<Plant22Jgvxawf>.from(
            json["PLANT-22-JGVXAWF"].map((x) => Plant22Jgvxawf.fromJson(x))),
        plant23Wg7Fi5R: List<Plant23Wg7Fi5R>.from(
            json["PLANT-23-WG7FI5R"].map((x) => Plant23Wg7Fi5R.fromJson(x))),
        plant24V12Xteg: List<Plant24V12Xteg>.from(
            json["PLANT-24-V12XTEG"].map((x) => Plant24V12Xteg.fromJson(x))),
        plant25Wqo6Hqh: List<Plant25Wqo6Hqh>.from(
            json["PLANT-25-WQO6HQH"].map((x) => Plant25Wqo6Hqh.fromJson(x))),
        plant263Kymw4D: List<Plant263Kymw4D>.from(
            json["PLANT-26-3KYMW4D"].map((x) => Plant263Kymw4D.fromJson(x))),
        plant27X5Mgmkm: List<Plant27X5Mgmkm>.from(
            json["PLANT-27-X5MGMKM"].map((x) => Plant27X5Mgmkm.fromJson(x))),
        plant28Oxgkc1N: List<Plant28Oxgkc1N>.from(
            json["PLANT-28-OXGKC1N"].map((x) => Plant28Oxgkc1N.fromJson(x))),
        plant29J6X50T3: List<Plant29J6X50T3>.from(
            json["PLANT-29-J6X50T3"].map((x) => Plant29J6X50T3.fromJson(x))),
        plant30Tk1L669: List<Plant30Tk1L669>.from(
            json["PLANT-30-TK1L669"].map((x) => Plant30Tk1L669.fromJson(x))),
        plant31Vlzdnqu: List<Plant31Vlzdnqu>.from(
            json["PLANT-31-VLZDNQU"].map((x) => Plant31Vlzdnqu.fromJson(x))),
        plant32Dfa1Mgz: List<Plant32Dfa1Mgz>.from(
            json["PLANT-32-DFA1MGZ"].map((x) => Plant32Dfa1Mgz.fromJson(x))),
        plant330G4R85E: List<Plant330G4R85E>.from(
            json["PLANT-33-0G4R85E"].map((x) => Plant330G4R85E.fromJson(x))),
        plant34O7Nkryk: List<Plant34O7Nkryk>.from(
            json["PLANT-34-O7NKRYK"].map((x) => Plant34O7Nkryk.fromJson(x))),
        plant35Zg69Y2H: List<Plant35Zg69Y2H>.from(
            json["PLANT-35-ZG69Y2H"].map((x) => Plant35Zg69Y2H.fromJson(x))),
        plant36Rmf1B91: List<Plant36Rmf1B91>.from(
            json["PLANT-36-RMF1B91"].map((x) => Plant36Rmf1B91.fromJson(x))),
        plant379Xt0Zg0: List<Plant379Xt0Zg0>.from(
            json["PLANT-37-9XT0ZG0"].map((x) => Plant379Xt0Zg0.fromJson(x))),
        plant38Oogeev1: List<Plant38Oogeev1>.from(
            json["PLANT-38-OOGEEV1"].map((x) => Plant38Oogeev1.fromJson(x))),
        plant3949Alq33: List<Plant3949Alq33>.from(
            json["PLANT-39-49ALQ33"].map((x) => Plant3949Alq33.fromJson(x))),
        plant40Hzfrb6A: List<Plant40Hzfrb6A>.from(
            json["PLANT-40-HZFRB6A"].map((x) => Plant40Hzfrb6A.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PLANT-1-328": List<dynamic>.from(plant1328.map((x) => x.toJson())),
        "PLANT-2-328": List<dynamic>.from(plant2328.map((x) => x.toJson())),
        "PLANT-3-225M07U":
            List<dynamic>.from(plant3225M07U.map((x) => x.toJson())),
        "PLANT-4-1IVJEU8":
            List<dynamic>.from(plant41Ivjeu8.map((x) => x.toJson())),
        "PLANT-5-22794QZ":
            List<dynamic>.from(plant522794Qz.map((x) => x.toJson())),
        "PLANT-6-A830FJZ":
            List<dynamic>.from(plant6A830Fjz.map((x) => x.toJson())),
        "PLANT-7-9OINAT7":
            List<dynamic>.from(plant79Oinat7.map((x) => x.toJson())),
        "PLANT-8-ZG13B9Y":
            List<dynamic>.from(plant8Zg13B9Y.map((x) => x.toJson())),
        "PLANT-9-WY5BR96":
            List<dynamic>.from(plant9Wy5Br96.map((x) => x.toJson())),
        "PLANT-10-G0MRLKP":
            List<dynamic>.from(plant10G0Mrlkp.map((x) => x.toJson())),
        "PLANT-11-7C2T2QD":
            List<dynamic>.from(plant117C2T2Qd.map((x) => x.toJson())),
        "PLANT-12-9K9GZO7":
            List<dynamic>.from(plant129K9Gzo7.map((x) => x.toJson())),
        "PLANT-13-0PZOBYD":
            List<dynamic>.from(plant130Pzobyd.map((x) => x.toJson())),
        "PLANT-14-82VAFE2":
            List<dynamic>.from(plant1482Vafe2.map((x) => x.toJson())),
        "PLANT-15-E1OQ6C7":
            List<dynamic>.from(plant15E1Oq6C7.map((x) => x.toJson())),
        "PLANT-16-YUFERV4":
            List<dynamic>.from(plant16Yuferv4.map((x) => x.toJson())),
        "PLANT-17-42PJ17W":
            List<dynamic>.from(plant1742Pj17W.map((x) => x.toJson())),
        "PLANT-18-LP0KDYA":
            List<dynamic>.from(plant18Lp0Kdya.map((x) => x.toJson())),
        "PLANT-19-1KD2YXX":
            List<dynamic>.from(plant191Kd2Yxx.map((x) => x.toJson())),
        "PLANT-20-SEJLW0O": List<dynamic>.from(plant20Sejlw0O.map((x) => x)),
        "PLANT-21-04RW62M":
            List<dynamic>.from(plant2104Rw62M.map((x) => x.toJson())),
        "PLANT-22-JGVXAWF":
            List<dynamic>.from(plant22Jgvxawf.map((x) => x.toJson())),
        "PLANT-23-WG7FI5R":
            List<dynamic>.from(plant23Wg7Fi5R.map((x) => x.toJson())),
        "PLANT-24-V12XTEG":
            List<dynamic>.from(plant24V12Xteg.map((x) => x.toJson())),
        "PLANT-25-WQO6HQH":
            List<dynamic>.from(plant25Wqo6Hqh.map((x) => x.toJson())),
        "PLANT-26-3KYMW4D":
            List<dynamic>.from(plant263Kymw4D.map((x) => x.toJson())),
        "PLANT-27-X5MGMKM":
            List<dynamic>.from(plant27X5Mgmkm.map((x) => x.toJson())),
        "PLANT-28-OXGKC1N":
            List<dynamic>.from(plant28Oxgkc1N.map((x) => x.toJson())),
        "PLANT-29-J6X50T3":
            List<dynamic>.from(plant29J6X50T3.map((x) => x.toJson())),
        "PLANT-30-TK1L669":
            List<dynamic>.from(plant30Tk1L669.map((x) => x.toJson())),
        "PLANT-31-VLZDNQU":
            List<dynamic>.from(plant31Vlzdnqu.map((x) => x.toJson())),
        "PLANT-32-DFA1MGZ":
            List<dynamic>.from(plant32Dfa1Mgz.map((x) => x.toJson())),
        "PLANT-33-0G4R85E":
            List<dynamic>.from(plant330G4R85E.map((x) => x.toJson())),
        "PLANT-34-O7NKRYK":
            List<dynamic>.from(plant34O7Nkryk.map((x) => x.toJson())),
        "PLANT-35-ZG69Y2H":
            List<dynamic>.from(plant35Zg69Y2H.map((x) => x.toJson())),
        "PLANT-36-RMF1B91":
            List<dynamic>.from(plant36Rmf1B91.map((x) => x.toJson())),
        "PLANT-37-9XT0ZG0":
            List<dynamic>.from(plant379Xt0Zg0.map((x) => x.toJson())),
        "PLANT-38-OOGEEV1":
            List<dynamic>.from(plant38Oogeev1.map((x) => x.toJson())),
        "PLANT-39-49ALQ33":
            List<dynamic>.from(plant3949Alq33.map((x) => x.toJson())),
        "PLANT-40-HZFRB6A":
            List<dynamic>.from(plant40Hzfrb6A.map((x) => x.toJson())),
      };
}

class Plant10G0Mrlkp {
  String train1Guo387O;

  Plant10G0Mrlkp({
    required this.train1Guo387O,
  });

  factory Plant10G0Mrlkp.fromJson(Map<String, dynamic> json) => Plant10G0Mrlkp(
        train1Guo387O: json["TRAIN-1-GUO387O"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-GUO387O": train1Guo387O,
      };
}

class Plant117C2T2Qd {
  String train1Abh70Ca;

  Plant117C2T2Qd({
    required this.train1Abh70Ca,
  });

  factory Plant117C2T2Qd.fromJson(Map<String, dynamic> json) => Plant117C2T2Qd(
        train1Abh70Ca: json["TRAIN-1-ABH70CA"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-ABH70CA": train1Abh70Ca,
      };
}

class Plant129K9Gzo7 {
  String train1Qup3G0K;

  Plant129K9Gzo7({
    required this.train1Qup3G0K,
  });

  factory Plant129K9Gzo7.fromJson(Map<String, dynamic> json) => Plant129K9Gzo7(
        train1Qup3G0K: json["TRAIN-1-QUP3G0K"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-QUP3G0K": train1Qup3G0K,
      };
}

class Plant130Pzobyd {
  String train11Dou7Lh;

  Plant130Pzobyd({
    required this.train11Dou7Lh,
  });

  factory Plant130Pzobyd.fromJson(Map<String, dynamic> json) => Plant130Pzobyd(
        train11Dou7Lh: json["TRAIN-1-1DOU7LH"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-1DOU7LH": train11Dou7Lh,
      };
}

class Plant1328 {
  String? train1P1328;
  String? train2P1328;

  Plant1328({
    this.train1P1328,
    this.train2P1328,
  });

  factory Plant1328.fromJson(Map<String, dynamic> json) => Plant1328(
        train1P1328: json["TRAIN-1-P1-328"],
        train2P1328: json["TRAIN-2-P1-328"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-P1-328": train1P1328,
        "TRAIN-2-P1-328": train2P1328,
      };
}

class Plant1482Vafe2 {
  String train1Kicdsq9;

  Plant1482Vafe2({
    required this.train1Kicdsq9,
  });

  factory Plant1482Vafe2.fromJson(Map<String, dynamic> json) => Plant1482Vafe2(
        train1Kicdsq9: json["TRAIN-1-KICDSQ9"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-KICDSQ9": train1Kicdsq9,
      };
}

class Plant15E1Oq6C7 {
  String train1Mgmf51C;

  Plant15E1Oq6C7({
    required this.train1Mgmf51C,
  });

  factory Plant15E1Oq6C7.fromJson(Map<String, dynamic> json) => Plant15E1Oq6C7(
        train1Mgmf51C: json["TRAIN-1-MGMF51C"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-MGMF51C": train1Mgmf51C,
      };
}

class Plant16Yuferv4 {
  String train1Xhm3H69;

  Plant16Yuferv4({
    required this.train1Xhm3H69,
  });

  factory Plant16Yuferv4.fromJson(Map<String, dynamic> json) => Plant16Yuferv4(
        train1Xhm3H69: json["TRAIN-1-XHM3H69"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-XHM3H69": train1Xhm3H69,
      };
}

class Plant1742Pj17W {
  String train1Chbb5Mk;

  Plant1742Pj17W({
    required this.train1Chbb5Mk,
  });

  factory Plant1742Pj17W.fromJson(Map<String, dynamic> json) => Plant1742Pj17W(
        train1Chbb5Mk: json["TRAIN-1-CHBB5MK"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-CHBB5MK": train1Chbb5Mk,
      };
}

class Plant18Lp0Kdya {
  String train1Xnz904J;

  Plant18Lp0Kdya({
    required this.train1Xnz904J,
  });

  factory Plant18Lp0Kdya.fromJson(Map<String, dynamic> json) => Plant18Lp0Kdya(
        train1Xnz904J: json["TRAIN-1-XNZ904J"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-XNZ904J": train1Xnz904J,
      };
}

class Plant191Kd2Yxx {
  String train1Ruqjbob;

  Plant191Kd2Yxx({
    required this.train1Ruqjbob,
  });

  factory Plant191Kd2Yxx.fromJson(Map<String, dynamic> json) => Plant191Kd2Yxx(
        train1Ruqjbob: json["TRAIN-1-RUQJBOB"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-RUQJBOB": train1Ruqjbob,
      };
}

class Plant2104Rw62M {
  String train1H4Hj6Lq;

  Plant2104Rw62M({
    required this.train1H4Hj6Lq,
  });

  factory Plant2104Rw62M.fromJson(Map<String, dynamic> json) => Plant2104Rw62M(
        train1H4Hj6Lq: json["TRAIN-1-H4HJ6LQ"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-H4HJ6LQ": train1H4Hj6Lq,
      };
}

class Plant22Jgvxawf {
  String train113Fty6Z;

  Plant22Jgvxawf({
    required this.train113Fty6Z,
  });

  factory Plant22Jgvxawf.fromJson(Map<String, dynamic> json) => Plant22Jgvxawf(
        train113Fty6Z: json["TRAIN-1-13FTY6Z"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-13FTY6Z": train113Fty6Z,
      };
}

class Plant2328 {
  String train1P2328;

  Plant2328({
    required this.train1P2328,
  });

  factory Plant2328.fromJson(Map<String, dynamic> json) => Plant2328(
        train1P2328: json["TRAIN-1-P2-328"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-P2-328": train1P2328,
      };
}

class Plant23Wg7Fi5R {
  String train15P3W7Fm;

  Plant23Wg7Fi5R({
    required this.train15P3W7Fm,
  });

  factory Plant23Wg7Fi5R.fromJson(Map<String, dynamic> json) => Plant23Wg7Fi5R(
        train15P3W7Fm: json["TRAIN-1-5P3W7FM"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-5P3W7FM": train15P3W7Fm,
      };
}

class Plant24V12Xteg {
  String train1Xr2Irdh;

  Plant24V12Xteg({
    required this.train1Xr2Irdh,
  });

  factory Plant24V12Xteg.fromJson(Map<String, dynamic> json) => Plant24V12Xteg(
        train1Xr2Irdh: json["TRAIN-1-XR2IRDH"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-XR2IRDH": train1Xr2Irdh,
      };
}

class Plant25Wqo6Hqh {
  String train1A6Ent5F;

  Plant25Wqo6Hqh({
    required this.train1A6Ent5F,
  });

  factory Plant25Wqo6Hqh.fromJson(Map<String, dynamic> json) => Plant25Wqo6Hqh(
        train1A6Ent5F: json["TRAIN-1-A6ENT5F"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-A6ENT5F": train1A6Ent5F,
      };
}

class Plant263Kymw4D {
  String train1Oe5Luwb;

  Plant263Kymw4D({
    required this.train1Oe5Luwb,
  });

  factory Plant263Kymw4D.fromJson(Map<String, dynamic> json) => Plant263Kymw4D(
        train1Oe5Luwb: json["TRAIN-1-OE5LUWB"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-OE5LUWB": train1Oe5Luwb,
      };
}

class Plant27X5Mgmkm {
  String train1Nttjv94;

  Plant27X5Mgmkm({
    required this.train1Nttjv94,
  });

  factory Plant27X5Mgmkm.fromJson(Map<String, dynamic> json) => Plant27X5Mgmkm(
        train1Nttjv94: json["TRAIN-1-NTTJV94"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-NTTJV94": train1Nttjv94,
      };
}

class Plant28Oxgkc1N {
  String train1Bvura03;

  Plant28Oxgkc1N({
    required this.train1Bvura03,
  });

  factory Plant28Oxgkc1N.fromJson(Map<String, dynamic> json) => Plant28Oxgkc1N(
        train1Bvura03: json["TRAIN-1-BVURA03"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-BVURA03": train1Bvura03,
      };
}

class Plant29J6X50T3 {
  String train1Xudv4Js;

  Plant29J6X50T3({
    required this.train1Xudv4Js,
  });

  factory Plant29J6X50T3.fromJson(Map<String, dynamic> json) => Plant29J6X50T3(
        train1Xudv4Js: json["TRAIN-1-XUDV4JS"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-XUDV4JS": train1Xudv4Js,
      };
}

class Plant30Tk1L669 {
  String train1Amu73Ml;

  Plant30Tk1L669({
    required this.train1Amu73Ml,
  });

  factory Plant30Tk1L669.fromJson(Map<String, dynamic> json) => Plant30Tk1L669(
        train1Amu73Ml: json["TRAIN-1-AMU73ML"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-AMU73ML": train1Amu73Ml,
      };
}

class Plant31Vlzdnqu {
  String train11G9Xzgv;

  Plant31Vlzdnqu({
    required this.train11G9Xzgv,
  });

  factory Plant31Vlzdnqu.fromJson(Map<String, dynamic> json) => Plant31Vlzdnqu(
        train11G9Xzgv: json["TRAIN-1-1G9XZGV"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-1G9XZGV": train11G9Xzgv,
      };
}

class Plant3225M07U {
  String train1E4C0Sin;

  Plant3225M07U({
    required this.train1E4C0Sin,
  });

  factory Plant3225M07U.fromJson(Map<String, dynamic> json) => Plant3225M07U(
        train1E4C0Sin: json["TRAIN-1-E4C0SIN"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-E4C0SIN": train1E4C0Sin,
      };
}

class Plant32Dfa1Mgz {
  String train1I25P7En;

  Plant32Dfa1Mgz({
    required this.train1I25P7En,
  });

  factory Plant32Dfa1Mgz.fromJson(Map<String, dynamic> json) => Plant32Dfa1Mgz(
        train1I25P7En: json["TRAIN-1-I25P7EN"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-I25P7EN": train1I25P7En,
      };
}

class Plant330G4R85E {
  String? train1Pd2Br6I;
  String? train20Mxdhzr;
  String? train3Xyx01Kz;

  Plant330G4R85E({
    this.train1Pd2Br6I,
    this.train20Mxdhzr,
    this.train3Xyx01Kz,
  });

  factory Plant330G4R85E.fromJson(Map<String, dynamic> json) => Plant330G4R85E(
        train1Pd2Br6I: json["TRAIN-1-PD2BR6I"],
        train20Mxdhzr: json["TRAIN-2-0MXDHZR"],
        train3Xyx01Kz: json["TRAIN-3-XYX01KZ"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-PD2BR6I": train1Pd2Br6I,
        "TRAIN-2-0MXDHZR": train20Mxdhzr,
        "TRAIN-3-XYX01KZ": train3Xyx01Kz,
      };
}

class Plant34O7Nkryk {
  String train1Tt3Lsjm;

  Plant34O7Nkryk({
    required this.train1Tt3Lsjm,
  });

  factory Plant34O7Nkryk.fromJson(Map<String, dynamic> json) => Plant34O7Nkryk(
        train1Tt3Lsjm: json["TRAIN-1-TT3LSJM"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-TT3LSJM": train1Tt3Lsjm,
      };
}

class Plant35Zg69Y2H {
  String train1O0V1Jqc;

  Plant35Zg69Y2H({
    required this.train1O0V1Jqc,
  });

  factory Plant35Zg69Y2H.fromJson(Map<String, dynamic> json) => Plant35Zg69Y2H(
        train1O0V1Jqc: json["TRAIN-1-O0V1JQC"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-O0V1JQC": train1O0V1Jqc,
      };
}

class Plant36Rmf1B91 {
  String train1Se4C0Nz;

  Plant36Rmf1B91({
    required this.train1Se4C0Nz,
  });

  factory Plant36Rmf1B91.fromJson(Map<String, dynamic> json) => Plant36Rmf1B91(
        train1Se4C0Nz: json["TRAIN-1-SE4C0NZ"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-SE4C0NZ": train1Se4C0Nz,
      };
}

class Plant379Xt0Zg0 {
  String train1Kjvwy3B;

  Plant379Xt0Zg0({
    required this.train1Kjvwy3B,
  });

  factory Plant379Xt0Zg0.fromJson(Map<String, dynamic> json) => Plant379Xt0Zg0(
        train1Kjvwy3B: json["TRAIN-1-KJVWY3B"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-KJVWY3B": train1Kjvwy3B,
      };
}

class Plant38Oogeev1 {
  String train1Wgyn2Gv;

  Plant38Oogeev1({
    required this.train1Wgyn2Gv,
  });

  factory Plant38Oogeev1.fromJson(Map<String, dynamic> json) => Plant38Oogeev1(
        train1Wgyn2Gv: json["TRAIN-1-WGYN2GV"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-WGYN2GV": train1Wgyn2Gv,
      };
}

class Plant3949Alq33 {
  String train14Ej4Hum;

  Plant3949Alq33({
    required this.train14Ej4Hum,
  });

  factory Plant3949Alq33.fromJson(Map<String, dynamic> json) => Plant3949Alq33(
        train14Ej4Hum: json["TRAIN-1-4EJ4HUM"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-4EJ4HUM": train14Ej4Hum,
      };
}

class Plant40Hzfrb6A {
  String train1X0Udbql;

  Plant40Hzfrb6A({
    required this.train1X0Udbql,
  });

  factory Plant40Hzfrb6A.fromJson(Map<String, dynamic> json) => Plant40Hzfrb6A(
        train1X0Udbql: json["TRAIN-1-X0UDBQL"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-X0UDBQL": train1X0Udbql,
      };
}

class Plant41Ivjeu8 {
  String train1Lx58Zqj;

  Plant41Ivjeu8({
    required this.train1Lx58Zqj,
  });

  factory Plant41Ivjeu8.fromJson(Map<String, dynamic> json) => Plant41Ivjeu8(
        train1Lx58Zqj: json["TRAIN-1-LX58ZQJ"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-LX58ZQJ": train1Lx58Zqj,
      };
}

class Plant522794Qz {
  String train133C5Bvm;

  Plant522794Qz({
    required this.train133C5Bvm,
  });

  factory Plant522794Qz.fromJson(Map<String, dynamic> json) => Plant522794Qz(
        train133C5Bvm: json["TRAIN-1-33C5BVM"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-33C5BVM": train133C5Bvm,
      };
}

class Plant6A830Fjz {
  String? train1164Jies;
  String? train2M5T3Ckb;

  Plant6A830Fjz({
    this.train1164Jies,
    this.train2M5T3Ckb,
  });

  factory Plant6A830Fjz.fromJson(Map<String, dynamic> json) => Plant6A830Fjz(
        train1164Jies: json["TRAIN-1-164JIES"],
        train2M5T3Ckb: json["TRAIN-2-M5T3CKB"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-164JIES": train1164Jies,
        "TRAIN-2-M5T3CKB": train2M5T3Ckb,
      };
}

class Plant79Oinat7 {
  String train16Zj32Wv;

  Plant79Oinat7({
    required this.train16Zj32Wv,
  });

  factory Plant79Oinat7.fromJson(Map<String, dynamic> json) => Plant79Oinat7(
        train16Zj32Wv: json["TRAIN-1-6ZJ32WV"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-6ZJ32WV": train16Zj32Wv,
      };
}

class Plant8Zg13B9Y {
  String train1Tq7N7Ky;

  Plant8Zg13B9Y({
    required this.train1Tq7N7Ky,
  });

  factory Plant8Zg13B9Y.fromJson(Map<String, dynamic> json) => Plant8Zg13B9Y(
        train1Tq7N7Ky: json["TRAIN-1-TQ7N7KY"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-TQ7N7KY": train1Tq7N7Ky,
      };
}

class Plant9Wy5Br96 {
  String train1Oki7Pvs;

  Plant9Wy5Br96({
    required this.train1Oki7Pvs,
  });

  factory Plant9Wy5Br96.fromJson(Map<String, dynamic> json) => Plant9Wy5Br96(
        train1Oki7Pvs: json["TRAIN-1-OKI7PVS"],
      );

  Map<String, dynamic> toJson() => {
        "TRAIN-1-OKI7PVS": train1Oki7Pvs,
      };
}
