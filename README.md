![](https://user-images.githubusercontent.com/66854577/141378066-27ddf4f7-76e7-4375-ae00-64c7666ce4a7.png) <br>
![](http://img.shields.io/static/v1?label=STATUS&message=IN%20PROGRESS&color=GREEN&style=for-the-badge)

# Languages
Brazilian Portuguese (main). <br>
[English](#English-version).

<h1 align="center"> myTrainer </h1>
<p align="center"> Para treinadores, personal trainers e atletas</p>

### PS
Antes de ler sobre a solução que o produto oferece, você deve saber que esse aplicativo é meu TCC e atualmente se encontra em desenvolvimento e todos os códigos aqui presentes só podem ser utilizados para fins de estudos.

# 🎯 Funcionalidades

O app simplifica o trabalho do profissional de educação físcia. Como? Vou te mostrar.

Todas as telas foram pensadas para serem simples e intuitivas. E da mesma forma as funcionalidades, sendo elas:

### 1. 💾 Dados do aluno
Serão armazenados e mostrados de forma simples e intuitiva para você. Chega de planilhas lotadas e desorganizadas.

### 2. 🏋🏻‍♀️ Treinos
Podem ser criados, editados e excluídos.

### 3. 📆 Agendameto
Os agendamentos de aula poderão ser realizados via app, assim como o cancelamento e remanejamento.

### 4. ✍️ Feedbacks
Os alunos poderão escrever o feedback dos treinos via app e o treinador pode consultá-los.

### 5. 💰 Financerio
Uma interface onde é possível inserir, editar e excluir sua renda, fornecendo um controle sobre suas finanças.

# 🚀 Para o Futuro - Versão 1.0
- [ ] CRUD Agendamento
- [ ] CRUD Treino
- [ ] Responsividade da UI
- [ ] CRUD Feedback
- [ ] Dados (aluno)
- [ ] Treino (aluno)
- [ ] Agendamento (aluno)
- [ ] Feedback (aluno)

# ✔️ Concluido - Versão 1.0
- [x] Implantar Firebase Authentication
- [x] Implantar Firebase Cloud Firestore
- [x] CRUD de Aluno
- [x] CRUD de Renda
- [x] Tela de Cadastro
- [x] Tela Sobre
- [x] Funcionalidade esqueci minha senha
- [x] Retornar nome de usuário e permissão (aluno/treinador) 
- [x] Adequar tela inicial de acordo com a permissão

# Instalação
1- Clone o repositório na sua máquina
```
git clone https://github.com/othiagosilva/myTrainer.git
```

2- Congifuração Firebase <br><br>
	2.1. Criar um novo projeto <br>
	-Acesse o <a href="https://firebase.google.com/" target="_blank">site do firebase</a> <br>
	-Logue com sua conta Google e clique em "Ir para o Console"<br>
	-Clique em "Criar um projeto" e insira o nome myTrainer<br>
	-Selecione Default Account for Firebase para o Google Analytics <br><br>
	2.2. Configurar o Firebase para Android<br>
	-Clique no ícone do Android <br>
	```
		-Nome do pacote do Android: com.example.my_trainer
	```
	<br>
	```
		-Apelido: myTrainer
	```
	<br>
	-Siga o passo a passo até o fim <br>
	
Pronto! O repositório está totalmente funcional na sua máquina. Bons estudos!

# 🔬 Projeto de Pesquisa
Pode ser encontrado <a href="https://docs.google.com/document/d/1915mZsfG2YaVHcAk_qGksdWsV0G047fH/edit?usp=sharing&ouid=108849066908443544932&rtpof=true&sd=true" target = "_blank">aqui</a>.

# 🔨 Requisitos
Podem ser encontrados <a href="https://docs.google.com/document/d/1FbV-cn-RwkuYXox6_q0WO51pl8v79pJ4A2pT678FHOw/edit?usp=sharing" target = "_blank">aqui</a>.

# 📝 Protótipo
Pode ser encontrado <a href = "https://www.figma.com/file/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=3%3A2" target = "_blank">aqui</a>

As versões do protótipo para testes de usabilidade podem ser encontrada através dos links: 

<a href="https://www.figma.com/proto/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=3%3A2&scaling=scale-down&page-id=0%3A1&starting-point-node-id=3%3A2&show-proto-sidebar=1" target = "_blank">Versão usuário treinador</a> 

<a href="https://www.figma.com/proto/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=188%3A520&scaling=scale-down&page-id=0%3A1&starting-point-node-id=188%3A520&show-proto-sidebar=1" target = "_blank"> Versão usuário aluno</a> 

<a id="English-version"></a>
# English
<h1 align="center"> myTrainer </h1>
<p align="center"> For trainers, coachs and athletes </p>

### PS
Before reading about the app you should now that it is my university final paper. It's still in development and all code here are to be used for study only.

# 🎯 Functions

This app simplify the work rotine of a trainer or coach. How? Let me show you

All interfaces was created with the intention of beeing simple and easy to understand. The functions the app provides are:

### 1. 💾 Clients data storage
The data of your clients will be storaged in firebase. The user can create, edit and delete it whenever he wants. No more datasheets with a lot of information to search for.

### 2. 🏋🏻‍♀️ Workouts
Can be created, edited and excluded. Also storaged in firebase.

### 3. 📆 Schedule
It will be possible to schedule a class inside the app being possible to edit the date and cancel it.

### 4. ✍️ Feedbacks 
Clients can write feedbacks of the classes or workouts in the app.

### 5. 💰 Finnance
A interface where you can add, edit and exclude your gains. A simple tool to help with your finnances.

# 🚀 Next steps - Release 1.0
- [ ] Schedule CRUD
- [ ] Workout CRUD
- [ ] UI Responsivity
- [ ] Feedback CRUD
- [ ] Data (athlete)
- [ ] Workout (athlete)
- [ ] Schedule (athlete)
- [ ] Feedback (athlete)

# ✔️ Completed - Release 1.0
- [x] Add Firebase Authentication
- [x] Add Firebase Cloud Firestore
- [x] Athlete CRUD 
- [x] Finnance CRUD
- [x] Register functionality
- [x] About Interface
- [x] Reset Password functionality
- [x] Username + Permission identification in home (athlete/trainer) 
- [x] Home matching permission

# Installation
1- Repository clone
```
git clone https://github.com/othiagosilva/myTrainer.git
```

2- Firebase config <br><br>
	2.1. Create a new project <br>
	- Acess  <a href="https://firebase.google.com/" target="_blank">firebase site</a><br>
	- Login with your Google account and click "Go to console" <br>
	- Click "Create new project" and name it myTrainer <br>
	- Select Default Account for Firebase (if asked) <br><br>
	2.2. Configuring Firebase for Android <br>
	- Press the android icon <br>
	```
	  Package name: com.example.my_trainer
	```
	<br>
	```
	  Nickname: myTrainer
	```
	  <br>
	- Follow the instructions <br>
	
Ready to go! You must have a functional copy in your computer.

# 🔗 Links 
Theese links will guide to some documents required for the project. They're all in brazilian portuguese and I don't intend to translate it so in quick words:

* 1st have the "why" I started this app, the problem it solve, researchs that support mine and the final app delivered in 12/2021.
* 2nd is the functions I decided to code, and UML diagrams (class & bussiness use case).
* 3rd is the prototype of this app. 
* 4th is the trainer vision prototype.
* 5th is the client vision prototype

You can click in the links to see it if you want.

# 🔬 Research
<a href="https://docs.google.com/document/d/1915mZsfG2YaVHcAk_qGksdWsV0G047fH/edit?usp=sharing&ouid=108849066908443544932&rtpof=true&sd=true" target = "_blank">Here</a>

# 🔨 Requirements
<a href="https://docs.google.com/document/d/1FbV-cn-RwkuYXox6_q0WO51pl8v79pJ4A2pT678FHOw/edit?usp=sharing" target = "_blank">Here</a>

# 📝 Prototype
<a href = "https://www.figma.com/file/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=3%3A2" target = "_blank">Here</a>

The client and trainer version can be found in:

<a href="https://www.figma.com/proto/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=3%3A2&scaling=scale-down&page-id=0%3A1&starting-point-node-id=3%3A2&show-proto-sidebar=1" target = "_blank">Trainer</a> 

<a href="https://www.figma.com/proto/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=188%3A520&scaling=scale-down&page-id=0%3A1&starting-point-node-id=188%3A520&show-proto-sidebar=1" target = "_blank">Client</a> 
