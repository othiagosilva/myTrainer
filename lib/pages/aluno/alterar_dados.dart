// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:my_trainer/components/show_message.dart';
// import 'package:my_trainer/components/text_field.dart';
// import 'package:my_trainer/components/logout.dart';
// import 'package:my_trainer/components/my_buttons.dart';

// class AlterarExcluir extends StatefulWidget {
//   const AlterarExcluir({Key? key}) : super(key: key);

//   @override
//   _AlterarExcluirState createState() => _AlterarExcluirState();
// }

// class _AlterarExcluirState extends State<AlterarExcluir> {
//   late CollectionReference alunos;

//   @override
//   void initState() {
//     super.initState();
//     alunos = FirebaseFirestore.instance.collection('alunos');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'ALTERAR',
//           style: Theme.of(context).textTheme.headline1,
//         ),
//         backgroundColor: Theme.of(context).backgroundColor,
//         centerTitle: true,
//         iconTheme: IconThemeData(
//           color: Theme.of(context).primaryColor,
//         ),
//         actions: [
//           WidgetLogout(),
//         ],
//       ),
//       backgroundColor: Theme.of(context).backgroundColor,
//       body: ListView(
//         children: [
//           Container(
//             padding: EdgeInsets.all(10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 WidgetTextField('Nome', aluno.nome),
//                 linha3Campos(
//                   100.0,
//                   'Idade',
//                   aluno.idade,
//                   100.0,
//                   'Peso',
//                   aluno.peso,
//                   100.0,
//                   'Altura',
//                   aluno.altura,
//                 ),
//                 linha2Campos(100.0, 'Cintura', aluno.cintura, 100.0, 'Quadril',
//                     aluno.quadril),
//                 Container(
//                   margin: EdgeInsets.all(40.0),
//                   child: Text('DOBRAS CUTÂNEAS',
//                       style: Theme.of(context).textTheme.headline2),
//                 ),
//                 linha3Campos(
//                   135.0,
//                   'SubEscapular',
//                   aluno.dobraSubEscapular,
//                   135.0,
//                   'Tricipital',
//                   aluno.dobraTricipital,
//                   135.0,
//                   'Peitoral',
//                   aluno.dobraPeitoral,
//                 ),
//                 linha3Campos(
//                   135.0,
//                   'Axilar Médio',
//                   aluno.dobraAxilarMedio,
//                   135.0,
//                   'Supra Ilíaca',
//                   aluno.dobraSupraIliaca,
//                   135.0,
//                   'Abdômen',
//                   aluno.dobraAbdomen,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     campo(135.0, 'Coxa', aluno.dobraCoxa),
//                   ],
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(40.0),
//                   child: Text('PERIMETRIA',
//                       style: Theme.of(context).textTheme.headline2),
//                 ),
//                 linha3Campos(
//                   120.0,
//                   'Tórax',
//                   aluno.perimetroTorax,
//                   120.0,
//                   'Braço Rel',
//                   aluno.perimetroBracoRel,
//                   120.0,
//                   'Braço Con',
//                   aluno.perimetroBracoCon,
//                 ),
//                 linha3Campos(
//                   120.0,
//                   'Antrebraços',
//                   aluno.perimetroAntebraco,
//                   120.0,
//                   'Abdômen',
//                   aluno.perimetroAbdomen,
//                   120.0,
//                   'Cintura',
//                   aluno.perimetroCintura,
//                 ),
//                 linha3Campos(
//                   120.0,
//                   'Quadril',
//                   aluno.perimetroQuadril,
//                   120.0,
//                   'Coxas',
//                   aluno.perimetroCoxas,
//                   120.0,
//                   'Panturrilhas',
//                   aluno.perimetroPanturrilha,
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(40),
//                   child: WidgetTextField('Limitações', aluno.limitacoes),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     botaoConfirmar(aluno),
//                     cancelButton(context),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   botaoConfirmar(aluno) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: ElevatedButton(
//         child: buttonLabel('Confirmar'),
//         style: confirmButtonStyle(context),
//         onPressed: () {
//           FirebaseFirestore.instance.collection('alunos').doc(aluno.nome).set({
//             "codAluno": aluno.cod,
//             "nome": aluno.nome,
//             "idade": aluno.idade,
//             "peso": aluno.peso,
//             "altura": aluno.altura,
//             "cintura": aluno.cintura,
//             "quadril": aluno.quadril,
//             "perimetroAbdomen": aluno.perimetroAbdomen,
//             "dobraSubEscapular": aluno.dobraSubEscapular,
//             "dobraTricipi tal": aluno.dobraTricipital,
//             "dobraPeitoral": aluno.dobraPeitoral,
//             "dobraAxilarMedio": aluno.dobraAxilarMedio,
//             "dobraSupraIliaca": aluno.dobraSupraIliaca,
//             "dobraAbdomen": aluno.dobraAbdomen,
//             "dobraCoxa": aluno.dobraCoxa,
//             "perimetroTorax": aluno.perimetroTorax,
//             "perimetroBracoRel": aluno.perimetroBracoRel,
//             "perimetroBracoCon": aluno.perimetroBracoCon,
//             "perimetroAntebraco": aluno.perimetroAntebraco,
//             "perimetroCintura": aluno.perimetroCintura,
//             "perimetroQuadril": aluno.perimetroQuadril,
//             "perimetroCoxas": aluno.perimetroCoxas,
//             "perimetroPanturrilha": aluno.perimetroPanturrilha,
//             "limitacoes": aluno.limitacoes,
//             "genero": aluno.genero
//           });
//           Navigator.pop(context);
//           showMessage('Dados Alterados', context);
//         },
//       ),
//     );
//   }

//   campo(tamanho, rotulo, variavel) {
//     return Container(
//         width: tamanho,
//         child: TextField(
//           enabled: false,
//           decoration: InputDecoration(
//             labelText: 'Nome',
//             labelStyle: TextStyle(color: Theme.of(context).primaryColor),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Theme.of(context).primaryColor),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               borderSide: BorderSide(
//                 color: Theme.of(context).primaryColor,
//                 width: 1.5,
//               ),
//             ),
//             fillColor: Colors.white,
//             filled: true,
//             contentPadding:
//                 EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
//           ),
//         ));
//   }

//   linha3Campos(tamanho, rotulo, variavel, tamanho1, rotulo1, variavel1,
//       tamanho2, rotulo2, variavel2) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           campo(tamanho, rotulo, variavel),
//           campo(tamanho1, rotulo1, variavel1),
//           campo(tamanho2, rotulo2, variavel2),
//         ],
//       ),
//     );
//   }

//   linha2Campos(tamanho, rotulo, variavel, tamanho1, rotulo1, variavel1) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         campo(tamanho, rotulo, variavel),
//         campo(tamanho1, rotulo1, variavel1),
//       ],
//     );
//   }
// }
