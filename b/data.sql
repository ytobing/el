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

CREATE TABLE product_review (
   id bigserial primary key,
   product_id bigint references product(id),
   rating int
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

insert into product_review (
	product_id, rating
)values(1,9),(1,8),(1,7),(2,2),(2,5),(2,3),(3,8),(3,10),(3,7),(3,9),(4,6),(4,2),(5,2),(5,3),(6,9),(6,8),(6,10),(7,7),(7,8),(8,8),(8,9),(9,10),(9,9),(9,8),(10,6),(10,7),(11,2),(11,5);

select p.name, c."name" , avg(pr.rating) as average_rating
from product_review pr 
left join product p on pr.product_id = p.id
left join category c on p.category_id  = c.id
group by 1,2
order by 3 desc
limit 5;



