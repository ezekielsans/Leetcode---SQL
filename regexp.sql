/*
Problem:
	Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. 
	Type I Diabetes always starts with DIAB1 prefix.
	Return the result table in any order.


*/




SELECT patient_id,patient_name,conditions 
FROM patients
/*
note: 
that '% THIS%' 
is different from '%THIS%'

 - first word serves as a second word.
 - second word may serve as a middle word
*/
WHERE conditions like '% DIAB1%' 
OR conditions like 'DIAB1%'



