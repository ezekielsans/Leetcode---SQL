	  /*
			  Make first Letter and UPPERcase and the following letters
			  LOWERcase
			  	-UPPER : turns all letters into UPPERCASE
			  	-LOWER : turns all letters into LOWERCASE
			  	-RIGHT : navigate into the right side of the element
			  	-LEFT  : navigate into the left side of the element
			  	-LENGTH : check the lenght of an element(useful if you dont know 
			  the exact size of your string)
			  
			  */





 SELECT CONCAT(UPPER(LEFT(name,1)), 
			  LOWER(RIGHT(name,LENGTH(name)-1)))
			  as name FROM USERS

/*

QUERY OUTPUT
  
FROM:
  1	"aLice"
  2	"bOB"

TO:
  1 "Alice"
  2 "Bob"


*/
