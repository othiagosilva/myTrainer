class Aluno {
  var cod;
  var nome;
  var idade;
  var peso;
  var altura;
  var cintura;
  var quadril;
  var perimetroAbdomen;
  var dobraSubEscapular;
  var dobraTricipital;
  var dobraPeitoral;
  var dobraAxilarMedio;
  var dobraSupraIliaca;
  var dobraAbdomen;
  var dobraCoxa;
  var perimetroTorax;
  var perimetroBracoRel;
  var perimetroBracoCon;
  var perimetroAntebraco;
  var perimetroCintura;
  var perimetroQuadril;
  var perimetroCoxas;
  var perimetroPanturrilha;
  var limitacoes;
  var genero;
  var imc;

  Aluno(
      cod,
      nome,
      idade,
      peso,
      altura,
      cintura,
      quadril,
      perimetroAbdomen,
      dobraSubEscapular,
      dobraTricipital,
      dobraPeitoral,
      dobraAxilarMedio,
      dobraSupraIliaca,
      dobraAbdomen,
      dobraCoxa,
      perimetroTorax,
      perimetroBracoRel,
      perimetroBracoCon,
      perimetroAntebraco,
      perimetroCintura,
      perimetroQuadril,
      perimetroCoxas,
      perimetroPanturrilha,
      limitacoes,
      genero) {
    this.cod = cod;
    this.nome = nome;
    this.idade = idade;
    this.peso = peso;
    this.altura = altura;
    this.cintura = cintura;
    this.quadril = quadril;
    this.perimetroAbdomen = perimetroAbdomen;
    this.dobraSubEscapular = dobraSubEscapular;
    this.dobraTricipital = dobraTricipital;
    this.dobraPeitoral = dobraPeitoral;
    this.dobraAxilarMedio = dobraAxilarMedio;
    this.dobraSupraIliaca = dobraSupraIliaca;
    this.dobraAbdomen = dobraAbdomen;
    this.dobraCoxa = dobraCoxa;
    this.perimetroTorax = perimetroTorax;
    this.perimetroBracoRel = perimetroBracoRel;
    this.perimetroBracoCon = perimetroBracoCon;
    this.perimetroAntebraco = perimetroAntebraco;
    this.perimetroCintura = perimetroCintura;
    this.perimetroQuadril = perimetroQuadril;
    this.perimetroCoxas = perimetroCoxas;
    this.perimetroPanturrilha = perimetroPanturrilha;
    this.limitacoes = limitacoes;
    this.genero = genero;
  }

  setAltura(altura) {
    this.altura = altura;
  }
}
