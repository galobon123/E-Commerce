create table Users(
	id_user int identity(1,1),
	name_user varchar(20) not null,
	pass_user varchar(255) not null
	constraint pk_user primary key(id_user)
)

create table Products(
	id_prod int identity(1,1),
	name_prod varchar(150) not null,
	descr_prod varchar(max) not null,
	price_prod decimal(10,2) not null check (price_prod > 0),
	stock_prod int not null check (stock_prod >= 0)
	constraint pk_product primary key(id_prod)
)

create table Shopping_Carts(
	id_cart int identity(1,1),
	id_user int not null check (id_user > 0)
	constraint pk_cart primary key(id_cart)
	constraint fk_user_cart foreign key(id_user)
		references Users(id_user)
)

create table Product_Shoppings(
    id_prod int not null check (id_prod > 0),
    id_cart int not null check (id_cart > 0), 
	quantity int not null check (quantity > 0)
    constraint pk_product_shoppings primary key (id_prod, id_cart)
    constraint fk_product foreign key (id_prod)
        references Products(id_prod),
    constraint fk_cart foreign key (id_cart)
        references Shopping_Carts(id_cart)
)

create table Status_Payments(
	id_st_pay int identity(1,1),
	name_st_pay varchar(20) not null
	constraint pk_st_payment primary key(id_st_pay)
)

create table Status_Orders(
	id_st_order int identity(1,1),
	name_st_order varchar(20) not null
	constraint pk_st_order primary key(id_st_order)
)

create table Orders(
	id_order int identity(1,1),
	id_user int not null check (id_user > 0),
	date_order datetime not null default getdate(),
	id_status int not null check (id_status > 0)
	constraint pk_order primary key(id_order)
	constraint fk_payment_status foreign key(id_status)
		references Status_Orders(id_st_order),
	constraint fk_user foreign key(id_user)
		references Users(id_user)
)

create table Order_Products(
	id_prod int not null check (id_prod > 0),
    id_order int not null check (id_order > 0),
	quantity int not null check (quantity > 0),
	price decimal(10,2) not null check (price > 0)
    constraint pk_product_order primary key (id_prod, id_order)
    constraint fk_product foreign key (id_prod)
        references Products(id_prod),
    constraint fk_order foreign key (id_order)
        references Orders(id_order)
)


create table Payment_Methods(
	id_method int identity (1,1),
	name_method varchar(20) not null
	constraint pk_method primary key(id_method)
)


create table Payments(
	id_pay int identity(1,1),
	id_order int not null check (id_order > 0),
	date_pay datetime not null default getdate(),
	amount_pay decimal(10,2) not null check (amount_pay > 0),
	id_method int not null check (id_method > 0),
	id_status int not null check (id_status > 0),
	stripe_id varchar(100)
	constraint pk_payment primary key(id_pay)
	constraint fk_order foreign key(id_order)
		references Orders(id_order),
	constraint fk_method foreign key(id_method)
		references Payment_Methods(id_method),
	constraint fk_payment_status foreign key(id_status)
		references Status_Payments(id_st_pay)
)