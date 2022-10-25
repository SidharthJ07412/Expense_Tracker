drop table Member;
create table Member(
    Mem_id bigserial,
    Fname varchar(20),
    Lname varchar(20),
    DOB timestamp,
    Salary numeric(15,2),
    Phone_Num char(10),
    Email varchar(30),
    Password varchar(20),
    primary key (Mem_id)
);
INSERT INTO Member(Fname, Lname, DOB, Salary, Phone_Num, Email, Password) VALUES('Hussain', 'Diwan', '2001-11-11',2200000,'876654152', 'hd@gmail.com','123456');
Select * from member;


drop table Groups;
create table Groups(
    Group_id bigserial,
    Owner_id bigserial,
    Name varchar(20),
    Created_on timestamp,
    primary key (Group_id),
    foreign key (Owner_id) references Member
);
INSERT INTO Groups(Owner_id,Name,Created_on) VALUES (1,'Project Group','2022-10-24');
Select * from Groups;

create table Belongs_To(
    Mem_id bigserial,
    Group_id bigserial,
    amount_due numeric(15,2),
    primary key(Mem_id,Group_id),
    foreign key (Mem_id) references Member,
    foreign key (Group_id) references Groups
);
insert into belongs_to values(1,1,0);

create table Group_Expense(
    Expense_id bigserial,
    Group_id bigserial,
    Paid_by_mem_id bigserial,
    Added_by_mem_id bigserial,
    Amount numeric(15,2),
    Remarks varchar(30),
    Date timestamp,
    primary key (Expense_id),
    foreign key (Group_id) references Groups,
    foreign key (Paid_by_mem_id) references member,
    foreign key (Added_by_mem_id) references member,
);

create table shares(
    Expense_id bigserial,
    Group_id bigserial,
    Mem_id bigserial,
    Share_amount numeric(15,2),
    Settled boolean,
    primary key (Expense_id,Group_id,Mem_id),
    foreign key (Expense_id) references Group_Expense,
    foreign key (Group_id) references Groups,
    foreign key (Mem_id) references member
);


-- for charts user apne expense types khud bata sakta hai aur jab naya expense banaega to dropdown mein types select karega
create table expense_type(
    Mem_id bigserial,
    Type varchar(20),
    primary key(Mem_id,Type),
    foreign key (Mem_id) references member
);

create table Individual_Expense(
    Expense_id bigserial,
    Mem_id bigserial,
    Amount numeric(15,2),
    Date timestamp,
    Remarks varchar(30),
    Type varchar(20),
    primary key (Expense_id),
    foreign key (Mem_id) references member,
    foreign key (Type) references expense_type
);