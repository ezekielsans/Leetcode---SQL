/*
Problem:
	
	 Write a solution to find the number of times each student attended each exam.
	 Return the result table ordered by student_id and subject_name.
	 The result format is in the following example.


Learnings:
  CROSS JOIN 
    - fills out the missing student_id
    * also cross joins are not practical to use in large datasets as it duplicates the rows of the table your joining to
      i.e.
        subject has 1000000 when cross join it'll be * 1000000
  LEFT JOIN
    - this is different from inner join (within the table) 
    - left join is joining another row into the existing table or statement
*/


SELECT s.student_id, s.student_name, sub.subject_name,
COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub -- key answer
LEFT JOIN Examinations e ON s.student_id = e.student_id --left join is different from join
AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
