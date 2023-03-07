CREATE DATABASE airbnbDanteTabo;
use airbnbDanteTabo;

CREATE TABLE huesped (
id_hues INT auto_increment primary key not null,
lastn_hues VARCHAR(50) NOT NULL,
name_hues VARCHAR(50) NOT NULL,
dni_hues VARCHAR(15) NOT NULL,
mail_hues VARCHAR(50) NOT NULL,
num_hues INT NOT NULL
);

CREATE TABLE anfitrion (
id_anfi INT auto_increment primary key not null,
lastn_anfi VARCHAR(50) NOT NULL, 
name_anfi VARCHAR(50) NOT NULL,
dni_anfi VARCHAR(15) NOT NULL,
mail_anfi VARCHAR(50) NOT NULL,
num_anfi INT NOT NULL
);

CREATE TABLE propiedad(
id_prop INT auto_increment primary key not null,
limit_hues INT NOT NULL,
direc_prop VARCHAR(100),
tipo_prop VARCHAR(20),
fecha_prop DATE NOT NULL,
serv_prop VARCHAR(20),
prec_prop INT NOT NULL,
id_anfi INT NOT NULL,
foreign key (id_anfi) references anfitrion(id_anfi)
);

CREATE TABLE reserva(
id_reser INT auto_increment primary key not null,
fech_reser_inicio DATE NOT NULL,
fech_reser_fin DATE NOT NULL,
cant_hues INT NOT NULL,
id_hues INT NOT NULL,
id_prop INT NOT NULL,
id_pago INT NOT NULL,
id_anfi INT NOT NULL,
foreign key (id_hues) references huesped(id_hues),
foreign key (id_prop) references propiedad(id_prop),
foreign key (id_anfi) references anfitrion(id_anfi)
);

CREATE TABLE pago(
id_pago INT auto_increment primary key not null,
fech_pago DATE NOT NULL,
monto_total INT NOT NULL,
id_hues INT NOT NULL,
id_reser INT NOT NULL,
id_prop INT NOT NULL,
foreign key (id_hues) references huesped(id_hues),
foreign key (id_reser) references reserva(id_reser),
foreign key (id_prop) references propiedad(id_prop)
);

ALTER TABLE reserva ADD foreign key (id_pago) references pago(id_pago);

CREATE TABLE calificacion(
id_calif INT auto_increment primary key not null,
id_hues INT NOT NULL,
id_prop INT NOT NULL,
calif INT NOT NULL,
foreign key (id_hues) references huesped(id_hues),
foreign key (id_prop) references propiedad(id_prop)
);


DELIMITER $$
CREATE FUNCTION huespedDni (p_id INT) 
RETURNS INT
    DETERMINISTIC
    BEGIN 
        DECLARE dni INT;
        SELECT dni_hues
        INTO dni
        FROM huesped 
        WHERE id_hues = p_dni;
        RETURN dni;
    END$$
    DELIMITER ;
    

DELIMITER $$
CREATE FUNCTION fullname (
    id_hues_param INT
    ) RETURNS VARCHAR (100)
    DETERMINISTIC
    BEGIN 
        DECLARE fullname VARCHAR (100);
        SELECT name_hues || lastn_hues
        INTO fullname
        FROM huesped 
        WHERE id_hues = id_hues_param;
        RETURN fullname;
   END$$
    DELIMITER ;huespedhuesped

CREATE OR REPLACE VIEW anfitrion_view AS
	(SELECT lastn_anfi, name_anfi FROM anfitrion);
    
SELECT * FROM anfitrion_view;

CREATE OR REPLACE VIEW huesped_view AS
	(SELECT lastn_hues, name_hues, dni_hues 
	FROM huesped
    ORDER BY lastn_hues DESC);

SELECT * FROM huesped_view;


DELIMITER $$
CREATE PROCEDURE sp_get_names ()
BEGIN
	SELECT * FROM huesped;

END$$
DELIMITER ;

-- TCL -- TRANSACCIONES

START TRANSACTION;
	DELETE FROM airbnbdantetabo.anfitrion where id_anfi = 1;
	DELETE FROM airbnbdantetabo.anfitrion where id_anfi = 2;
    
-- VALIDAR EL REVERSION
-- ROLLBACK;

-- APLICAR LA TRANSACCION
COMMIT;

-- CONSULTA LA TABLA 
SELECT * FROM airbnbdantetabo.anfitrion;

-- 2) INSERCION DE REGISSTRACION TRANSACCIONALES CON SAVEPOINT, REVISION DE SAVEPOINT
START TRANSACTION;
INSERT INTO airbnbdantetabo.huesped (id_hues, lastn_hues, name_hues, dni_hues, mail_hues, num_hues) VALUES
(NULL, 'Manuccio', 'Mario', 42135510, 'marosmanu@gmail.com', 1164211765);

INSERT INTO airbnbdantetabo.huesped (id_hues, lastn_hues, name_hues, dni_hues, mail_hues, num_hues) VALUES
(NULL, 'Taro', 'Ernesto', 41456789, 'taroe@gmail.com', 1161262920);

INSERT INTO airbnbdantetabo.huesped (id_hues, lastn_hues, name_hues, dni_hues, mail_hues, num_hues) VALUES
(NULL, 'Gomez', 'Claudia', 41348132, 'gomezc@gmail.com', 1167890987);

INSERT INTO airbnbdantetabo.huesped (id_hues, lastn_hues, name_hues, dni_hues, mail_hues, num_hues) VALUES
(NULL, 'Rodriguez', 'Nancy', 32890678, 'nancyrodriguez@gmail.com', 1112346789);

SAVEPOINT ACTUALIZACION1;

INSERT INTO airbnbdantetabo.huesped (id_hues, lastn_hues, name_hues, dni_hues, mail_hues, num_hues) VALUES
(NULL, 'Lopez', 'Andrea', 418567765, 'andrealopez@gmail.com', 1176538907);

INSERT INTO airbnbdantetabo.huesped (id_hues, lastn_hues, name_hues, dni_hues, mail_hues, num_hues) VALUES
(NULL, 'Tramota', 'Guillermo', 40123456, 'tramrtag@gmail.com', 1113579864);

INSERT INTO airbnbdantetabo.huesped (id_hues, lastn_hues, name_hues, dni_hues, mail_hues, num_hues) VALUES
(NULL, 'Lamote', 'Ricardo', 40987456, 'ricardo.lamote@gmail.com', 1109876543);

INSERT INTO airbnbdantetabo.huesped (id_hues, lastn_hues, name_hues, dni_hues, mail_hues, num_hues) VALUES
(NULL, 'Leonispi', 'Flavia', 4123789, 'peonispi.flavia@gmail.com', 1113567963);

SAVEPOINT ACTUALIZACION2;

ROLLBACK TO ACTUALIZACION1;

SELECT * FROM airbnbdantetabo.huesped;




