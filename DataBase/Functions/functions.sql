---- function1 
CREATE function [dbo].[func_1]
    (@isbn_number int)
returns table
as
return
(
select FirstName, LastName, ReservationDate, LoanDate, BackDate from reader_book as rb inner join reader as r on rb.UserId = r.UserId
inner join person on r.PersonId = person.PersonId
where [ISBN number]=@isbn_number

)
GO



---- function2
CREATE function [dbo].[func_2]
(
    @userid int
)
returns table
as
return 
(
    select  rb.[ISBN number], b.title
    from  reader_book rb
    inner join  book as b on rb.[ISBN number] = b.ISBNnumber
    where rb.userid =@userid  and rb.backdate is null and rb.LoanDate is not null
)
GO



--- function3 
create function [dbo].[func_3]
(
    @staffid int
)
returns int 
as
begin
    declare @bookCount int;

 select @bookCount= count(GetDate)  from Staff_reader 
 where staffid =@staffid


    return @bookCount;
end
GO



---function4 
create function [dbo].[func_4]
(
    @startdate date,
    @enddate date
)
returns int
as
begin
    declare @bookcount int

    select @bookcount = count(*)
    from publisher_book
    where publishdate >= @startdate and publishdate <= @enddate

    return @bookcount
end
GO







