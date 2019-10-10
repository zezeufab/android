import 'package:flutter/material.dart';
import 'package:efcontrole/Menu/Menu.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      home: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página principal', style: TextStyle(color: Colors.white)),
        iconTheme: new IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      ),
      drawer: new Drawer(
        child: Menu(),
      ),
      body: _principal(context),
    );
  }

  //Formulario principal
  _principal(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 9;
    return Container(
      //color: Colors.black87,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: width, height: height, child: _rowPrimeiro()),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: width,
                      height: height,
                      child: _rowSegundo(context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: width,
                      height: height,
                      child: _rowTeceira(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width,
                height: 200,
                child: ApresentaValores().MontaContainerValores(100, 100, 100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _rowPrimeiro() {
    return Row(
      children: <Widget>[
        Flexible(
          child: _receita(),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: _despesa(),
        )
      ],
    );
  }

  _rowSegundo(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: _listar(),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: _grafico(context),
        )
      ],
    );
  }

  _rowTeceira() {
    return Row(
      children: <Widget>[
        Flexible(
          child: _contas(),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: _opcao(),
        )
      ],
    );
  }

  _receita() {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          color: Color.fromRGBO(80, 80, 80, 1),
          child: Image.asset('images/receitas.png'),
          onPressed: () {},
        ),
      ),
    );
  }

  _despesa() {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          color: Color.fromRGBO(80, 80, 80, 1),
          child: Image.asset('images/despesas.png'),
          onPressed: () {},
        ),
      ),
    );
  }

  _listar() {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          color: Color.fromRGBO(80, 80, 80, 1),
          child: Image.asset('images/listar.png'),
          onPressed: () {},
        ),
      ),
    );
  }

  _grafico(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          color: Color.fromRGBO(80, 80, 80, 1),
          child: Image.asset('images/graficos.png'),
          onPressed: () {
            // Navigator.push(
            //    context,
            //    MaterialPageRoute(
            //       builder: (context) =>
            //          new GraficoReceitas())); //PieChartSample2()));
          },
        ),
      ),
    );
  }

  _contas() {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          color: Color.fromRGBO(80, 80, 80, 1),
          child: Image.asset('images/contas.png'),
          onPressed: () {},
        ),
      ),
    );
  }

  _opcao() {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          color: Color.fromRGBO(80, 80, 80, 1),
          child: Image.asset('images/opcao.png'),
          onPressed: () {},
        ),
      ),
    );
  }
}

class ApresentaValores {
  MontaContainerValores(
      double pValorReceita, double pValorDespesa, double pSaldoConta) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(80, 80, 80, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Flexible(child: _rowReceitas()),
          Flexible(child: _rowDespesas()),
          Flexible(child: _rowSadoContas()),
          Container(
            height: 4,
            color: Color.fromRGBO(153, 153, 102, 1),
          ),
          Flexible(child: _rowTotalizador()),
        ],
      ),
    );
  }

  _rowReceitas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Receitas',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        Text(
          '0,00',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
        )
      ],
    );
  }

  _rowDespesas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Despesas',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        Text(
          '0,00',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
        )
      ],
    );
  }

  _rowSadoContas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Contas',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(
          '0,00',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        )
      ],
    );
  }

  _rowTotalizador() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          'Total',
          style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[100]),
        ),
        Text(
          '0,00',
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple[100],
          ),
        )
      ],
    );
  }
}
