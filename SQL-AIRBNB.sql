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


CREATE TABLE calificacion(
id_calif INT auto_increment primary key not null,
id_hues INT NOT NULL,
id_prop INT NOT NULL,
calif INT NOT NULL,
foreign key (id_hues) references huesped(id_hues),
foreign key (id_prop) references propiedad(id_prop)
);

-- INSERCION DE DATOS
INSERT INTO propiedad VALUES
(NULL, 4, 'Diego gibson', 'Departamento', 'Estacionamiento', 55000,	1),
(NULL, 4, 'Antartida argentina', 'Casa', 'Aire acondicionado', 60000,	2),
(NULL, 8, 'Moldes',	'Casa', 'Jardin',	120000, 3),
(NULL, 3, 'Lujan',	'Hotel','Wifi',	76500, 4),
(NULL, 5, 'Luzuriaga', 	'Casa',	'Cocina', 34500, 5),
(NULL, 6, 'Pueyrredon',	'Casa', 'Acceso a la playa', 12300,	6),
(NULL, 3, 'Bulevard Buenos Aires',	'Departamento',	'Wifi',	54300, 7),
(NULL, 2, 'Ucrania', 'Hotel', 'Acceso a la playa',	77000, 8),
(NULL, 3, 'Jose Hernandez', 'Casa de huespedes', 'Wifi', 8000, 9),
(NULL, 7, 'Moldes', 'Casa', 'Estacionamiento', 64770, 10);

INSERT INTO calificacion VALUES
(NULL, 1,1,5),
(NULL, 2, 2, 4),
(NULL, 3, 3, 3),
(NULL, 4, 4, 5),
(NULL, 5, 5, 4),
(NULL, 6, 6, 4),
(NULL, 7, 7, 5),
(NULL, 8, 8, 2),
(NULL, 9, 9, 2),
(NULL, 10, 10, 1);


-- FUNCTION 

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
    DELIMITER ;
    
-- VISTAS

CREATE OR REPLACE VIEW anfitrion_view AS
	(SELECT lastn_anfi, name_anfi FROM anfitrion);
    
SELECT * FROM anfitrion_view;

CREATE OR REPLACE VIEW huesped_view AS
	(SELECT lastn_hues, name_hues, dni_hues 
	FROM huesped
    ORDER BY lastn_hues DESC);

SELECT * FROM huesped_view;


-- PROCEDURE

DELIMITER $$
CREATE PROCEDURE huespedes_sp ()
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

--  INSERCION DE REGISSTRACION TRANSACCIONALES CON SAVEPOINT, REVISION DE SAVEPOINT
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