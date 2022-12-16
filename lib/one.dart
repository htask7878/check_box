import 'package:check_box/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class one extends StatefulWidget {
  const one({Key? key}) : super(key: key); //38601203269

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  // bool c = false;

  // bool c1 = false;
  bool c2 = false;
  String s = "";
  int a = 0,sum = 0;
  StringBuffer sb = StringBuffer();

  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: statusbar),
              color: Colors.amber,
              alignment: Alignment.center,
              height: 40,
              width: double.infinity,
              child: Text(
                "Hotel Menu",
                style: GoogleFonts.aleo(fontSize: 25),
              )),
          Container(
              color: Colors.black45,
              height: 40,
              width: double.infinity,
            child: Text("Total = $sum",style: GoogleFonts.aBeeZee(fontSize: 20)),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                  itemCount: model.Item.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                        header: Text("${model.Item[index]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            backgroundColor: Colors.white,
                            fontSize: 17,
                            color: Colors.black45)),
                        child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("${model.foodimage[index]}"),
                              fit: BoxFit.fill),

                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: CheckboxListTile(
                          activeColor: Colors.blue,
                          checkColor: Colors.red,
                          title: Text("MRP=${model.mrp[index]}",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  backgroundColor: Colors.white,
                                  fontSize: 10,
                                  color: Colors.red)),

                          onChanged: (value) {
                            setState(() {
                              model.c1[index] = value!;
                              if(model.c1[index]==true)
                                {
                                  sb.clear();
                                  sb.write("${model.mrp[index]}");
                                  s= sb.toString();
                                  a =int.parse(s);
                                  sum= sum+a;
                                }else
                              if(model.c1[index]==false)
                                {
                                  sum=sum-a;
                                  sb.clear();
                                }
                            });
                          },
                          value: model.c1[index]),
                    ));
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2)),
            ),
          ),
        ],
      ),
    );
  }
}
/*
CheckboxListTile(
                subtitle: Text("MRP = 450"),
                checkColor: Colors.purpleAccent,
                title: Text("Leptop"),
                onChanged: (value) {
                  setState(() {
                    sb.clear();
                    c = value!;
                    if(c==true)
                    {
                      sb.write("450");
                      s=sb.toString();
                      a=int.parse(s);
                      sum=sum+a;
                    }
                    if(c==false)
                      {
                        sum=sum-a;
                        sb.clear();
                      }
                  });
                },
                value: c),
            CheckboxListTile(
                subtitle: Text("MRP = 350"),
                checkColor: Colors.purpleAccent,
                title: Text("LCD"),
                onChanged: (value) {
                  setState(() {
                    sb.clear();
                    c1 = value!;
                    if(c1==true)
                    {
                      sb.write("350");
                      s=sb.toString();
                      b=int.parse(s);
                      sum=sum+b;
                    }
                    if(c1==false)
                    {
                      sum=sum-b;
                      sb.clear();
                    }
                  });
                },
                value: c1),
            CheckboxListTile(
                subtitle: Text("MRP = 400"),
                checkColor: Colors.purpleAccent,
                title: Text("Computer"),
                onChanged: (value) {
                  setState(() {
                    sb.clear();
                    c2 = value!;
                    if(c2==true)
                    {
                      sb.write("400");
                      s=sb.toString();
                      d=int.parse(s);
                      sum=sum+d;
                    }
                    if(c2==false)
                    {
                      sum=sum-d;
                      sb.clear();
                    }
                  });
                },
                value: c2),
            Container(
                color: Colors.amber,
                height: 200,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text("Total = ${sum}",
                    style: TextStyle(fontSize: 25, color: Colors.blue))),
*/
