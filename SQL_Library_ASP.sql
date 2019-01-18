create database Library_ASP_Surekha

use Library_ASP_Surekha

----Student 
create table tbl_Students
(
StudentID int identity(1000,1) primary key,
StudentName varchar(100) not null,
StudentEmailId varchar(100) not null,
StudentPassword varchar(100) not null,
StudentCity varchar(100) not null,
StudentAddress varchar(100) not null,
StudentDOB datetime not null,
StudentMobileNo varchar(15) not null,
StudentImage varchar(100) not null
)

----Admin
create table tbl_Admin
(
AdminID int identity(100,1) primary key,
AdminName varchar(100) not null,
AdminEmailId varchar(100) not null,
AdminPassword varchar(100) not null,
AdminMobileNo varchar(15) not null
)

----Book
create table tbl_Book
(
BookID int Identity(1,1) primary key,
BookName varchar(100) not null,
BookAuthor varchar(100) not null,
BookTitle varchar(100) not null,
BookPrice int not null,
BookAddDate datetime not null,
NoOfPages int not null,
BookImage varchar(100) not null
)

select * from tbl_Book

---Procedure Login
Alter proc proc_login
(@id varchar(100),@password varchar(100))
as
begin
declare @count int
select @count=count(*) from tbl_Students
where StudentId=@id and StudentPassword=@password
return @count
end
select * from tbl_Students
--Add Student

create proc proc_addstudent
(@name varchar(100),@emailid varchar(100),@password varchar(100),@city varchar(100),
@address varchar(100),@dob datetime,@mobileno varchar(100),@image varchar(100))
as
begin
insert tbl_Students values(@name,@emailid,@password,@city,@address,@dob,@mobileno,@image)
return @@identity
end

--Search Student

create proc proc_searchstudent
(@key varchar(100))
as
begin 
select * from tbl_Students where StudentID like '%'+@key+'%' or 
								StudentName like '%'+@key+'%' or
								StudentEmailID like '%'+@key+'%' or
								StudentPassword like '%'+@key+'%' or
								StudentCity like '%'+@key+'%' or
								StudentAddress like '%'+@key+'%' or
								StudentDOB like '%'+@key+'%' or
								StudentMobileNo like '%'+@key+'%' or
								StudentImage like '%'+@key+'%' 
end


----AddBook

create proc proc_addBook
(@name varchar(100),@author varchar(100),@title varchar(100),
@price int,@date datetime,@pages int,@image varchar(100))
as
begin
insert tbl_Book values(@name,@author,@title,@price,@date,@pages,@image)
return @@identity
end

select * from tbl_Book

---FindBook

Alter proc proc_FindBook(@id int)
as
begin
select * from tbl_Book where BookID=@id
end


----Issue Book
create table tbl_IssueBook
(
IssueID int identity(1000,1) primary key,
BookID int not null,
StudentID int not null,
IssueDate datetime not null,
IssueStatus varchar(100) not null
)

----procedure IssueBook


create proc proc_IssueBook
(@bid int,@sid int)
as
begin
insert tbl_IssueBook values(@bid,@sid,getdate(),'Issued')
return @@identity
end

create proc proc_ShowBook
(@sid int)
as
begin
Select * from tbl_Book where bookid in
(Select bookid from tbl_IssueBook where StudentID=@sid)
end
