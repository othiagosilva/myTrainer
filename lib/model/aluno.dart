class Aluno {
  static int _cod = 0;
  String _nome = '';
  int _idade = 0;
  double _peso = 0.0;
  double _altura = 0.0;
  double? _cintura;
  double? _quadril;
  double? _perimetroAbdomen;
  double? _dobraSubEscapular;
  double? _dobraTricipital;
  double? _dobraPeitoral;
  double? _dobraAxilarMedio;
  double? _dobraSupraIliaca;
  double? _dobraAbdomen;
  double? _dobraCoxa;
  double? _perimetroTorax;
  double? _perimetroBracoRel;
  double? _perimetroBracoCon;
  double? _perimetroAntebraco;
  double? _perimetroCintura;
  double? _perimetroQuadril;
  double? _perimetroCoxas;
  double? _perimetroPanturrilha;
  String? _limitacoes;
  String _genero = '';
  double? _imc;

  Aluno(
    int cod,
    String nome,
    int idade,
    double peso,
    double altura,
    double cintura,
    double quadril,
    double perimetroAbdomen,
    double dobraSubEscapular,
    double dobraTricipital,
    double dobraPeitoral,
    double dobraAxilarMedio,
    double dobraSupraIliaca,
    double dobraAbdomen,
    double dobraCoxa,
    double perimetroTorax,
    double perimetroBracoRel,
    double perimetroBracoCon,
    double perimetroAntebraco,
    double perimetroCintura,
    double perimetroQuadril,
    double perimetroCoxas,
    double perimetroPanturrilha,
    String limitacoes,
    String genero,
  ) {
    Aluno._cod++;
    this.nome(nome);
    this.idade(idade);
    this.peso(peso);
    this.altura(altura);
    this.cintura(cintura);
    this.quadril(quadril);
    this.perimetroAbdomen(perimetroAbdomen);
    this.dobraSubEscapular(dobraSubEscapular);
    this.dobraTricipital(dobraTricipital);
    this.dobraPeitoral(dobraPeitoral);
    this.dobraAxilarMedio(dobraAxilarMedio);
    this.dobraSupraIliaca(dobraSupraIliaca);
    this.dobraAbdomen(dobraAbdomen);
    this.dobraCoxa(dobraCoxa);
    this.perimetroTorax(perimetroTorax);
    this.perimetroBracoRel(perimetroBracoRel);
    this.perimetroBracoCon(perimetroBracoCon);
    this.perimetroAntebraco(perimetroAntebraco);
    this.perimetroCintura(perimetroCintura);
    this.perimetroQuadril(perimetroQuadril);
    this.perimetroCoxas(perimetroCoxas);
    this.perimetroPanturrilha(perimetroPanturrilha);
    this.limitacoes(limitacoes);
    this.genero(genero);
  }

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
