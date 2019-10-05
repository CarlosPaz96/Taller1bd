
--CREATE TABLE 
--1)
CREATE TABLE Alumno (
nie INT NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
edad INT);
--2)
CREATE TABLE Seccion(
id INT NOT NULL PRIMARY KEY,
grado VARCHAR(20) NOT NULL,
letra CHAR(1));
--3)
CREATE TABLE Pago(
id INT NOT NULL PRIMARY KEY,
tipo VARCHAR(140),
numero NUMERIC(5,2));
--4)
CREATE TABLE Responsable(
dui VARCHAR(10) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
parentesco VARCHAR(50) NOT NULL);
--5)
CREATE TABLE Carrera(
id INT NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL);
--6)
CREATE TABLE Docente(
dui VARCHAR(10) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL);
--7)
CREATE TABLE Anno(
id INT NOT NULL PRIMARY KEY,
anno INT NOT NULL);
--8)
CREATE TABLE Subvencion(
id int NOT NULL PRIMARY KEY,
tipo VARCHAR(140),
numero NUMERIC(5,2));
--9)
CREATE TABLE Edificio(
id INT NOT NULL PRIMARY KEY,
nombre VARCHAR(50));

--***********************************************************************************
--10)
CREATE TABLE Bitacora(
correlativo VARCHAR(50) NOT NULL PRIMARY KEY,
tipo VARCHAR(150) NOT NULL,
comentario VARCHAR(140),
fecha_hora TIMESTAMP NOT NULL,
dui_responsable VARCHAR(10) NOT NULL,
FOREIGN KEY (dui_responsable) REFERENCES Responsable (dui) ON DELETE CASCADE);
--11)
CREATE TABLE Empleado(
id INT NOT NULL  PRIMARY KEY,
area VARCHAR(50) NOT NULL DEFAULT 'UCA',
dui_responsable VARCHAR(10) NOT NULL,
FOREIGN KEY (dui_responsable) REFERENCES Responsable (dui) ON DELETE CASCADE);
--12)
CREATE TABLE Estudiante(
nie INT NOT NULL PRIMARY KEY,--( NO ES EL MISMO NIE DE LA TABLA ALUMNO, el estudiante de esta tabla es el que funge como docente o responsable, no el alumno)
nombre VARCHAR(50) NOT NULL,
dui_responsable VARCHAR(10) NOT NULL,
dui_docente VARCHAR(10) NOT NULL,
FOREIGN KEY (dui_responsable) REFERENCES Responsable (dui) ON DELETE CASCADE,
FOREIGN KEY (dui_docente) REFERENCES Docente(dui) ON DELETE CASCADE);
--13)
CREATE TABLE Profesor(
id INT NOT NULL  PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
dui_docente VARCHAR(10) NOT NULL,
FOREIGN KEY (dui_docente) REFERENCES Docente(dui) ON DELETE CASCADE);
--14)
CREATE TABLE Relaciona(
id INT NOT NULL  PRIMARY KEY,
correlativo VARCHAR(50) NOT NULL,
coorelativo_destino VARCHAR(50) NOT NULL,
FOREIGN KEY (correlativo) REFERENCES Bitacora(correlativo) ON DELETE CASCADE,
FOREIGN KEY (coorelativo_destino) REFERENCES Bitacora(correlativo) ON DELETE CASCADE);
--15)
CREATE TABLE Otorga(
id INT NOT NULL  PRIMARY KEY,
id_Subvencion INT NOT NULL,
nie_alumno INT NOT NULL,
anno DATE,
FOREIGN KEY (nie_alumno) REFERENCES Alumno(nie) ON DELETE CASCADE,
FOREIGN KEY (id_Subvencion) REFERENCES Subvencion(id) ON DELETE CASCADE); 
--16)
CREATE TABLE Matricula(
id SERIAL PRIMARY KEY,
nie INT NOT NULL,
id_seccion INT NOT NULL,
anno INT NOT NULL,
FOREIGN KEY (nie) REFERENCES Alumno(nie) ON DELETE CASCADE,
FOREIGN KEY (id_seccion) REFERENCES Seccion(id) ON DELETE CASCADE);

--17)
CREATE TABLE Estudia(
id INT NOT NULL  PRIMARY KEY,
nie INT NOT NULL,
id_carrera INT NOT NULL,
anno DATE NOT NULL,
FOREIGN KEY (nie) REFERENCES Estudiante(nie) ON DELETE CASCADE,
FOREIGN KEY (id_carrera) REFERENCES Carrera(id) ON DELETE CASCADE);
--18)
CREATE TABLE Talonario(
nie_alumno INT NOT NULL,
id_pago INT NOT NULL,--FK
monto NUMERIC(5,2) NOT NULL,
estado VARCHAR(150) NOT NULL,
fecha_pago DATE NOT NULL PRIMARY KEY,
fecha_admision DATE NOT NULL,
fecha_vencimiento DATE NOT NULL,
FOREIGN KEY (nie_alumno) REFERENCES Alumno(nie) ON DELETE CASCADE,
FOREIGN KEY (id_pago) REFERENCES Pago(id) ON DELETE CASCADE);
--19)
CREATE TABLE Accede(
nie_alumno INT NOT NULL,
id_edificio INT NOT NULL,
fecha TIMESTAMP NOT NULL PRIMARY KEY,
hora_entrada TIME NOT NULL,
hora_salida TIME NOT NULL,
FOREIGN KEY (nie_alumno) REFERENCES Alumno(nie) ON DELETE CASCADE,
FOREIGN KEY (id_edificio) REFERENCES Edificio(id) ON DELETE CASCADE);
--20)
CREATE TABLE Anota(
id INT NOT NULL PRIMARY KEY,
correlativo_bitacora VARCHAR(50) NOT NULL,
dui_docente VARCHAR(10) NOT NULL,
FOREIGN KEY (dui_docente) REFERENCES Docente(dui) ON DELETE CASCADE,
FOREIGN KEY (correlativo_bitacora) REFERENCES Bitacora(correlativo) ON DELETE CASCADE);

--21)
CREATE TABLE AlumnoXResponsable(
id SERIAL PRIMARY KEY,
nie_alumno INT NOT NULL,
dui_responsable VARCHAR(10) NOT NULL,
FOREIGN KEY (nie_alumno) REFERENCES Alumno(nie) ON DELETE CASCADE,
FOREIGN KEY (dui_responsable) REFERENCES Responsable (dui) ON DELETE CASCADE);


--deben salir 20 tablas en total

--***********************************************************************************************************--
--Tabla: Alumno--
--Kinder 4--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16981120,'Chancellor','Mendez',4);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16420327,'Ulric','Rollins',4);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16500116,'Tanek','Duncan',4);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16801118,'Samantha','Fischer',4);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16490216,'Camilla','Sharpe',4);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16360718,'Sawyer','Caldwell',4);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16130113,'Marvin','Weaver',4);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16340112,'Ramona','Beard',4);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16971101,'Charles','Frank',4);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16360622,'Faith','Dennis',4);

--kinder 5--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16010603,'Jakeem','Robbins',5);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16840725,'Madison','Kemp',5);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16340111,'Anne','Merritt',5);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16250714,'Melissa','Rutledge',5);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16990801,'Reed','Norris',5);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16820907,'Kennedy','White',5);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16650523,'Chantale','Morrow',5);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16420515,'Cade','Maxwell',5);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16440801,'Riley','Rich',5);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16081015,'Isabella','Haney',5);

--Prepa --
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16381121,'Nina','Burns',6);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16220615,'David','Cooper',6);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16570110,'Carter','Solomon',6);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16980202,'Calvin','Raymond',6);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16800622,'Jessamine','Forbes',6);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16620716,'Xanthus','Chandler',6);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16920319,'Florence','Collins',6);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16260113,'Leila','Suarez',6);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16371118,'Ursula','Harding',6);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16311217,'Ferdinand','Bush',6);

--primero--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16540104,'Baker','Lynch',7);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16560817,'Cecilia','Castaneda',7);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16611027,'Kirby','Langley',7);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16820129,'Jarrod','Finch',7);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16380305,'Dalton','Phelps',7);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16171119,'Reuben','Harrington',8);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16340712,'Leo','Church',7);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16310212,'Moana','Cole',7);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16471222,'Paul','Lindsay',7);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16421010,'Nero','Serrano',8);

--segundo--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16351029,'Kevin','Ruiz',8);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16891001,'Celeste','Sampson',8);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16150610,'Craig','Chavez',8);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16840721,'Burke','Beach',8);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16151119,'Mannix','Porter',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16680622,'Leandra','Graham',8);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16120615,'Lesley','French',8);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16020927,'Irma','Blevins',8);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16030517,'Jada','Blake',8);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16380503,'Moana','Blackwell',8);

--tercero--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16450211,'Zelenia','Graham',10);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16010208,'Demetria','Perkins',10);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16041204,'Anthony','Palmer',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16131006,'Guy','Vasquez',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16870129,'Martin','Fowler',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16640229,'Brent','Hutchinson',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16040602,'Breanna','Reynolds',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16230704,'Autumn','Dalton',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16090806,'Maxwell','Goodwin',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16031107,'Graham','Hess',9);

--cuarto--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16550810,'Juliet','Lamb',10);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16800803,'Prescott','Moore',10);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16310916,'Catherine','Alexander',10);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16630515,'Nerea','Bright',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16160914,'Minerva','Hickman',10);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16030417,'Hollee','Roman',10);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16011015,'Evangeline','Banks',10);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16240409,'Kane','Roberts',10);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16260624,'Hamish','Guzman',9);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16100321,'Germaine','Powers',10);

--Quinto--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16300802,'Joel','Andrews',11);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16300908,'Hedy','Peterson',11);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16361119,'Ross','Huff',11);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16290830,'Bryar','Murray',11);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16071014,'Raja','Fernandez',12);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16120427,'Rahim','Vazquez',12);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16500907,'Raymond','Kane',11);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16361222,'Stephen','Yang',11);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16650611,'Robin','Terry',11);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16730811,'Magee','Robbins',12);

--Sexto--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16540414,'Aurelia','Beard',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16590710,'Holmes','Dorsey',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16900722,'Christen','Albert',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16470823,'Harrison','Vasquez',12);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16810625,'Sylvester','Wells',12);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16770610,'Erasmus','Berry',12);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16470526,'Murphy','Kinney',12);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16270802,'Adena','Harvey',12);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16910213,'Xavier','Curtis',12);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16110623,'Kelly','Dunlap',12);

--Septimo--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16541019,'Nigel','Salazar',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16741101,'Elton','Wagner',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16161113,'Riley','Barber',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16560207,'Griffith','Reyes',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16030220,'Brielle','Fischer',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16871210,'Helen','Solomon',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16810924,'Benjamin','Larsen',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16591210,'Bertha','Rasmussen',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16001227,'Miranda','Vasquez',14);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16981228,'Nicholas','Witt',13);

--Octavo--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16680827,'Linda','Christensen',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16311214,'Dahlia','Decker',13);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16540110,'Zephania','Harrison',14);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16080302,'Brian','Norris',14);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16520721,'Orla','Becker',14);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16611004,'Melanie','Rosa',14);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16261115,'Ingrid','Bush',14);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16210212,'Andrew','Dale',14);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16761220,'Hilary','Mcintyre',14);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16640220,'Noah','Sargent',14);

--Noveno--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16460429,'Brielle','Rich',15);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16700329,'Madaline','Pate',15);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16850209,'Jolie','Gordon',14);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16790803,'Cullen','Velez',15);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16090824,'Olivia','Lott',15);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16141023,'Oren','Hartman',15);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16741116,'Fletcher','Yang',15);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16260407,'Kimberly','Frank',15);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16031017,'Brooke','Lane',15);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16981219,'Ira','Henry',15);

--Primer Año "A" --
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16280918,'Hilda','Davidson',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16080918,'Emily','Cruz',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16410313,'Jessamine','Castillo',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16101226,'Kevyn','Harper',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16320317,'Brendan','Stafford',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16821009,'Meredith','Hayden',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16171205,'Howard','Page',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16120611,'Velma','Fletcher',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16180509,'Todd','Roberts',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16810826,'Arthur','Le',16);

--Primer Año "B"--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16070827,'Lavinia','Ortega',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16310709,'Acton','Valentine',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16680812,'Dominic','Ford',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16680122,'Hermione','Best',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16270812,'Ulla','Velez',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16100713,'Devin','Sargent',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16380721,'Reese','Welch',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16140417,'Chancellor','Stout',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16030626,'Otto','Clay',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16371227,'Chastity','Olsen',16);

--Segundo Año "A"--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16841115,'Chadwick','Salazar',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16310310,'Cora','Orr',16);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16830701,'Kuame','Salas',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16940106,'Rebecca','Blevins',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16890219,'Amery','Harmon',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16100830,'September','Hensley',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16640114,'Clarke','Wood',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16010817,'Jaden','Langley',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16020611,'Xantha','Larson',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16681025,'Ray','Huff',17);

--Segundo Año "B"--
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16770611,'Brendan','Hoover',18);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16300307,'Amela','Huff',18);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16160307,'Clayton','Zimmerman',18);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16910202,'Wendy','Salas',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16870415,'Dominique','Rollins',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16640530,'Ann','Gaines',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16660218,'Calvin','Logan',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16930211,'Sasha','Franks',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16810926,'Donovan','Weiss',17);
INSERT INTO Alumno (nie,nombre,apellido,edad) VALUES (16590107,'Jocelyn','Melendez',17);


--***********************************************************************************************************--
--Tabla: Seccion--
INSERT INTO Seccion (id,grado,letra) VALUES (1,'Kinder 4','A');
INSERT INTO Seccion (id,grado,letra) VALUES (2,'Kinder 5','A');
INSERT INTO Seccion (id,grado,letra) VALUES (3,'Preparatoria','A');
INSERT INTO Seccion (id,grado,letra) VALUES (4,'Primero','A');
INSERT INTO Seccion (id,grado,letra) VALUES (5,'Segundo','A');
INSERT INTO Seccion (id,grado,letra) VALUES (6,'Tercero','A');
INSERT INTO Seccion (id,grado,letra) VALUES (7,'Cuarto','A');
INSERT INTO Seccion (id,grado,letra) VALUES (8,'Quinto','A');
INSERT INTO Seccion (id,grado,letra) VALUES (9,'Sexto','A');
INSERT INTO Seccion (id,grado,letra) VALUES (10,'Septimo','A');
INSERT INTO Seccion (id,grado,letra) VALUES (11,'Octavo','A');
INSERT INTO Seccion (id,grado,letra) VALUES (12,'Noveno','A');
INSERT INTO Seccion (id,grado,letra) VALUES (13,'Primer Año','A');
INSERT INTO Seccion (id,grado,letra) VALUES (14,'Primer Año','B');
INSERT INTO Seccion (id,grado,letra) VALUES (15,'Segundo Año','A');
INSERT INTO Seccion (id,grado,letra) VALUES (16,'Segundo Año','B');

--***********************************************************************************************************--
--Tabla: Pago--
INSERT INTO Pago (id,tipo,numero) VALUES (1,'Mensualidad',60);
INSERT INTO Pago (id,tipo,numero) VALUES (2,'Mensualidad',90);
INSERT INTO Pago (id,tipo,numero) VALUES (3,'Mensualidad',110);

--***********************************************************************************************************--

--Tabla: Responsable--

--Kinder 4--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16981129-3','Zelenia Mccall','Quisque@ornareelit.ca','Tia');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16350423-4','Lewis Trevino','felis.Nulla@est.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16901008-5','Gil Haney','arcu.iaculis@interdum.ca','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16161125-3','Jamal Guthrie','ligula.Donec.luctus@et.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16881126-8','Ali Branch','eget.metus@dolorquam.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16540808-6','Ulla Rojas','vel@odiosemper.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16880618-3','Dominic Diaz','arcu.Morbi.sit@Suspendissealiquetmolestie.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16600710-7','Oscar Dorsey','scelerisque.scelerisque@Crassedleo.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16021027-6','Eve Clay','felis.orci.adipiscing@idsapienCras.edu','Tia');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16900809-8','Cleo Barry','tempor.bibendum.Donec@Maecenasornareegestas.ca','Tio');

--Kinder 5--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16490112-9','Lucian Flores','justo.eu.arcu@felispurus.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16431020-2','Cleo Ruiz','libero.et@commodoat.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16990614-9','Zeph Hammond','Nullam.lobortis@nisl.edu','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16470226-9','Megan Rocha','cursus.non@Integervulputate.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16130911-2','Giacomo Griffin','eget.lacus@est.org','Tia');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16040118-1','Clinton Cochran','magna.et.ipsum@fringillacursus.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16080725-6','Kimberley Morin','lacus@vel.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16060126-0','Erich Stephenson','tristique@Vivamus.org','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16361224-2','Claire Kerr','nec.luctus@sed.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16590609-0','Paloma Wright','lorem.vitae@aodiosemper.co.uk','Madre');

--Prepa--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16200504-6','Alec Cantu','sagittis.placerat@magnis.edu','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16240112-9','Nissim Butler','mauris.id.sapien@magna.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16650713-4','Jakeem Schultz','a.arcu.Sed@dictumeleifendnunc.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16270208-7','Carla Thomas','cursus.Nunc.mauris@sapiencursus.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16970520-3','Dorothy Reeves','neque.vitae@iaculislacuspede.edu','Tia');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16441204-5','Rana Mckenzie','netus.et@nequepellentesque.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16850627-6','Emerson Parks','ac.tellus.Suspendisse@nibhAliquam.edu','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16800813-1','Xavier York','auctor.velit@adipiscingMauris.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16500504-3','Hedy Stein','dignissim.lacus.Aliquam@tinciduntnibh.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16400724-7','Nigel Schneider','varius@lectus.co.uk','Padre');

--Primero--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16080927-4','Brock Haynes','Sed.eu@ullamcorperDuisat.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16130114-0','Hasad Levy','egestas.lacinia.Sed@scelerisquemollisPhasellus.edu','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16770901-5','Shaine Miller','Morbi.neque@odioAliquamvulputate.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16460827-2','Hyacinth Harvey','ante.Maecenas@Crasegetnisi.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16610405-4','Keegan Moore','vitae@nequenon.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16631211-0','Giselle Whitfield','eget@sempercursusInteger.co.uk','Tia');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16500905-4','Lani Dawson','malesuada.ut@auguescelerisque.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16841125-8','Britanni Brewer','nec.metus.facilisis@consequatnec.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16891105-9','Grady Wong','eget.tincidunt@adipiscing.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16681215-0','Signe Ramirez','iaculis.nec.eleifend@enimdiam.edu','Madre');

--Segundo--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16160210-8','Jorden Roberts','ac.urna.Ut@dictumeleifendnunc.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16140524-5','Brooke Higgins','vel.vulputate.eu@Duiscursusdiam.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16191107-6','Deirdre Alford','sed.pede.nec@eget.net','Tio');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16810916-8','Palmer Berry','accumsan.neque@utquam.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16640525-4','Laurel Larson','Cras.eu.tellus@nisi.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16960806-1','Jordan Collier','a.facilisis.non@nullaIntegervulputate.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16241020-8','Cally Jennings','natoque@auctorodio.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16340803-6','Marshall Newton','semper.et.lacinia@enimCurabiturmassa.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16351127-0','Blossom Barlow','egestas.ligula@famesacturpis.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16680419-1','Jaquelyn Shelton','tincidunt.tempus@nisiAenean.co.uk','Madre');

--Tercero--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16721019-6','Reed White','nisi.sem@egetmagna.edu','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16661008-8','Calvin Waller','nulla@ligulaNullamfeugiat.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16740506-9','Mallory Montoya','fringilla.purus.mauris@atfringilla.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16090418-7','Noah Acevedo','massa@urna.org','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16600723-3','Samuel Kim','aliquet.lobortis.nisi@arcuSed.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16470414-2','Leilani Carroll','sed.pede.Cum@Sed.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16840218-3','Price Lowery','gravida.mauris@intempuseu.ca','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16291129-5','Cade Mayer','ipsum.Curabitur@anequeNullam.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16400615-7','Davis Watkins','erat.semper@volutpat.edu','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16960809-9','Basia Bradford','amet.lorem.semper@euismodest.edu','Madre');

--cuarto--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16271217-4','Calista Holcomb','nec.orci@purussapiengravida.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16390408-5','Kareem Dawson','semper.dui@Phasellus.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16141016-2','Vanna Frye','pede.Nunc@eratnonummyultricies.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16491120-3','Alan Bolton','lobortis@Nullam.org','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16930229-4','Rogan Wall','vel.turpis.Aliquam@Proinvelnisl.net','Tio');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16590213-9','Olga Nielsen','amet.luctus.vulputate@infaucibusorci.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16130501-1','Maile Guzman','lobortis.risus.In@ligulatortordictum.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16320929-9','Carter Miller','odio.tristique.pharetra@Quisque.edu','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16950214-9','Nigel Shepherd','posuere.cubilia.Curae@pede.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16210124-5','Galvin Newman','orci.luctus.et@in.edu','Tio');

--quinto--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16511203-9','Addison Johnston','id@ipsumDonecsollicitudin.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16961002-3','Sonia Mann','dapibus@arcuMorbi.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16800205-7','Wayne Mcdowell','enim@ultricesVivamusrhoncus.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16200324-3','Benjamin Sandoval','per.inceptos.hymenaeos@Nullam.ca','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16100104-6','Christen Dawson','aliquam.adipiscing.lacus@anteipsumprimis.co.uk','Tia');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16031114-9','Oren Ortiz','neque@SuspendissesagittisNullam.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16131210-1','Genevieve Curry','dolor@rhoncusNullamvelit.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16320903-7','Sophia Lowery','accumsan@Donecfelis.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16840630-4','Cain Porter','fringilla@liberoMorbiaccumsan.org','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16080114-7','Amethyst Mcpherson','eget@interdumligulaeu.net','Madre');

--sexto--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16931010-5','Kevyn Mills','magna@dolor.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16610725-1','Shelby Rivers','eget.tincidunt@arcuacorci.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16521013-0','Cameran Morin','erat@Duis.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16541203-8','Kai Wagner','erat.vel.pede@Aliquamornare.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16011212-9','Reece May','sem.Pellentesque@milacinia.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16900607-4','Rachel Donovan','Vestibulum.ut.eros@luctusvulputatenisi.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16540909-7','Catherine Bryan','ultrices@erosnon.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16881009-2','Jelani Buckner','vulputate.posuere@in.co.uk','Tia');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16510426-6','Ralph Gay','Aliquam@dictumeu.co.uk','Tio');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16800817-0','Colby Black','tellus.Aenean.egestas@liberoProin.edu','Padre');

--septimo--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16971123-0','Brandon Kerr','nec@Cum.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16630529-3','Whilemina Hinton','Suspendisse.non.leo@quamCurabiturvel.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16220723-4','Keegan Alvarez','congue@senectusetnetus.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16140601-2','Ralph Castro','ligula.tortor@ipsum.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16681016-2','Kenyon Mcintyre','vel@Phasellus.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16060526-2','Jaime Witt','ligula@lectusante.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16150107-6','Tyrone Buckley','posuere.cubilia@rutrum.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16191123-7','Leandra Huber','volutpat.Nulla.facilisis@nuncsedlibero.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16970821-0','Iola Robbins','orci.luctus@Quisquepurussapien.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16860806-0','Aimee Sparks','dictum.Phasellus@vestibulum.edu','Madre');

--octavo--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16550215-9','Zorita Wood','eu@varius.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16310806-0','Wing Lancaster','nibh@egetipsumDonec.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16440207-0','Lucian Suarez','aliquet.magna@eu.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16400414-4','Miriam Townsend','at@dolorsit.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16561113-3','Cole Schroeder','lorem.auctor.quis@Fusce.org','Tio');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16760727-2','Simon Leonard','varius.orci.in@enimCurabitur.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16240814-6','Indigo Mccoy','ullamcorper.Duis@Integermollis.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16930122-7','Theodore Middleton','tempus.lorem@necante.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16950702-9','Jenette Cameron','et.rutrum.non@auctorullamcorper.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16650613-7','Alden Durham','enim.diam.vel@elementum.net','Padre');

--noveno--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16401002-0','Eliana Maynard','malesuada.Integer.id@metusIn.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16541104-9','Daria Waters','ridiculus.mus@placeratCrasdictum.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16091224-5','Piper Ortega','semper@In.ca','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16610406-2','Trevor Ellison','Quisque.nonummy@semvitaealiquam.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16450528-5','Lilah Clemons','felis@lectusrutrumurna.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16310612-0','Colton Davis','tincidunt.nunc.ac@DonecfringillaDonec.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16960704-8','Abel Alvarado','mollis.nec@arcu.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16880111-3','Oren Barber','Quisque@necdiamDuis.org','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16320719-7','Nevada Perry','semper@dictummagna.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16630604-3','Portia Espinoza','auctor@magnaseddui.edu','Madre');

--Primer Año A--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16260401-1','Slade Mccoy','posuere.at.velit@Morbimetus.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16590109-3','Derek Holcomb','tristique.pellentesque.tellus@metuseu.ca','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16791021-5','Calista Gentry','senectus@bibendumfermentummetus.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16050714-2','Ginger Cortez','dolor.egestas.rhoncus@ametrisusDonec.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16430917-3','Irma Barnes','lobortis@Fuscealiquet.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16740216-2','Cherokee Luna','pellentesque@Nullamvitaediam.edu','Tia');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16280915-4','Martin Clark','vulputate.posuere@mollisIntegertincidunt.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16110217-8','Erich Garrison','lacus.Quisque@dictumPhasellus.org','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16070620-1','Melanie Hodges','ante@ipsum.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16541109-4','Gannon Ferguson','ac.arcu@malesuada.co.uk','Madre');

--Primer Año B--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16841009-9','Honorato Cash','neque.sed.dictum@Morbiquisurna.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16850501-3','Britanni Wade','nibh@egettincidunt.net','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16211105-7','Brock Holmes','venenatis@ac.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16120703-8','Fallon Heath','ligula.Nullam.enim@Integertincidunt.co.uk','Tio');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16790114-5','Walker Chandler','ut.nulla@duiCum.edu','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16780313-7','Harding Vaughn','non.luctus@dui.ca','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16040422-5','Alvin Joseph','accumsan.interdum.libero@Suspendisseeleifend.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16860806-1','Zenia Holder','orci.adipiscing@lorem.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16670914-6','Plato Carrillo','Donec.tempor.est@tacitisociosquad.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16910711-3','Davis Espinoza','felis@orciPhasellusdapibus.co.uk','Padre');

--Segundo Año A--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16940314-3','Quentin Valentine','sit.amet.consectetuer@elitfermentum.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16390511-9','Lamar Puckett','enim.nec@duinectempus.ca','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16411113-1','Charissa Delacruz','Fusce.aliquam@metusurna.co.uk','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16750519-2','Colleen Mccall','Phasellus.vitae.mauris@lectusrutrum.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16820427-2','McKenzie Flowers','tempus.lorem@liberoMorbi.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16841125-3','Evelyn Cotton','ipsum.ac@sitamet.edu','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16610408-0','Ulla Walker','et.risus@necurnaet.net','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16870724-7','Fitzgerald Miller','lectus.a@montesnascetur.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16280719-1','Xantha Collins','conubia.nostra.per@nunc.com','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16350504-0','McKenzie Thornton','ante@duiCraspellentesque.edu','Madre');

--Segundo Año B--
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16490912-5','September Mcdonald','tincidunt.nibh.Phasellus@arcuiaculis.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16770807-1','Ezekiel Edwards','lorem.vitae@nuncullamcorpereu.org','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16530524-1','Camden Mullins','sem@scelerisque.edu','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16161122-0','Maisie Ballard','pulvinar@condimentum.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16110703-4','Jacob Mosley','nascetur.ridiculus.mus@metus.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16810809-9','Ima Hopper','placerat.augue@famesac.org','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16320124-9','Eric Larsen','eu.ligula.Aenean@maurisanunc.co.uk','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16760603-2','Uma Harmon','pede.Praesent.eu@elementumsem.ca','Madre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16110604-8','Felix Vance','tempus.lorem.fringilla@Vivamus.com','Padre');
INSERT INTO Responsable (dui,nombre,email,parentesco) VALUES ('16180504-3','Mara Pugh','nisl@eunequepellentesque.net','Madre');

--***********************************************************************************************************--
--Tabla: Docente--

INSERT INTO Docente (dui,nombre,email) VALUES ('16970415-5','Kyla Wallace','elit@luctus.net');
INSERT INTO Docente (dui,nombre,email) VALUES ('16351211-8','Wynne Knight','et@montesnasceturridiculus.org');
INSERT INTO Docente (dui,nombre,email) VALUES ('16851203-6','Xandra Hudson','nisi.Cum.sociis@tempor.ca');
INSERT INTO Docente (dui,nombre,email) VALUES ('16380520-5','Patricia Greer','magnis.dis.parturient@vehiculaPellentesque.com');
INSERT INTO Docente (dui,nombre,email) VALUES ('16770629-9','Indira Whitney','urna.Vivamus@risusInmi.ca');
INSERT INTO Docente (dui,nombre,email) VALUES ('16830727-5','Signe Holder','Suspendisse.sed@Etiam.co.uk');
INSERT INTO Docente (dui,nombre,email) VALUES ('16991127-9','Laura Craft','In.scelerisque.scelerisque@Quisque.org');
INSERT INTO Docente (dui,nombre,email) VALUES ('16990125-2','Stella Mcintyre','sed.sem@iaculisodio.com');
INSERT INTO Docente (dui,nombre,email) VALUES ('16480905-3','Driscoll Wheeler','mi.pede@ullamcorper.com');
INSERT INTO Docente (dui,nombre,email) VALUES ('16461023-8','Reuben Parrish','Nulla.eget@Duisdignissim.edu');
INSERT INTO Docente (dui,nombre,email) VALUES ('16990410-4','Ryan Mcleod','risus.Morbi.metus@lectuspedeet.com');
INSERT INTO Docente (dui,nombre,email) VALUES ('16280226-9','Jade Miller','aliquet@dui.ca');
INSERT INTO Docente (dui,nombre,email) VALUES ('16291004-4','Armando Day','cubilia@elitpede.org');
INSERT INTO Docente (dui,nombre,email) VALUES ('16761006-4','Callum Kirk','ipsum@mattissemper.com');
INSERT INTO Docente (dui,nombre,email) VALUES ('16441015-4','Leslie Kelley','Aliquam.erat.volutpat@pedeetrisus.net');
INSERT INTO Docente (dui,nombre,email) VALUES ('16701229-2','Cullen Everett','bibendum@enimSuspendisse.net');

--***********************************************************************************************************--
--Tabla: Subvencion--
INSERT INTO Subvencion (id,tipo,numero) VALUES (1,'Descuento',20);
INSERT INTO Subvencion (id,tipo,numero) VALUES (2,'Descuento',30);
INSERT INTO Subvencion (id,tipo,numero) VALUES (3,'Descuento',40);
INSERT INTO Subvencion (id,tipo,numero) VALUES (4,'Descuento',50);

--***********************************************************************************************************--
--Tabla: Carrera--
INSERT INTO Carrera (id,nombre) VALUES (1,'Licenciatura en Matematicas');
INSERT INTO Carrera (id,nombre) VALUES (2,'Licenciatura en Lenguaje');
INSERT INTO Carrera (id,nombre) VALUES (3,'Licenciatura en Ciencias');
INSERT INTO Carrera (id,nombre) VALUES (4,'Licenciatura en Sociales');
INSERT INTO Carrera (id,nombre) VALUES (5,'Licenciatura en Educacion Fisica');
INSERT INTO Carrera (id,nombre) VALUES (6,'Licenciatura en Docencia Kinder');

--***********************************************************************************************************--
--Tabla: Edificio--
INSERT INTO Edificio (id,nombre) VALUES (1,'Kinder');
INSERT INTO Edificio (id,nombre) VALUES (2,'Basica');
INSERT INTO Edificio (id,nombre) VALUES (3,'Media');

--***********************************************************************************************************--
--Tabla: Anno--
INSERT INTO Anno (id,Anno) VALUES (1,'2020');
INSERT INTO Anno (id,Anno) VALUES (2,'2021');


--***********************************************************************************************************--
--Tabla: EMPLEADO--
--Kinder 4--
INSERT INTO Empleado (id,dui_responsable,area) VALUES (1,'16981129-3','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (2,'16350423-4','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (3,'16901008-5','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (4,'16161125-3','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (5,'16881126-8','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (6,'16540808-6','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (7,'16880618-3','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (8,'16600710-7','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (9,'16021027-6','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (10,'16900809-8','UCA');

--Kinder 5--
INSERT INTO Empleado (id,dui_responsable,area) VALUES (11,'16490112-9','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (12,'16431020-2','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (13,'16990614-9','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (14,'16470226-9','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (15,'16130911-2','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (16,'16040118-1','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (17,'16080725-6','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (18,'16060126-0','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (19,'16361224-2','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (20,'16590609-0','UCA');

--Prepa--
INSERT INTO Empleado (id,dui_responsable,area) VALUES (21,'16200504-6','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (22,'16240112-9','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (23,'16650713-4','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (24,'16270208-7','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (25,'16970520-3','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (26,'16441204-5','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (27,'16850627-6','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (28,'16800813-1','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (29,'16500504-3','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (30,'16400724-7','UCA');

--Primero--
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (31,'16080927-4','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (32,'16130114-0','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (33,'16770901-5','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (34,'16460827-2','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (35,'16610405-4','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (36,'16631211-0','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (37,'16500905-4','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (38,'16841125-8','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (39,'16891105-9','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES  (40,'16681215-0','UCA');

--Segundo--
INSERT INTO Empleado (id,dui_responsable,area) VALUES (41,'16160210-8','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (42,'16140524-5','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (43,'16191107-6','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (44,'16810916-8','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (45,'16640525-4','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (46,'16960806-1','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (47,'16241020-8','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (48,'16340803-6','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (49,'16351127-0','UCA');
INSERT INTO Empleado (id,dui_responsable,area) VALUES (50,'16680419-1','UCA');



--***********************************************************************************************************--
--Tabla: Estudiante--

INSERT INTO Estudiante (nie,dui_docente,nombre, dui_responsable) VALUES (16410921,'16970415-5','Kyla Wallace','16870724-7');
INSERT INTO Estudiante (nie,dui_docente,nombre, dui_responsable) VALUES (16300730,'16351211-8','Wynne Knight','16110703-4');
INSERT INTO Estudiante (nie,dui_docente,nombre, dui_responsable) VALUES (16301204,'16851203-6','Xandra Hudson','16850501-3');


--***********************************************************************************************************--
--Tabla: Profesor--
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (1,'16970415-5','Kyla Wallace');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (2,'16351211-8','Wynne Knight');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (3,'16851203-6','Xandra Hudson');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (4,'16380520-5','Patricia Greer');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (5,'16770629-9','Indira Whitney');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (6,'16830727-5','Signe Holder');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (7,'16991127-9','Laura Craft');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (8,'16990125-2','Stella Mcintyre');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (9,'16480905-3','Driscoll Wheeler');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (10,'16461023-8','Reuben Parrish');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (11,'16990410-4','Ryan Mcleod');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (12,'16280226-9','Jade Miller');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (13,'16291004-4','Armando Day');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (14,'16761006-4','Callum Kirk');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (15,'16441015-4','Leslie Kelley');
INSERT INTO Profesor (id,dui_docente,nombre) VALUES (16,'16701229-2','Cullen Everett');


--***********************************************************************************************************--
--Tabla: Matricula--


--Kinder 4--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16981120,1,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16420327,1,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16500116,1,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16801118,1,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16490216,1,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16360718,1,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16130113,1,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16340112,1,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16971101,1,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16360622,1,1);

--kinder 5--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16010603,2,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16840725,2,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16340111,2,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16250714,2,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16990801,2,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16820907,2,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16650523,2,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16420515,2,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16440801,2,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16081015,2,1);

--Prepa --
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16381121,3,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16220615,3,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16570110,3,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16980202,3,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16800622,3,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16620716,3,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16920319,3,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16260113,3,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16371118,3,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16311217,3,1);

--primero--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16540104,4,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16560817,4,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16611027,4,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16820129,4,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16380305,4,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16171119,4,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16340712,4,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16310212,4,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16471222,4,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16421010,4,1);

--segundo--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16351029,5,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16891001,5,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16150610,5,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16840721,5,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16151119,5,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16680622,5,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16120615,5,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16020927,5,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16030517,5,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16380503,5,1);

--tercero--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16450211,6,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16010208,6,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16041204,6,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16131006,6,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16870129,6,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16640229,6,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16040602,6,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16230704,6,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16090806,6,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16031107,6,1);

--cuarto--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16550810,7,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16800803,7,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16310916,7,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16630515,7,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16160914,7,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16030417,7,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16011015,7,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16240409,7,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16260624,7,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16100321,7,1);

--Quinto--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16300802,8,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16300908,8,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16361119,8,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16290830,8,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16071014,8,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16120427,8,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16500907,8,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16361222,8,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16650611,8,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16730811,8,1);

--Sexto--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16540414,9,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16590710,9,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16900722,9,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16470823,9,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16810625,9,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16770610,9,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16470526,9,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16270802,9,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16910213,9,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16110623,9,1);

--Septimo--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16541019,10,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16741101,10,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16161113,10,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16560207,10,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16030220,10,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16871210,10,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16810924,10,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16591210,10,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16001227,10,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16981228,10,1);

--Octavo--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16680827,11,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16311214,11,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16540110,11,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16080302,11,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16520721,11,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16611004,11,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16261115,11,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16210212,11,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16761220,11,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16640220,11,1);

--Noveno--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16460429,12,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16700329,12,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16850209,12,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16790803,12,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16090824,12,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16141023,12,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16741116,12,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16260407,12,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16031017,12,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16981219,12,1);

--Primer Año "A" --
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16280918,13,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16080918,13,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16410313,13,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16101226,13,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16320317,13,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16821009,13,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16171205,13,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16120611,13,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16180509,13,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16810826,13,1);

--Primer Año "B"--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16070827,14,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16310709,14,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16680812,14,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16680122,14,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16270812,14,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16100713,14,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16380721,14,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16140417,14,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16030626,14,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16371227,14,1);

--Segundo Año "A"--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16841115,15,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16310310,15,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16830701,15,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16940106,15,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16890219,15,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16100830,15,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16640114,15,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16010817,15,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16020611,15,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16681025,15,1);

--Segundo Año "B"--
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16770611,16,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16300307,16,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16160307,16,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16910202,16,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16870415,16,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16640530,16,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16660218,16,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16930211,16,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16810926,16,1);
INSERT INTO Matricula (nie,id_seccion,anno) VALUES (16590107,16,1);

INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16981120,'16981129-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16420327,'16350423-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16500116,'16901008-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16801118,'16161125-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16490216,'16881126-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16360718,'16540808-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16130113,'16880618-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16340112,'16600710-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16971101,'16021027-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16360622,'16900809-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16010603,'16490112-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16840725,'16431020-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16340111,'16990614-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16250714,'16470226-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16990801,'16130911-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16820907,'16040118-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16650523,'16080725-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16420515,'16060126-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16440801,'16361224-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16081015,'16590609-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16381121,'16200504-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16220615,'16240112-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16570110,'16650713-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16980202,'16270208-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16800622,'16970520-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16620716,'16441204-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16920319,'16850627-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16260113,'16800813-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16371118,'16500504-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16311217,'16400724-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16540104,'16080927-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16560817,'16130114-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16611027,'16770901-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16820129,'16460827-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16380305,'16610405-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16171119,'16631211-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16340712,'16500905-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16310212,'16841125-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16471222,'16891105-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16421010,'16681215-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16351029,'16160210-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16891001,'16140524-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16150610,'16191107-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16840721,'16810916-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16151119,'16640525-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16680622,'16960806-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16120615,'16241020-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16020927,'16340803-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16030517,'16351127-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16380503,'16680419-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16450211,'16721019-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16010208,'16661008-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16041204,'16740506-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16131006,'16090418-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16870129,'16600723-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16640229,'16470414-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16040602,'16840218-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16230704,'16291129-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16090806,'16400615-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16031107,'16960809-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16550810,'16271217-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16800803,'16390408-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16310916,'16141016-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16630515,'16491120-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16160914,'16930229-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16030417,'16590213-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16011015,'16130501-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16240409,'16320929-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16260624,'16950214-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16100321,'16210124-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16300802,'16511203-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16300908,'16961002-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16361119,'16800205-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16290830,'16200324-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16071014,'16100104-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16120427,'16031114-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16500907,'16131210-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16361222,'16320903-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16650611,'16840630-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16730811,'16080114-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16540414,'16931010-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16590710,'16610725-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16900722,'16521013-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16470823,'16541203-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16810625,'16011212-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16770610,'16900607-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16470526,'16540909-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16270802,'16881009-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16910213,'16510426-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16110623,'16800817-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16541019,'16971123-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16741101,'16630529-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16161113,'16220723-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16560207,'16140601-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16030220,'16681016-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16871210,'16060526-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16810924,'16150107-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16591210,'16191123-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16001227,'16970821-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16981228,'16860806-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16680827,'16550215-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16311214,'16310806-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16540110,'16440207-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16080302,'16400414-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16520721,'16561113-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16611004,'16760727-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16261115,'16240814-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16210212,'16930122-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16761220,'16950702-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16640220,'16650613-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16460429,'16401002-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16700329,'16541104-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16850209,'16091224-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16790803,'16610406-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16090824,'16450528-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16141023,'16310612-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16741116,'16960704-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16260407,'16880111-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16031017,'16320719-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16981219,'16630604-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16280918,'16260401-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16080918,'16590109-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16410313,'16791021-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16101226,'16050714-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16320317,'16430917-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16821009,'16740216-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16171205,'16280915-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16120611,'16110217-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16180509,'16070620-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16810826,'16541109-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16070827,'16841009-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16310709,'16850501-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16680812,'16211105-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16680122,'16120703-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16270812,'16790114-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16100713,'16780313-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16380721,'16040422-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16140417,'16860806-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16030626,'16670914-6');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16371227,'16910711-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16841115,'16940314-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16310310,'16390511-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16830701,'16411113-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16940106,'16750519-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16890219,'16820427-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16100830,'16841125-3');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16640114,'16610408-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16010817,'16870724-7');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16020611,'16280719-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16681025,'16350504-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16770611,'16490912-5');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16300307,'16770807-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16160307,'16530524-1');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16910202,'16161122-0');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16870415,'16110703-4');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16640530,'16810809-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16660218,'16320124-9');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16930211,'16760603-2');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16810926,'16110604-8');
INSERT INTO AlumnoXResponsable (nie_alumno,dui_responsable) VALUES(16590107,'16180504-3');


SELECT * FROM AlumnoXResponsable

--dui responsable
"16981129-3","16350423-4","16901008-5","16161125-3","16881126-8","16540808-6","16880618-3","16600710-7","16021027-6","16900809-8","16490112-9","16431020-2","16990614-9","16470226-9","16130911-2","16040118-1","16080725-6","16060126-0","16361224-2","16590609-0","16200504-6","16240112-9","16650713-4","16270208-7","16970520-3","16441204-5","16850627-6","16800813-1","16500504-3","16400724-7","16080927-4","16130114-0","16770901-5","16460827-2","16610405-4","16631211-0","16500905-4","16841125-8","16891105-9","16681215-0","16160210-8","16140524-5","16191107-6","16810916-8","16640525-4","16960806-1","16241020-8","16340803-6","16351127-0","16680419-1","16721019-6","16661008-8","16740506-9","16090418-7","16600723-3","16470414-2","16840218-3","16291129-5","16400615-7","16960809-9","16271217-4"."16390408-5"."16141016-2"."16491120-3"."16930229-4"."16590213-9"."16130501-1"."16320929-9"."16950214-9"."16210124-5"."16511203-9"."16961002-3"."16800205-7"."16200324-3"."16100104-6"."16031114-9"."16131210-1"."16320903-7"."16840630-4"."16080114-7"."16931010-5"."16610725-1"."16521013-0"."16541203-8"."16011212-9"."16900607-4"."16540909-7"."16881009-2"."16510426-6"."16800817-0"."16971123-0"."16630529-3"."16220723-4"."16140601-2"."16681016-2"."16060526-2"."16150107-6"."16191123-7"."16970821-0"."16860806-0"."16550215-9"."16310806-0"."16440207-0"."16400414-4"."16561113-3"."16760727-2"."16240814-6"."16930122-7","16950702-9","16650613-7","16401002-0","16541104-9","16091224-5","16610406-2","16450528-5","16310612-0","16960704-8","16880111-3","16320719-7","16630604-3","16260401-1","16590109-3","16791021-5","16050714-2","16430917-3","16740216-2","16280915-4","16110217-8","16070620-1","16541109-4","16841009-9","16850501-3","16211105-7","16120703-8","16790114-5","16780313-7","16040422-5","16860806-1","16670914-6","16910711-3","16940314-3","16390511-9","16411113-1","16750519-2","16820427-2","16841125-3","16610408-0","16870724-7","16280719-1","16350504-0","16490912-5","16770807-1","16530524-1","16161122-0","16110703-4","16810809-9","16320124-9","16760603-2","16110604-8","16180504-3"

--nie alumno
16981120,16420327,16500116,16801118,16490216,16360718,16130113,16340112,16971101,16360622,16010603,16840725,16340111,16250714,16990801,16820907,16650523,16420515,16440801,16081015,16381121,16220615,16570110,16980202,16800622,16620716,16920319,16260113,16371118,16311217,16540104,16560817,16611027,16820129,16380305,16171119,16340712,16310212,16471222,16421010,16351029,16891001,16150610,16840721,16151119,16680622,16120615,16020927,16030517,16380503,16450211,16010208,16041204,16131006,16870129,16640229,16040602,16230704,16090806,16031107,16550810,16800803,16310916,16630515,16160914,16030417,16011015,16240409,16260624,16100321,16300802,16300908,16361119,16290830,16071014,16120427,16500907,16361222,16650611,16730811,16540414,16590710,16900722,16470823,16810625,16770610,16470526,16270802,16910213,16110623,16541019,16741101,16161113,16560207,16030220,16871210,16810924,16591210,16001227,16981228,16680827,16311214,16540110,16080302,16520721,16611004,16261115,16210212,16761220,16640220,16460429,16700329,16850209,16790803,16090824,16141023,16741116,16260407,16031017,16981219,16280918,16080918,16410313,16101226,16320317,16821009,16171205,16120611,16180509,16810826,16070827,16310709,16680812,16680122,16270812,16100713,16380721,16140417,16030626,16371227,16841115,16310310,16830701,16940106,16890219,16100830,16640114,16010817,16020611,16681025,16770611,16300307,16160307,16910202,16870415,16640530,16660218,16930211,16810926,16590107

--Dui Docente
"16970415-5","16351211-8","16851203-6","16380520-5","16770629-9","16830727-5","16991127-9","16990125-2","16480905-3","16461023-8","16990410-4","16280226-9","16291004-4","16761006-4","16441015-4","16701229-2"

