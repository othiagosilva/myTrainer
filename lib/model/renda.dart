class Renda {
  String _nome = '';
  double _valor = 0.0;

  Renda(nome, valor) {
    this.nome(nome);
    this.valor(valor);
  }

  get nome => this._nome;
  set nome(nome) => this._nome = nome;

  get valor => this._valor;
  set valor(valor) => this._valor = valor;
}
