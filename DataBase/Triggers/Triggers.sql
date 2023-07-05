---  trigger1
alter trigger tr_1
on Book 
after insert
as
declare @c int


select @c = count from BookCounts 
set @c = @c +1

update BookCounts
set count= @c 

-



---Trigger 2
create trigger tr_2
on Book
after delete
as 
insert into BookLog([ISBN number], Title, Edition, Category, Price, username, delDate)
select ISBNnumber, Title, Edition, Category, Price, SUSER_name(), getdate() from deleted



---- trigger3
create trigger tr_3
on Database
for DROP_TABLE, ALTER_TABLE, CREATE_TABLE
as 
RaisError('you can not do this', 16,1)
rollback tran




--- trigger4
create trigger tr_4
on Publisher
instead of insert
as
declare @name nvarchar(50)
select @name = name from inserted 

if EXISTS (SELECT 1 FROM Publisher where name = @name)
    print 'The name exists in the table.';
else
    insert into Publisher
	select * from inserted


