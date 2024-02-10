/*
PROBLEM:
Write a solution to report the sum of all total investment values in 2016 tiv_2016, 
for all policyholders who:
  - have the same tiv_2015 value as one or more other policyholders, and
  - are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

*/


WITH temp_table as (SELECT tiv_2015 , sum(tiv_2016)as tiv_2016,lat
FROM insurance
GROUP BY tiv_2015,lat)
SELECT * 
FROM temp_table tt
INNER JOIN insurance ins ON tt.lat = ins.lon



/*
TRY UNION
*/

WITH temp_table as (SELECT tiv_2015 , sum(tiv_2016)as tiv_2016,lat
FROM insurance
GROUP BY tiv_2015,lat
UNION
SELECT tiv_2015 , sum(tiv_2016)as tiv_2016,lon
FROM insurance
GROUP BY tiv_2015,lon)


SELECT ROUND(sum(tiv_2016),2) as tiv_2016
FROM temp_table
WHERE 
				   
				
				
				
SELECT sum(tiv_2016) as tiv_2016
FROM insurance
WHERE tiv_2015 IN(
SELECT tiv_2015
	FROM insurance
	group by tiv_2015
	/*
	get tiv_2015 values from the group by clause
	that is more than 1
	*/
	having COUNT(*) >1 
) AND (lat,lon) IN (

SELECT lat,lon
	FROM insurance
	GROUP BY lat,lon
	HAVING COUNT (*) = 1

)
				  
				  
		SELECT tiv_2015,sum(tiv_2016) OVER (partition BY tiv_2016) as tiv_2016,lon,lat
		FROM insurance
		GROUP BY tiv_2015,tiv_2016,lon,lat
		HAVING  COUNT(*) > 1
	
	SELECT * FROM insurance
	
	
	/*
FINAL AND WORKING SOLUTION:
  
  */
	
	SELECT ROUND(SUM(tiv_2016)::numeric,2) AS tiv_2016
	/*
	converted to numeric due to float issues
	*/
	FROM (
    SELECT *,
		/*
		used COUNT() OVER (PARTITION BY) function 
		The purpose of this is to count the number of rows
		or serves as a tally for the specific row
		
		*/
           COUNT(*) OVER (PARTITION BY tiv_2015) AS tiv_2015_count,
           COUNT(*) OVER (PARTITION BY lat, lon) AS lat_lon_count
    FROM Insurance
) AS subquery
WHERE tiv_2015_count > 1
AND lat_lon_count = 1;

