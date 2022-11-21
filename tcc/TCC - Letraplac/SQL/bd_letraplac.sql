create DATABASE Bd_Letraplac;
Use Bd_Letraplac;

CREATE table Tb_Usuario (
	ID_Usuario int not null primary key AUTO_INCREMENT,
	Nome_Usuario varchar(30) not null,
	CPF_Usuario varchar(11) not null,
	Data_Nas_Usuario date not null,
	Email_Usuario varchar(50) not null,
	Senha_Usuario varchar(50) not null,
	Tipo_Usuario ENUM("A","C"), 
	Rua_Usuario varchar(50) not null,
  	Nmr_Usuario int not null,
  	Complemento varchar(20),
  	Bairro_Usuario varchar(50) not null,
  	Cidade_Usuario varchar(50) not null,
	UF_Usuario varchar(2) not null
)DEFAULT charset = utf8;

Create table Tb_Produto(
  ID_Produto int not null primary key AUTO_INCREMENT,
	Nome_Produto varchar(30) not null,
	Cod_Produto int not null,
	Tipo_Produto varchar(30) not null,
	Tam_Produto varchar(10) not null,
	Val_Uni_Produto decimal(3,2) not null, 
	Img_Produto varchar(30) not null
)DEFAULT charset = utf8;

Create table Tb_Pedido(
	ID_Pedido int not null primary key AUTO_INCREMENT,
	ID_Usuario int not null,
	ID_Produto int not null,
	Quant_Pedido int not null,
	CEP_Pedido decimal(3,2) not null,
	Val_Total_Pedido decimal(4,2) not null,
	Data_Pedido datetime not null,
  	Inform_Pedidos varchar(50) not null,
  	Tipo_Borda ENUM ("1","2","3") not null,
  	Foto_Pedido varchar(50),
  	Status_Pedido SMALLINT not null
)DEFAULT charset = utf8;
