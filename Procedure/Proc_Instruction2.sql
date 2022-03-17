create proc getCount
@amount smallint, @count int output
as
select @count = count(UnitsInStock) from Products 
where UnitsInStock = @amount

/*
	dung cho co output
*/
declare @getcount1 int; 
exec getCount 0, @count = @getcount1 output;
print 'The year-to-date sales figure for this territory is ' +
convert (varchar(100), @getcount1);
go