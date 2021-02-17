
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController totalpessoa = TextEditingController();
  TextEditingController totaldinheiro = TextEditingController();
  TextEditingController totalgra = TextEditingController();
  String f = '';
  int res =0;
  calcular(){
    var grupo =int.parse(totalpessoa.text) ;
    var dinheiro =double.parse(totaldinheiro.text) ;
    var garco =int.parse(totalgra.text) ;
    double gorjeta = dinheiro*(garco/100);
    double valortotal = dinheiro/grupo + gorjeta;
    setState(() {
      f = valortotal.toString();
      res =1;
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('dividir a conta'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/conta.jpg', 
                width: size.width*0.5,
                height: size.height*0.2, ),
                )
              ],
            ),
           Container(
             color: Colors.blue,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
             width: double.infinity,
             child: Text('Rachar a Conta', textAlign: TextAlign.center,
             style: TextStyle(
              color: Colors.white,
              fontSize: size.height*0.01
             )
             ,),
           ),
           Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),

           //valor da conta
          Container(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child:   TextField(
              controller: totaldinheiro,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                color: Colors.lightBlueAccent, width: 2
                )),
                border: OutlineInputBorder(borderRadius:
                BorderRadius.circular(10)),
                labelText: 'valor da conta',
                labelStyle: TextStyle(
                  color: Colors.black
                )
              ),
            ),
          ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
            //total pessoas
          Container(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child:   TextField(
              controller: totalpessoa,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                color: Colors.lightBlueAccent, width: 2
                )),
                border: OutlineInputBorder(borderRadius: 
                BorderRadius.circular(10),
                ),
                labelText: 'total de pessoas',
                  labelStyle: TextStyle(
                  color: Colors.black
                )
              ),
            ),
          ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
            // % do garçon
           Container(
             padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
             child:  TextField(
              controller: totalgra,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                color: Colors.lightBlueAccent, width: 2
                )),
                border: OutlineInputBorder(borderRadius: 
                BorderRadius.circular(10)),
                labelText: '% do garçon',
                  labelStyle: TextStyle(
                  color: Colors.black
                )
              ),
            ),
           ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),

            //calcular
            Container(
            width: double.infinity,
            child: RaisedButton(
            elevation: 10,
            color: Colors.red[200],
            onPressed: calcular, 
            child: Text('calcular',
            style: TextStyle(color: Colors.white, 
            fontSize: size.height * 0.02),
            )
            ,),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0)),
            //resultado
            Container(
              color: res==0? Colors.white : Colors.green,
              
              width: double.infinity,
              child: res==0 ? Text(''):
              Text('o valor ficou: ${f} para cada pessoa', 
              textAlign: TextAlign.center,)
              )
             
          ],
        ),
      ),
    );

  }
}