
drop table if exists hibernate_sequence;
create table hibernate_sequence(
  next_val bigint(20) default null
);

drop table if exists role;
create table role(
  role_id int not null,
  role varchar(255) null default null,
  primary key (role_id)
);

drop table if exists t_account_transaction;
create table t_account_transaction(
  ID int not null auto_increment,
  CREATED_DATE timestamp null default current_timestamp(),
  LAST_UPDATED timestamp not null default current_timestamp(),
  ACCOUNT_ID int not null,
  ACCOUNT_NUMBER varchar(45) not null,
  CUSTOMER_NUMBER varchar(25) not null,
  TX_DATE timestamp not null default current_timestamp(),
  MCC_CODE varchar(50) not null,
  TX_REFERENCE varchar(25) not null,
  TX_DESC varchar(300) not null,
  TX_TYPE varchar(2) not null,
  TX_AMOUNT double not null,
  TX_STATUS_CODE varchar(20) not null,
  AVAILABLE_BALANCE double not null,
  RECIPIENT varchar(45) null default null,
  primary key (ID)
);

drop table if exists user;
create table user(
  user_id int not null,
  active int null default null,
  email varchar(255) null default null,
  last_name varchar(255) null default null,
  name varchar(255) null default null,
  password varchar(255) null default null,
  primary key (user_id)
);

drop table if exists user_role;
create table user_role(
  user_id int not null,
  role_id int not null,
  primary key (
    user_id, 
    role_id
  )
);
alter table USER_ROLE
  add constraint USER_ROLE_FK1 foreign key (USER_ID)
  references USER (USER_ID);
 
alter table USER_ROLE
  add constraint USER_ROLE_FK2 foreign key (ROLE_ID)
  references ROLE (ROLE_ID);