-- How many utility companes serve the state of Maryland?
select distinct utility_name from rates where state='MD';
-- Which Maryland utility has the cheapest residential rates?
select utility_name,min(res_rate) from rates where state='MD' group by utility_name order by min(res_rate) asc limit 1;
-- What are the minimum and maximum residential power rates excluding missing data elements?
select min(res_rate),max(res_rate) from rates where not res_rate = 0;
-- What is the state and zip code with the highest res_rate?
select state,zip,max(res_rate) from rates group by state,zip order by max(res_rate) desc limit 1;
