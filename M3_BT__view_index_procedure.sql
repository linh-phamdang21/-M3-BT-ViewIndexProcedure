create table Products(
	id int(10),
    productCode varchar(20) not null,
    productPrice int not null,
    productAmount int not null,
    productDescription varchar(100) null,
    productStatus bit,
    constraint pk_products primary key (id)
);

insert into Products values (1,'C001', 1500000, 3, 'new', 1);
insert into Products values (2,'C002', 2000000, 0, 'new', 1);
insert into Products values (3,'C003', 11000000, 6, 'new', 1);
insert into Products values (4,'C004', 800000, 2, 'new', 1);
insert into Products values (5,'C005', 1000000, 8, 'new', 1);

alter table Products add column productName varchar(50) after id;

update Products set productName = 'Samsung j3' where Products.id = 1;
update Products set productName = 'Samsung j7' where Products.id = 2;
update Products set productName = 'Iphone8' where Products.id = 3;
update Products set productName = 'LG G3' where Products.id = 4;
update Products set productName = 'Nokia L3' where Products.id = 5;

select * from Products;

create unique index product_index on Products (productCode);

create index product_index_name_price on Products (productName, productPrice);

explain select * from products
where productName = 'Iphone8';

select * from products
where productName = 'Iphone8';

create view product_views as
select productCode, productName, productPrice, productStatus
from Products;

select * from product_views;

create or replace view product_views as
select productCode, productName, productPrice
from Products;

drop view product_views;

delimiter //
create procedure get_all_product()
begin
select * from Products;
end //
delimiter ;
call get_all_product();

delimiter //
create procedure add_new_product(
in add_id int, add_productName varchar(50), add_productCode varchar(20), add_productPrice int, 
add_productAmount int, add_productDescription varchar(100), 
add_productStatus bit)
begin
insert into Products values (add_id, add_productName, add_productCode, add_productPrice, add_productAmount, add_productDescription, add_productStatus);
end //
delimiter ;

call add_new_product(6, 'Samsung Note 10', 'C006', 20000000, 5, 'New', 1);

select * from Products;

delimiter //
create procedure edit_product(in edit_id int, edit_productName varchar(50), edit_productCode varchar(20), edit_productPrice int, 
edit_productAmount int, edit_productDescription varchar(100), 
edit_productStatus bit)
begin
update Products set
productName = edit_productName,
productCode = edit_productCode,
productPrice = edit_productPrice,
productAmount = edit_productAmount, 
productDescription = edit_productDescription,
productStatus = edit_productStatus
where id = edit_id;
end //
delimiter ;

call edit_product(1,'Iphone XSMax','C007', 22000000, 2, 'New', 1);

select * from products;
