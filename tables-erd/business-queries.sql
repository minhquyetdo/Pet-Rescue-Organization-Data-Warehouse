-- Check data

SHOW DATABASES;
USE Pet_finder;
DROP DATABASE Pet_finder;
SELECT * FROM Pet_staging;
SELECT * FROM Rescuer_DIM;
SELECT * FROM Pet_status_Fact WHERE Version = 2;
SELECT * FROM Pet_status_Fact;
SELECT * FROM Breed_DIM;
SELECT * FROM Species_DIM;
SELECT * FROM Color_DIM;
SELECT * FROM Medical_DIM;
SELECT * FROM Health_DIM;
SELECT * FROM State_DIM;

-- Create Pet_status_Fact table

SELECT stag.PetID as PetID,
stag.Age,
stag.Quantity,
stag.Fee,
s.Species_PK as Species_FK,
b1.Breed_PK as Breed1_FK,
b2.Breed_PK as Breed2_FK,
c1.Color_PK as Color1_FK,
c2.Color_PK as Color2_FK,
c3.Color_PK as Color3_FK,
f.Fur_PK as Fur_FK,
h.Health_PK as Health_FK,
m.Medical_PK as Medical_FK,
r.Rescuer_PK as Rescuer_FK,
si.Size_PK as Size_FK,
st.State_PK as State_FK
FROM Pet_staging stag
INNER JOIN Species_DIM s
ON stag.Type = s.Type AND stag.Gender = s.Gender 
INNER JOIN Breed_DIM b1
ON stag.Breed1 = b1.Breed_name
INNER JOIN Breed_DIM b2
ON stag.Breed2 = b2.Breed_name
INNER JOIN Color_DIM c1
ON stag.Color1 = c1.Color_name
INNER JOIN Color_DIM c2
ON stag.Color2 = c2.Color_name
INNER JOIN Color_DIM c3
ON stag.Color3 = c3.Color_name
INNER JOIN Fur_DIM f
ON stag.Furlength = f.Fur_name
INNER JOIN Health_DIM h
ON stag.Health = h.Health_name
INNER JOIN Medical_DIM m
ON stag.Vaccinated = m.Vaccinated AND stag.Dewormed = m.Dewormed AND stag.Sterilized = m.Sterilized
INNER JOIN Rescuer_DIM r
ON stag.RescuerID = r.Rescuer_ID
INNER JOIN Size_DIM si
ON stag.MaturitySize = si.Size_name
INNER JOIN State_DIM st
ON stag.State = st.State_name;

-- How many pet had been both vaccinated and sterilized ?

SELECT COUNT(*) FROM Pet_status_Fact
	WHERE Medical_FK IN
	(SELECT Medical_PK FROM Medical_DIM 
		WHERE Vaccinated = 'Yes' && Sterilized = 'Yes');
        
-- Show information of the pet have the most quantity in the data ?

SELECT * FROM Pet_status_Fact ORDER BY Quantity DESC LIMIT 1;

-- How many cat are in unwell condition ?
SELECT SUM(Quantity) FROM Pet_status_Fact
	WHERE Species_FK IN (SELECT Species_PK FROM Species_DIM WHERE
						Type = 'Cat')
	AND Health_FK IN (SELECT Health_PK FROM Health_DIM 
						WHERE Health_name = 'Minor Injury' || 'Serious Injury')
	AND Last_update BETWEEN Start_date AND End_date;
    
SELECT COUNT(*) FROM Pet_status_Fact
	WHERE State_FK = (SELECT State_PK FROM State_DIM
						WHERE State_name = 'Kuala Lumpur')
	AND Last_update BETWEEN Start_date AND End_date;
