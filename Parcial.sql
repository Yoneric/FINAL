CREATE TABLESPACE PARCIAL_FINAL 
DATAFILE 'PARCIAL.DBF' 
SIZE 50M  

/*
1. ESTE PUNTO ES ALGO CONFUSO YA QUE LA TEORIA DICE los ISBN tenían una longitud de 10 0 13 dígitos Y EL PUNTO DEL PARCIAL DICE 
Create a function which will receive a string of 10 or 13 digits. 
OSEA QUE RECIBE EL CODIGO COMPLETO Y LO UNICO QUE SE DEBERIA HACER EN LA FUNCION PARA OBTENER EL CODIGO DE VERIFICACION ES EXTRAER EL ULTIMO VALOR Y YA.
ME DI CUENTA CUANDO YA TENIA TODO ESTE CODIGO. AUN ASI LO DEJO COMO LO COMENCE A REALIZAR.
*/

CREATE OR REPLACE FUNCTION BOOK_NUMBER(CODIGO NUMBER) RETURN VARCHAR IS
    
    V_CADENA NUMBER;
    V_CONT10 NUMBER := 10;
    V_TOTAL10 NUMBER := 0;
    V_POSICION10 NUMBER;
    V_CONT13 NUMBER := 1;
    V_TOTAL13 NUMBER := 0;
    V_POSICION13 NUMBER;
    
BEGIN
    SELECT LENGTH(CODIGO) INTO V_CADENA FROM DUAL; 
    
    IF (V_CADENA = 10) THEN
    
        FOR i IN 1..V_CADENA LOOP 
            SELECT SUBSTR(CODIGO,i,1) INTO V_POSICION10 FROM DUAL;
            
            V_TOTAL10 := V_TOTAL10 + (V_POSICION10 * V_CONT10);
            V_CONT10 := V_CONT10 - 1;           
            --0×10 + 3×9 + 0×8 + 6×7 + 4×6 + 0×5 + 6×4 + 1×3 + 5×2 = 130.            
        END LOOP;
        V_TOTAL10 := MOD(V_TOTAL13,11);
        RETURN TO_CHAR(V_TOTAL10);
        
    ELSIF (V_CADENA = 13) THEN
    
        FOR i IN 1..V_CADENA LOOP 
            SELECT SUBSTR(CODIGO,i,1) INTO V_POSICION13 FROM DUAL;
            
            V_TOTAL13 := V_TOTAL13 + (V_POSICION13 * V_CONT13);
            
            
            IF (V_CONT13 = 1) THEN
                V_CONT13 := 3;
            ELSE
                V_CONT13 := 1;
            END IF;                   
                      
        END LOOP;
        V_TOTAL13 := MOD(V_TOTAL13,10);
        RETURN TO_CHAR(V_TOTAL13); 
        
    ELSE
        RETURN '99';          
    END IF;
END;


/*

*/

create table isbns (
 id INT,
 isbn VARCHAR(50),
 verification_digit INT
); PARCIAL_FINAL

insert into isbns (id, isbn, verification_digit) values (1, '2562661363', 0);
insert into isbns (id, isbn, verification_digit) values (2, '3561817960', 0);
insert into isbns (id, isbn, verification_digit) values (3, '0887756445', 0);
insert into isbns (id, isbn, verification_digit) values (4, '5724355022', 0);
insert into isbns (id, isbn, verification_digit) values (5, '6993457337', 0);
insert into isbns (id, isbn, verification_digit) values (6, '1132996889', 0);
insert into isbns (id, isbn, verification_digit) values (7, '9532197546', 0);
insert into isbns (id, isbn, verification_digit) values (8, '8269322525', 0);
insert into isbns (id, isbn, verification_digit) values (9, '4565761265', 0);
insert into isbns (id, isbn, verification_digit) values (10, '4476752961', 0);