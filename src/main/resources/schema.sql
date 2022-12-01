create schema SQLAgg;

use SQLAgg;

# создание таблицы customers

create table customers
(
    id int primary key auto_increment,
    name varchar(225) not null,
    surname varchar(225) not null,
    age int check ( age>0 ),
    phone_number varchar(20)
);

insert into customers (name, surname, age, phone_number)
values ('Alexey', 'Ivanov', 44, '+79253003121');
insert into customers (name, surname, age, phone_number)
values ('Inna', 'Tikhonova', 37, '+79262552669');
insert into customers (name, surname, age, phone_number)
values ('alexey', 'smulyak', 21, '+79632114511');
insert into customers (name, surname, age, phone_number)
values ('ALEXEY', 'PETROV', 62, '+79252552525');
insert into customers (name, surname, age, phone_number)
values ('Ivan', 'Andropov', 33, '+79213669966');


# создание таблицы orders

create table orders
(
    id   int primary key auto_increment,
    date timestamp not null default now(),
    customer_id int,
    product_name varchar(225) not null,
    amount int,
    foreign key (customer_id) references customers(id)
);

insert into orders (customer_id, product_name, amount)
values (1, 'Notebook', 2);
insert into orders (customer_id, product_name, amount)
values (3, 'TV', 1);
insert into orders (customer_id, product_name, amount)
values (1, 'Phone', 3);
insert into orders (customer_id, product_name, amount)
values (5, 'Headphones', 2);
insert into orders (customer_id, product_name, amount)
values (4, 'Memory card', 2);
insert into orders (customer_id, product_name, amount)
values (2, 'Mouse', 1);
insert into orders (customer_id, product_name, amount)
values (3, 'Monitor', 1);
insert into orders (customer_id, product_name, amount)
values (2, 'Battery', 5);
insert into orders (customer_id, product_name, amount)
values (5, 'Phone', 1);