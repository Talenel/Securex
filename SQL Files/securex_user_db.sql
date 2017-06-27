Use securex;
drop table if exists authorities;
drop table if exists users;


Create table users(
	username varchar(50) not null,
    password varchar(50) not null,
    enabled boolean not null default true,
    primary key(username)

);

create table authorities(
	username varchar(50) not null,
    authority varchar(50) not null,
	constraint fk_authorities_users foreign key(username) references users(username)

);

create unique index ix_auth_username on authorities (username,authority);

insert into users(username,password) values ('user1', 'pwd1');
insert into users(username,password) values ('user2', 'pwd2');
insert into users(username,password) values ('Bob', '12345');

insert into authorities(username, authority) values('user1', 'ADMIN');
insert into authorities(username, authority) values('user2', 'ADMIN');
insert into authorities(username, authority) values('Bob', 'ADMIN');