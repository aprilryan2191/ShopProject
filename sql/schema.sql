create table categories
(
    id   serial8,
    name varchar not null,
    primary key (id)
);

insert into categories (name)
values ('Процессоры'),
       ('Мониторы');

create table characteristics
(
    id          serial8,
    category_id int8    not null,
    name        varchar not null,
    primary key (id),
    foreign key (category_id) references categories (id)
);

insert into characteristics (category_id, name)
values (1, 'Производитель'),
       (1, 'Количество ядер'),
       (1, 'Сокет'),
       (2, 'Производитель'),
       (2, 'Диагональ'),
       (2, 'Матрица'),
       (2, 'Разрешение');

create table products
(
    id          serial8,
    category_id int8    not null,
    name        varchar not null,
    price       int4    not null,
    primary key (id),
    foreign key (category_id) references categories (id)
);

insert into products (category_id, name, price)
values (1, 'Intel Core I9 9900', '399990'),
       (1, 'AMD Ryzen R7 7700', '349990'),
       (2, 'Samsung SU556270', '54990'),
       (2, 'AOC Z215S659', '39990');

create table products_info
(
    id                serial8,
    characteristic_id int8,
    product_id        int8,
    name              varchar not null,
    primary key (id),
    foreign key (characteristic_id) references characteristics (id),
    foreign key (product_id) references products (id)
);

insert into products_info (characteristic_id, product_id, name)
values (1, 1, 'Intel'),
       (2, 1, '8'),
       (3, 1, '1250'),
       (1, 2, 'AMD'),
       (2, 2, '12'),
       (3, 2, 'AM4'),
       (4, 3, 'Samsung'),
       (5, 3, '27'),
       (6, 3, 'TN'),
       (7, 3, '2560*1440'),
       (4, 4, 'AOC'),
       (5, 4, '21.5'),
       (6, 4, 'AH-IPS'),
       (7, 4, '1920*1080');

create table users
(
    id                serial8,
    role              int2    not null,
    login             varchar not null,
    password          varchar not null,
    first_name        varchar not null,
    last_name         varchar not null,
    registration_date date,
    primary key (id)
);

insert into users (role, login, password, first_name, last_name, registration_date)
values (0, 'aidar.bikenov', '7ab4c5l6', 'Айдар', 'Бикенов', '03-05-2017'),
       (1, 'daulet.zhanabay', 'Qwerty798654', 'Даулет', 'Жанабай', '24-10-2017'),
       (0, 'gordey.bogorosh', 'qweasdzxc11', 'Гордей', 'Богорош', '11-01-2018'),
       (1, 'darkhan.serikbayev', '28560njibhu', 'Дархан', 'Серикбаев', '09-05-2018'),
       (1, 'askar.kurmangaliyev', 'pentpent43#', 'Аскар', 'Курмангалиев', '19-08-2019'),
       (1, 'sergey.veremenko', 'h$1N2wb$X', 'Сергей', 'Веременко', '07-12-2020');

create table orders
(
    id                  serial8,
    user_id             int8,
    status              varchar not null,
    destination_address varchar not null,
    order_date          date    not null,
    primary key (id),
    foreign key (user_id) references users (id)
);

insert into orders (user_id, status, destination_address, order_date)
values (2, 'Доставлен', 'Кошкарбаева 40/1', '16-07-2023'),
       (6, 'Отменен', 'Ворошилова 9', '01-04-2023'),
       (5, 'В пути', 'Кравцова 29', '04-08-2023'),
       (4, 'Доставлен', 'Манаса 20/2', '31-10-2023');

create table reviews
(
    id                serial8,
    user_id           int8,
    product_id        int8,
    publishing_status varchar not null,
    rating            int4    not null,
    review_text       text    not null,
    publishing_date   date    not null,
    primary key (id),
    foreign key (user_id) references users (id),
    foreign key (product_id) references products (id)
);

insert into reviews (user_id, product_id, publishing_status, rating, review_text, publishing_date)
values (2, 1, 'Опубликован', 4, 'Нормально', '20-07-2023'),
       (4, 2, 'Опубликован', 5, 'Хорош', '10-11-2023'),
       (6, 4, 'Не опубликован', 1, 'Говно', '07-04-2023'),
       (5, 3, 'На модерации', 4, 'Норм, надеюсь', '05-08-2023');

create table orders_products
(
    id                serial8,
    order_id          int8,
    product_id        int8,
    amounts_per_order int4,
    primary key (id),
    foreign key (order_id) references orders (id),
    foreign key (product_id) references products (id)
);

insert into orders_products (order_id, product_id, amounts_per_order)
values (1, 1, 2),
       (1, 2, 1),
       (2, 3, 1),
       (2, 4, 1),
       (2, 2, 2),
       (3, 3, 10),
       (4, 1, 2),
       (4, 2, 2),
       (4, 3, 2),
       (4, 4, 2);