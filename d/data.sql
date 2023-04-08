CREATE extension IF NOT EXISTS "uuid-ossp";


CREATE table account (
   id bigserial primary key,
   name varchar(255),
   email varchar(255),
   shipping_address varchar(255),
   password varchar(255)
);

CREATE TABLE product (
   id bigserial primary key,
   name varchar(255),
   description varchar(255),
   price float,
   is_active bool,
   stock int
);


CREATE TABLE category (
  	id bigserial primary key,
	name varchar(255));

create table product_category (
	id bigserial primary key,
	product_id bigint references product(id),
   	category_id bigint references category(id)
);

create table cart (
	id bigserial primary key,
	account_id bigint references account(id),
	product_id bigint references product(id),
   	quantity int
);

create table orders (
	id bigserial primary key,
	orders_code uuid unique default uuid_generate_v1(),
	account_id bigint references account(id),
	status int   	
);

create table orders_item (
	id bigserial primary key,
	orders_id bigint references orders(id),
	product_name varchar(255),
	product_id bigint references product(id),
	quantity int,   	
	price float
);

create table product_review (
	id bigserial primary key,
	orders_item_id bigint references orders_item(id),
	product_id bigint references product(id),
	review text,
	review_score int
);
