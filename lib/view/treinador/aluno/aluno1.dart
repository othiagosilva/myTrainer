import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_botaoExclusao.dart';
import 'package:my_trainer/widgets/widget_iconButton.dart';

class AlunoA extends StatelessWidget {
  const AlunoA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 235,
                    child: Text(
                      'Nome',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Text(
                    'Cód',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Thiago Alves Silva',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '01',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  WidgetIconButton(
                    Icons.edit,
                    proxPag: 'alterar_excluir',
                  ),
                  WidgetIconButton(
                    Icons.search,
                    proxPag: 'consultar_dados',
                  ),
                  WidgetBotaoExclusao('Deseja realmente excluir o aluno?'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
