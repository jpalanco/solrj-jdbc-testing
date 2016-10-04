-- Not yet supported
select * from test limit 10;
SELECT COUNT(*) FROM (select COUNT(*) from test limit 100) t;
-- supported
select COUNT(*) from test;
select fielda from test limit 10;
select fielda, fieldb, fieldc from test limit 10;
select fielda, fieldb, fieldd_s from test limit 10;
select fielda, min(fieldc) from test group by fielda;
select fielda, min(fieldc) as min from test group by fielda;
select fielda, fieldb, fieldc from test order by fielda desc;
select fielda, fieldb, fieldc, fieldd_s, fielde_i from test limit 10;
select fielda, fieldb, min(fieldc), max(fieldc), avg(fieldc), sum(fieldc) from test group by fielda, fieldb;

