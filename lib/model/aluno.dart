class Aluno {
  String _nome = '';
  String _idade = '';
  String _peso = '';
  String _altura = '';
  String? _cintura;
  String? _quadril;
  String? _perimetroAbdomen;
  String? _dobraSubEscapular;
  String? _dobraTricipital;
  String? _dobraPeitoral;
  String? _dobraAxilarMedio;
  String? _dobraSupraIliaca;
  String? _dobraAbdomen;
  String? _dobraCoxa;
  String? _perimetroTorax;
  String? _perimetroBracoRel;
  String? _perimetroBracoCon;
  String? _perimetroAntebraco;
  String? _perimetroCintura;
  String? _perimetroQuadril;
  String? _perimetroCoxas;
  String? _perimetroPanturrilha;
  String? _limitacoes;
  String _genero = '';
  String _imc = '';

  Aluno(
    String nome,
    String idade,
    String peso,
    String altura,
    String cintura,
    String quadril,
    String perimetroAbdomen,
    String dobraSubEscapular,
    String dobraTricipital,
    String dobraPeitoral,
    String dobraAxilarMedio,
    String dobraSupraIliaca,
    String dobraAbdomen,
    String dobraCoxa,
    String perimetroTorax,
    String perimetroBracoRel,
    String perimetroBracoCon,
    String perimetroAntebraco,
    String perimetroCintura,
    String perimetroQuadril,
    String perimetroCoxas,
    String perimetroPanturrilha,
    String limitacoes,
    String genero,
  );

  get nome => this._nome;
  set nome(nome) => this._nome = nome;

  get idade => this._idade;
  set idade(idade) => this._idade = idade;

  get peso => this._peso;
  set peso(peso) => this._peso = peso;

  get altura => this._altura;
  set altura(altura) => this._altura = altura;

  get cintura => this._cintura;
  set cintura(cintura) => this._cintura = cintura;

  get quadril => this._quadril;
  set quadril(quadril) => this._quadril = quadril;

  get perimetroAbdomen => this._perimetroAbdomen;
  set perimetroAbdomen(perimetroAbdomen) =>
      this._perimetroAbdomen = perimetroAbdomen;

  get dobraSubEscapular => this._dobraSubEscapular;
  set dobraSubEscapular(dobraSubEscapular) =>
      this._dobraSubEscapular = dobraSubEscapular;

  get dobraTricipital => this._dobraTricipital;
  set dobraTricipital(dobraTricipital) =>
      this._dobraTricipital = dobraTricipital;

  get dobraPeitoral => this._dobraPeitoral;
  set dobraPeitoral(dobraPeitoral) => this._dobraPeitoral = dobraPeitoral;

  get dobraAxilarMedio => this._dobraAxilarMedio;
  set dobraAxilarMedio(dobraAxilarMedio) =>
      this._dobraAxilarMedio = dobraAxilarMedio;

  get dobraSupraIliaca => this._dobraSupraIliaca;
  set dobraSupraIliaca(dobraSupraIliaca) =>
      this._dobraSupraIliaca = dobraSupraIliaca;

  get dobraAbdomen => this._dobraAbdomen;
  set dobraAbdomen(dobraAbdomen) => this._dobraAbdomen = dobraAbdomen;

  get dobraCoxa => this._dobraCoxa;
  set dobraCoxa(dobraCoxa) => this._dobraCoxa = dobraCoxa;

  get perimetroTorax => this._perimetroTorax;
  set perimetroTorax(perimetroTorax) => this._perimetroTorax = perimetroTorax;

  get perimetroBracoRel => this._perimetroBracoRel;
  set perimetroBracoRel(perimetroBracoRel) =>
      this._perimetroBracoRel = perimetroBracoRel;

  get perimetroBracoCon => this._perimetroBracoCon;
  set perimetroBracoCon(perimetroBracoCon) =>
      this._perimetroBracoCon = perimetroBracoCon;

  get perimetroAntebraco => this._perimetroAntebraco;
  set perimetroAntebraco(perimetroAntebraco) =>
      this._perimetroAntebraco = perimetroAntebraco;

  get perimetroCintura => this._perimetroCintura;
  set perimetroCintura(perimetroCintura) =>
      this._perimetroCintura = perimetroCintura;

  get perimetroQuadril => this._perimetroQuadril;
  set perimetroQuadril(value) => this._perimetroQuadril = value;

  get perimetroCoxas => this._perimetroCoxas;
  set perimetroCoxas(perimetroCoxas) => this._perimetroCoxas = perimetroCoxas;

  get perimetroPanturrilha => this._perimetroPanturrilha;
  set perimetroPanturrilha(perimetroPanturrilha) =>
      this._perimetroPanturrilha = perimetroPanturrilha;

  get limitacoes => this._limitacoes;
  set limitacoes(limitacoes) => this._limitacoes = limitacoes;

  get genero => this._genero;
  set genero(genero) => this._genero = genero;

  get imc => this._imc;
  setImc() {
    return this._imc = this.peso / (this.altura * this.altura);
  }
}
