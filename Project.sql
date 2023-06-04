drop database if exists school;
create database school;

use school;

drop table if exists team; -- ��������� ����� (����)
create table team (
id SMALLINT unsigned not null auto_increment primary key,
firstname VARCHAR(50),
patronymic VARCHAR(50) comment '��������',
lastname VARCHAR(50) comment '�������',
birthday DATE,
education VARCHAR (255) comment '�����������',
numb_employment_contract BIGINT unsigned not null unique comment '����� ��������� ��������',
in_ipa CHAR(14) unique comment '����� ����� ����������',
tin CHAR(12) unique comment '��� ����� ����������',
email VARCHAR(120) unique,

index team_firstname_lastname_idx(firstname, lastname)
);

drop table if exists administration; -- ������������� �����
create table administration (
adm_id SMALLINT unsigned not null unique,
appointment VARCHAR(100) comment '���������',
work_experience TINYINT unsigned not null comment '���� ������',
adm_num_employ_contr BIGINT unsigned not null unique comment '����� ��������� �������� ����� �������������',
phone BIGINT unsigned not null unique,

foreign key (adm_id) references team(id),
foreign key (adm_num_employ_contr) references team(numb_employment_contract)
);

drop table if exists teachers; -- ������� �����
create table teachers (
teacher_id SMALLINT unsigned not null unique,
specialization VARCHAR(120) comment '������������� (������������� ��������)',
work_experience TINYINT unsigned not null comment '���� ������ �� �������������',
teach_num_employ_contr BIGINT unsigned not null unique comment '����� ��������� �������� �������',
phone BIGINT unsigned not null unique,

foreign key (teacher_id) references team(id),
foreign key (teach_num_employ_contr) references team(numb_employment_contract)
);

drop table if exists school_classes; -- ������ � �����
create table school_classes (
id TINYINT unsigned not null auto_increment primary key,
class VARCHAR(5) unique
);

drop table if exists pupils; -- ������� �����
create table pupils (
id SMALLINT unsigned not null auto_increment primary key,
firstname VARCHAR(50),
patronymic VARCHAR(50),
lastname VARCHAR(50),
birthday DATE,
class_id TINYINT unsigned not null comment 'ID ������, � ������� ������ ������',
pupil_in_ipa CHAR(14) unique comment '����� �������',

index pupils_firstname_lastname_idx(firstname, lastname),
foreign key(class_id) references school_classes(id)
);

drop table if exists class_teachers; -- �������� ������������
create table class_teachers (
class_teacher_id SMALLINT unsigned not null unique,
class_id TINYINT unsigned not null unique,

foreign key(class_teacher_id) references team(id) on delete cascade on update cascade,
foreign key(class_id) references school_classes(id) on delete cascade on update cascade
);

drop table if exists parents; -- �������� �������� �����
create table parents (
id SMALLINT unsigned not null auto_increment unique,
firstname VARCHAR(50) comment '���',
patronymic VARCHAR(50) comment '��������',
lastname VARCHAR(50) comment '�������',
birthday DATE,
parent_in_ipa CHAR(14) unique comment '����� ��������',
phone BIGINT unsigned not null unique,

index parents_firstname_lastname_idx(firstname, lastname)
);

drop table if exists relation; -- ����� �������� � ���������
create table relation (
pupil_id SMALLINT unsigned not null unique,
parent_id SMALLINT unsigned not null,

foreign key(pupil_id) references pupils(id) on delete cascade on update cascade,
foreign key(parent_id) references parents(id) on delete cascade on update cascade
);

drop table if exists school_subjects; -- �������� ��������
create table school_subjects (
id TINYINT unsigned not null auto_increment unique,
subj_denomination VARCHAR(100) comment '�������� ��������'
);

drop table if exists schoolbooks; -- �������� ��������
create table schoolbooks (
id SMALLINT unsigned not null auto_increment unique,
school_subj_id TINYINT unsigned not null,
book_denomination VARCHAR(100) comment '�������� ��������',
author VARCHAR(150) comment '����� ��������',
book_grade VARCHAR(2) comment '��� ������ ������ ������������',

index schoolbooks_denomination_author_idx(book_denomination, author),
foreign key(school_subj_id) references school_subjects(id) on delete cascade on update cascade
);

drop table if exists classrooms; -- �������� ��������
create table classrooms (
id SMALLINT unsigned not null auto_increment unique,
worker_id SMALLINT unsigned not null unique comment '�� ����� ���������� �������� �������',
num SMALLINT unsigned not null unique comment '����� ��������',
title VARCHAR(100) comment '�������� ��������',

foreign key(worker_id) references team(id) on delete cascade on update cascade
);
































