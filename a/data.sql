CREATE TABLE category (
  	id bigserial primary key,
	name varchar(255)
);

CREATE TABLE product (
   id bigserial primary key,
   name varchar(255),
   price float,
	category_id bigint references category(id) 
);

CREATE TABLE product_transaction (
   id bigserial primary key,
   product_id bigint references product(id),
	quantity int
);

INSERT INTO public.category
("name")
VALUES('appetizer'),('drink'),('main_course'),('desert');

INSERT INTO public.product
("name", price, category_id)
VALUES('salad', 60, 1),('soup', 40, 1), ('chips', 30, 1), ('bread', 35, 1),
	('ice tea', 10, 2),	('coffee', 20, 2),
	('pizza', 150, 3),('pad thai', 200, 3),('krapow moo', 100, 3),
	('ice cream', 100, 4),('cake', 90, 4);


insert into product_transaction (
	product_id, quantity
) values(1,random() * 3 + 1),(2,random() * 3 + 1),(3,random() * 3 + 1),(4,random() * 3 + 1),(5,random() * 3 + 1),(6,random() * 3 + 1),(7,random() * 3 + 1),(8,random() * 3 + 
1),(9,random() * 3 + 1),(10,random() * 3 + 1),(11,random() * 3 + 1);



select c.name , sum(pt.quantity * p.price) as revenue
from product_transaction pt 
left join product p on pt.product_id = p.id
left join category c on p.category_id  = c.id
group by c."name" 
order by revenue desc;




