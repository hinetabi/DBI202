create proc q2
@s date, @f date
as
begin 
select nv1.MANV, nv1.TEN, nv1.NGSINH, nv1.MA_NQL, nv2.TEN from NHANVIEN nv1 
	inner join NHANVIEN nv2 on nv1.MA_NQL = nv2.MANV
where nv1.NGSINH between @s and @f
end


