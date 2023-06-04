drop database if exists school;
create database school;

use school;

drop table if exists team; -- Коллектив школы (весь)
create table team (
id SMALLINT unsigned not null auto_increment primary key,
firstname VARCHAR(50),
patronymic VARCHAR(50) comment 'Отчество',
lastname VARCHAR(50) comment 'Фамилия',
birthday DATE,
education VARCHAR (255) comment 'Образование',
numb_employment_contract BIGINT unsigned not null unique comment 'Номер трудового договора',
in_ipa CHAR(14) unique comment 'СНИЛС члена коллектива',
tin CHAR(12) unique comment 'ИНН члена коллектива',
email VARCHAR(120) unique,

index team_firstname_lastname_idx(firstname, lastname)
);

drop table if exists administration; -- Администрация школы
create table administration (
adm_id SMALLINT unsigned not null unique,
appointment VARCHAR(100) comment 'Должность',
work_experience TINYINT unsigned not null comment 'Стаж работы',
adm_num_employ_contr BIGINT unsigned not null unique comment 'Номер трудового договора члена администрации',
phone BIGINT unsigned not null unique,

foreign key (adm_id) references team(id),
foreign key (adm_num_employ_contr) references team(numb_employment_contract)
);

drop table if exists teachers; -- Учителя школы
create table teachers (
teacher_id SMALLINT unsigned not null unique,
specialization VARCHAR(120) comment 'Специальность (преподаваемые предметы)',
work_experience TINYINT unsigned not null comment 'Стаж работы по специальности',
teach_num_employ_contr BIGINT unsigned not null unique comment 'Номер трудового договора учителя',
phone BIGINT unsigned not null unique,

foreign key (teacher_id) references team(id),
foreign key (teach_num_employ_contr) references team(numb_employment_contract)
);

drop table if exists school_classes; -- Классы в школе
create table school_classes (
id TINYINT unsigned not null auto_increment primary key,
class VARCHAR(5) unique
);

drop table if exists pupils; -- Ученики школы
create table pupils (
id SMALLINT unsigned not null auto_increment primary key,
firstname VARCHAR(50),
patronymic VARCHAR(50),
lastname VARCHAR(50),
birthday DATE,
class_id TINYINT unsigned not null comment 'ID класса, в котором учится ученик',
pupil_in_ipa CHAR(14) unique comment 'СНИЛС ученика',

index pupils_firstname_lastname_idx(firstname, lastname),
foreign key(class_id) references school_classes(id)
);

drop table if exists class_teachers; -- Классные руководители
create table class_teachers (
class_teacher_id SMALLINT unsigned not null unique,
class_id TINYINT unsigned not null unique,

foreign key(class_teacher_id) references team(id) on delete cascade on update cascade,
foreign key(class_id) references school_classes(id) on delete cascade on update cascade
);

drop table if exists parents; -- Родители учеников школы
create table parents (
id SMALLINT unsigned not null auto_increment unique,
firstname VARCHAR(50) comment 'Имя',
patronymic VARCHAR(50) comment 'Отчество',
lastname VARCHAR(50) comment 'Фамилия',
birthday DATE,
parent_in_ipa CHAR(14) unique comment 'СНИЛС родителя',
phone BIGINT unsigned not null unique,

index parents_firstname_lastname_idx(firstname, lastname)
);

drop table if exists relation; -- Связи учеников и родителей
create table relation (
pupil_id SMALLINT unsigned not null unique,
parent_id SMALLINT unsigned not null,

foreign key(pupil_id) references pupils(id) on delete cascade on update cascade,
foreign key(parent_id) references parents(id) on delete cascade on update cascade
);

drop table if exists school_subjects; -- Школьные предметы
create table school_subjects (
id TINYINT unsigned not null auto_increment unique,
subj_denomination VARCHAR(100) comment 'Название предмета'
);

drop table if exists schoolbooks; -- Школьные учебники
create table schoolbooks (
id SMALLINT unsigned not null auto_increment unique,
school_subj_id TINYINT unsigned not null,
book_denomination VARCHAR(100) comment 'Название учебника',
author VARCHAR(150) comment 'Автор учебника',
book_grade VARCHAR(2) comment 'Для какого класса предназначен',

index schoolbooks_denomination_author_idx(book_denomination, author),
foreign key(school_subj_id) references school_subjects(id) on delete cascade on update cascade
);

drop table if exists classrooms; -- Школьные кабинеты
create table classrooms (
id SMALLINT unsigned not null auto_increment unique,
worker_id SMALLINT unsigned not null unique comment 'За каким работником закреплён кабинет',
num SMALLINT unsigned not null unique comment 'Номер кабинета',
title VARCHAR(100) comment 'Название кабинета',

foreign key(worker_id) references team(id) on delete cascade on update cascade
);
































