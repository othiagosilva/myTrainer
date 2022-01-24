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

### 2. 🏋🏻‍♀️ Treinos (_não desenvolvido ainda_)
Podem ser criados, editados e excluídos.

### 3. 📆 Agendameto (_não desenvolvido ainda_)
Os agendamentos de aula poderão ser realizados via app, assim como o cancelamento e remanejamento.

### 4. ✍️ Feedbacks
Os alunos poderão escrever o feedback dos treinos via app e o treinador pode consultá-los.

### 5. 💰 Financerio
Uma interface onde é possível inserir, editar e excluir sua renda, fornecendo um controle sobre suas finanças.

# 🚀 Para o Futuro - Versão 1.0
- [x] Refatoração de código
- [ ] Implantar a funcionalidade de agendamento.
- [ ] Implantar a funcionalidade de treino.
- [x] Implantar o firebase authentication. 
- [x] Implantar o firebase storage. 
- [ ] Criar as telas para o aluno e implantar as funcionalidades necessárias.
- [ ] Permitir que o aluno tenha os seguintes acessos:
  - Dados -> somente leitura.
  - Treinos -> permitir a visualização.
  - Agendamentos -> criar, remanejar, cancelar e consultar.
  - Feedbacks -> escrever.

# Instalação
1- Clone o repositório na sua máquina
```
git clone https://github.com/othiagosilva/myTrainer.git
```
2- Adicione as depêndecias ao projeto clonado
Firebase
```
flutter pub add cloud_firestore
```
```
flutter pub add firebase_core
```
```
flutter pub add firebase_auth
```
Links Externos
Instalação dependência de ícone: https://pub.dev/packages/flutter_launcher_icons

3- Congifuração Firebase
	3.1. Criar um novo projeto
	-Acesse o <a href="https://firebase.google.com/" target="_blank">site do firebase</a>
	-Logue com sua conta Google e clique em "Ir para o Console"
	-Clique em "Criar um projeto" e insira o nome myTrainer
	-Selecione Default Account for Firebase para o Google Analytics
	
	3.2. Configurar o Firebase para Android
	-Clique no ícone do Android
		-Nome do pacote do Android: com.example.my_trainer
		-Apelido: myTrainer
	-Siga o passo a passo até o fim
	
Pronto! O repositório está totalmente funcional na sua máquina. Bons estudos!

# 🔬 Projeto de Pesquisa
Pode ser encontrado <a href="https://docs.google.com/document/d/1915mZsfG2YaVHcAk_qGksdWsV0G047fH/edit?usp=sharing&ouid=108849066908443544932&rtpof=true&sd=true" target = "_blank">aqui</a>.

# 🔨 Requisitos
Podem ser encontrados <a href="https://docs.google.com/document/d/1FbV-cn-RwkuYXox6_q0WO51pl8v79pJ4A2pT678FHOw/edit?usp=sharing" target = "_blank">aqui</a>.

# 📝 Protótipo
Pode ser encontrado <a href = "https://www.figma.com/file/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=3%3A2" target = "_blank">aqui</a>

As versões do protótipo para testes de usabilidade podem ser encontrada através dos links: 

<a href="https://www.figma.com/proto/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=3%3A2&scaling=scale-down&page-id=0%3A1&starting-point-node-id=3%3A2&show-proto-sidebar=1" target = "_blank">Versão usuário treinador</a> 

<a href="https://www.figma.com/proto/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=3%3A2&scaling=scale-down&page-id=0%3A1&starting-point-node-id=188%3A520&show-proto-sidebar=1" target = "_blank"> Versão usuário aluno</a> 

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

### 2. 🏋🏻‍♀️ Workouts (_not developed yet_)
Can be created, edited and excluded. Also storaged in firebase.

### 3. 📆 Schedule (_not developed yet_)
It will be possible to schedule a class inside the app being possible to edit the date and cancel it.

### 4. ✍️ Feedbacks 
Clients can write feedbacks of the classes or workouts in the app.

### 5. 💰 Finnance
A interface where you can add, edit and exclude your gains. A simple tool to help with your finnances.

# 🚀 Next steps - Release 1.0
- [x] Code Refactoring
- [ ] Implement schedule function.
- [ ] Implement workout function.
- [x] Implement firebase auth.
- [x] Implement firebase storage.
- [ ] Create client user interfaces and it's functions.
- [ ] Permissions for the client user:
  - Data -> ready only.
  - Workouts -> ready only.
  - Schedule -> create, read, edit and delete.
  - Feedbacks -> write.

# Installation
1- Repository clone
```
git clone https://github.com/othiagosilva/myTrainer.git
```
2- Add dependences
Firebase
```
flutter pub add cloud_firestore
```
```
flutter pub add firebase_core
```
```
flutter pub add firebase_auth
```
Links Externals
Icon package installation tutorial: https://pub.dev/packages/flutter_launcher_icons

3- Firebase config
	3.1. Create a new project
	-Acess  <a href="https://firebase.google.com/" target="_blank">firebase site</a>
	-Login with your Google account and click "Go to console"
	-Click "Create new project" and name it myTrainer
	-Select Default Account for Firebase (if asked)
	
	3.2. Configuring Firebase for Android
	-Press the android icon
		-Package name: com.example.my_trainer
		-Nickname: myTrainer
	-Follow the instructions
	
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

<a href="https://www.figma.com/proto/NwJ7I1jIrlLVtXGwbJpw9v/myTrainer?node-id=3%3A2&scaling=scale-down&page-id=0%3A1&starting-point-node-id=188%3A520&show-proto-sidebar=1" target = "_blank">Client</a> 
