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
CREATE TABLE Subvencion(
id int NOT NULL PRIMARY KEY,
tipo VARCHAR(140),
numero NUMERIC(5,2));

--8)
CREATE TABLE Edificio(
id INT NOT NULL PRIMARY KEY,
nombre VARCHAR(50));

--***************************************************************

--9)
CREATE TABLE Bitacora(
correlativo VARCHAR(50) NOT NULL PRIMARY KEY,
nie_alumno INT NOT NULL,
dui_responsable VARCHAR(10) NOT NULL,
FOREIGN KEY (dui_responsable) REFERENCES Responsable (dui),
FOREIGN KEY (nie_alumno) REFERENCES Alumno (nie));

--10)
CREATE TABLE BitacoraXdocente(
id INT NOT NULL PRIMARY KEY,
coorelativo VARCHAR(50) NOT NULL,
dui_docente VARCHAR(10) NOT NULL,
fecha_hora DATE,
tipo VARCHAR(50),
comentario VARCHAR(150),
FOREIGN KEY (coorelativo) REFERENCES Bitacora (correlativo),
FOREIGN KEY (dui_docente) REFERENCES Docente (dui));

--11)
CREATE TABLE Empleado(
id INT NOT NULL  PRIMARY KEY,
area VARCHAR(50) NOT NULL,
dui_responsable VARCHAR(10) NOT NULL,
FOREIGN KEY (dui_responsable) REFERENCES Responsable (dui));

--12)
CREATE TABLE Estudiante(
nie INT NOT NULL PRIMARY KEY,--( NO ES EL MISMO NIE DE LA TABLA ALUMNO, el estudiante de esta tabla es el que funge como docente o responsable, no el alumno)
dui_responsable VARCHAR(10),
dui_docente VARCHAR(10),
FOREIGN KEY (dui_responsable) REFERENCES Responsable (dui),
FOREIGN KEY (dui_docente) REFERENCES Docente(dui));

--13)
CREATE TABLE Profesor(
id INT NOT NULL  PRIMARY KEY,
dui_docente VARCHAR(10) NOT NULL,
FOREIGN KEY (dui_docente) REFERENCES Docente(dui));

--14)
CREATE TABLE Relaciona(
id INT NOT NULL  PRIMARY KEY,
correlativo VARCHAR(50) NOT NULL,
coorelativo_destino VARCHAR(50) NOT NULL,
FOREIGN KEY (correlativo) REFERENCES Bitacora(correlativo),
FOREIGN KEY (coorelativo_destino) REFERENCES Bitacora(correlativo));

--15)
CREATE TABLE Otorga(
id INT NOT NULL  PRIMARY KEY,
id_Subvencion INT NOT NULL,
nie_alumno INT NOT NULL,
anno DATE,
FOREIGN KEY (nie_alumno) REFERENCES Alumno(nie),
FOREIGN KEY (id_Subvencion) REFERENCES Subvencion(id)); 

--16)
CREATE TABLE Matricula(
id SERIAL PRIMARY KEY,
nie INT NOT NULL,
id_seccion INT NOT NULL,
anno INT NOT NULL,
FOREIGN KEY (nie) REFERENCES Alumno(nie),
FOREIGN KEY (id_seccion) REFERENCES Seccion(id));

--17)
CREATE TABLE Estudia(
id INT NOT NULL  PRIMARY KEY,
nie INT NOT NULL,
id_carrera INT NOT NULL,
anno DATE NOT NULL,
FOREIGN KEY (nie) REFERENCES Estudiante(nie),
FOREIGN KEY (id_carrera) REFERENCES Carrera(id));

--18)
CREATE TABLE Talonario(
id INT NOT NULL PRIMARY KEY,
nie_alumno INT NOT NULL,
id_pago INT NOT NULL,--FK
monto NUMERIC(5,2) NOT NULL,
estado VARCHAR(150) NOT NULL,
fecha_pago DATE NOT NULL,
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


--deben salir 19 tablas en total

--***************************************************************
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
--Tabla: Estudiante--

INSERT INTO Estudiante (nie,dui_docente,dui_responsable) VALUES (16410921,'16761006-4',null);
INSERT INTO Estudiante (nie,dui_docente,dui_responsable) VALUES (16300730,null,'16180504-3');
INSERT INTO Estudiante (nie,dui_docente,dui_responsable) VALUES (16301204,'16701229-2',null);


--***********************************************************************************************************--
--Tabla: Profesor--
INSERT INTO Profesor (id,dui_docente) VALUES (1,'16970415-5');
INSERT INTO Profesor (id,dui_docente) VALUES (2,'16351211-8');
INSERT INTO Profesor (id,dui_docente) VALUES (3,'16851203-6');
INSERT INTO Profesor (id,dui_docente) VALUES (4,'16380520-5');
INSERT INTO Profesor (id,dui_docente) VALUES (5,'16770629-9');
INSERT INTO Profesor (id,dui_docente) VALUES (6,'16830727-5');
INSERT INTO Profesor (id,dui_docente) VALUES (7,'16991127-9');
INSERT INTO Profesor (id,dui_docente) VALUES (8,'16990125-2');
INSERT INTO Profesor (id,dui_docente) VALUES (9,'16480905-3');
INSERT INTO Profesor (id,dui_docente) VALUES (10,'16461023-8');
INSERT INTO Profesor (id,dui_docente) VALUES (11,'16990410-4');
INSERT INTO Profesor (id,dui_docente) VALUES (12,'16280226-9');
INSERT INTO Profesor (id,dui_docente) VALUES (13,'16291004-4');
INSERT INTO Profesor (id,dui_docente) VALUES (15,'16441015-4');

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

--tabla: Otorga
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(1,2,16981120,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(2,2,16420327,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(3,4,16500116,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(4,3,16801118,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(5,1,16490216,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(6,4,16360718,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(7,3,16130113,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(8,1,16340112,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(9,3,16971101,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(10,2,16360622,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(11,2,16010603,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(12,2,16840725,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(13,3,16340111,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(14,3,16250714,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(15,3,16990801,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(16,2,16820907,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(17,2,16650523,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(18,1,16420515,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(19,4,16440801,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(20,2,16081015,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(21,1,16381121,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(22,4,16220615,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(23,2,16570110,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(24,1,16980202,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(25,4,16800622,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(26,3,16620716,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(27,3,16920319,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(28,2,16260113,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(29,4,16371118,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(30,3,16311217,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(31,2,16540104,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(32,4,16560817,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(33,3,16611027,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(34,1,16820129,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(35,4,16380305,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(36,3,16171119,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(37,2,16340712,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(38,2,16310212,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(39,4,16471222,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(40,1,16421010,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(41,3,16351029,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(42,2,16891001,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(43,2,16150610,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(44,4,16840721,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(45,4,16151119,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(46,3,16680622,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(47,2,16120615,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(48,1,16020927,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(49,2,16030517,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(50,3,16380503,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(51,2,16450211,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(52,2,16010208,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(53,1,16041204,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(54,3,16131006,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(55,4,16870129,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(56,4,16640229,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(57,1,16040602,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(58,1,16230704,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(59,2,16090806,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(60,2,16031107,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(61,2,16550810,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(62,2,16800803,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(63,1,16310916,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(64,1,16630515,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(65,3,16160914,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(66,4,16030417,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(67,4,16011015,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(68,2,16240409,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(69,4,16260624,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(70,1,16100321,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(71,1,16300802,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(72,4,16300908,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(73,4,16361119,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(74,1,16290830,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(75,1,16071014,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(76,3,16120427,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(77,3,16500907,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(78,2,16361222,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(79,1,16650611,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(80,1,16730811,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(81,3,16540414,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(82,2,16590710,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(83,3,16900722,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(84,2,16470823,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(85,1,16810625,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(86,4,16770610,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(87,4,16470526,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(88,4,16270802,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(89,1,16910213,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(90,1,16110623,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(91,1,16541019,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(92,1,16741101,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(93,1,16161113,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(94,1,16560207,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(95,4,16030220,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(96,3,16871210,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(97,4,16810924,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(98,2,16591210,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(99,4,16001227,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(100,4,16981228,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(101,1,16680827,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(102,3,16311214,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(103,4,16540110,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(104,4,16080302,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(105,4,16520721,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(106,3,16611004,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(107,2,16261115,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(108,3,16210212,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(109,1,16761220,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(110,1,16640220,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(111,3,16460429,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(112,4,16700329,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(113,1,16850209,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(114,1,16790803,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(115,1,16090824,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(116,2,16141023,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(117,1,16741116,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(118,1,16260407,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(119,2,16031017,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(120,2,16981219,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(121,2,16280918,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(122,1,16080918,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(123,4,16410313,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(124,1,16101226,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(125,3,16320317,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(126,1,16821009,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(127,2,16171205,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(128,2,16120611,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(129,2,16180509,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(130,2,16810826,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(131,1,16070827,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(132,2,16310709,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(133,3,16680812,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(134,1,16680122,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(135,3,16270812,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(136,4,16100713,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(137,4,16380721,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(138,4,16140417,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(139,2,16030626,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(140,1,16371227,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(141,4,16841115,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(142,1,16310310,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(143,4,16830701,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(144,3,16940106,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(145,1,16890219,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(146,2,16100830,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(147,4,16640114,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(148,4,16010817,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(149,4,16020611,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(150,2,16681025,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(151,2,16770611,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(152,4,16300307,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(153,4,16160307,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(154,1,16910202,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(155,3,16870415,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(156,3,16640530,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(157,1,16660218,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(158,1,16930211,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(159,1,16810926,'1/1/2021');
INSERT INTO Otorga (id,id_Subvencion,nie_alumno,anno) VALUES(160,3,16590107,'1/1/2021');

--***************************************************************************************************************

INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16981120,3,'1/1/2021 1:1:34','1:1:34','1:11:34');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16420327,1,'1/1/2021 8:10:13','8:10:13','8:20:13');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16500116,2,'1/1/2021 6:5:57','6:5:57','6:15:57');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16801118,1,'1/1/2021 6:5:59','6:5:59','6:15:59');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16490216,2,'1/1/2021 4:9:13','4:9:13','4:19:13');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16360718,2,'1/1/2021 4:9:55','4:9:55','4:19:55');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16130113,3,'1/1/2021 5:3:59','5:3:59','5:13:59');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16340112,3,'1/1/2021 7:1:27','7:1:27','7:11:27');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16971101,2,'1/1/2021 4:7:24','4:7:24','4:17:24');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16360622,1,'1/1/2021 9:7:38','9:7:38','9:17:38');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16010603,3,'1/1/2021 5:9:54','5:9:54','5:19:54');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16840725,3,'1/1/2021 5:2:44','5:2:44','5:12:44');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16340111,1,'1/1/2021 2:7:2','2:7:2','2:17:2');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16250714,3,'1/1/2021 8:8:1','8:8:1','8:18:1');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16990801,3,'1/1/2021 9:4:40','9:4:40','9:14:40');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16820907,1,'1/1/2021 5:1:59','5:1:59','5:11:59');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16650523,3,'1/1/2021 9:2:17','9:2:17','9:12:17');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16420515,2,'1/1/2021 9:2:38','9:2:38','9:12:38');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16440801,1,'1/1/2021 9:10:31','9:10:31','9:20:31');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16081015,2,'1/1/2021 4:8:30','4:8:30','4:18:30');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16381121,3,'1/1/2021 4:6:15','4:6:15','4:16:15');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16220615,1,'1/1/2021 1:8:51','1:8:51','1:18:51');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16570110,2,'1/1/2021 10:2:51','10:2:51','10:12:51');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16980202,2,'1/1/2021 5:3:31','5:3:31','5:13:31');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16800622,1,'1/1/2021 9:2:54','9:2:54','9:12:54');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16620716,2,'1/1/2021 7:4:15','7:4:15','7:14:15');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16920319,1,'1/1/2021 2:6:53','2:6:53','2:16:53');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16260113,1,'1/1/2021 3:1:9','3:1:9','3:11:9');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16371118,3,'1/1/2021 9:8:30','9:8:30','9:18:30');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16311217,3,'1/1/2021 4:4:19','4:4:19','4:14:19');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16540104,2,'1/1/2021 5:2:13','5:2:13','5:12:13');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16560817,3,'1/1/2021 4:6:32','4:6:32','4:16:32');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16611027,1,'1/1/2021 9:3:25','9:3:25','9:13:25');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16820129,1,'1/1/2021 2:7:46','2:7:46','2:17:46');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16380305,2,'1/1/2021 2:5:46','2:5:46','2:15:46');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16171119,1,'1/1/2021 6:2:10','6:2:10','6:12:10');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16340712,1,'1/1/2021 4:5:41','4:5:41','4:15:41');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16310212,1,'1/1/2021 8:10:36','8:10:36','8:20:36');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16471222,2,'1/1/2021 7:9:25','7:9:25','7:19:25');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16421010,2,'1/1/2021 2:4:55','2:4:55','2:14:55');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16351029,2,'1/1/2021 1:4:11','1:4:11','1:14:11');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16891001,3,'1/1/2021 5:5:3','5:5:3','5:15:3');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16150610,2,'1/1/2021 4:8:7','4:8:7','4:18:7');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16840721,2,'1/1/2021 5:9:17','5:9:17','5:19:17');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16151119,1,'1/1/2021 10:7:50','10:7:50','10:17:50');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16680622,1,'1/1/2021 5:9:24','5:9:24','5:19:24');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16120615,3,'1/1/2021 7:3:37','7:3:37','7:13:37');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16020927,3,'1/1/2021 3:4:37','3:4:37','3:14:37');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16030517,1,'1/1/2021 8:7:26','8:7:26','8:17:26');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16380503,1,'1/1/2021 6:1:5','6:1:5','6:11:5');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16450211,2,'1/1/2021 2:2:26','2:2:26','2:12:26');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16010208,2,'1/1/2021 6:7:28','6:7:28','6:17:28');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16041204,1,'1/1/2021 2:2:33','2:2:33','2:12:33');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16131006,2,'1/1/2021 7:2:25','7:2:25','7:12:25');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16870129,1,'1/1/2021 4:9:8','4:9:8','4:19:8');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16640229,1,'1/1/2021 1:7:0','1:7:0','1:17:0');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16040602,2,'1/1/2021 3:4:38','3:4:37','3:14:37');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16230704,2,'1/1/2021 10:3:53','10:3:53','10:13:53');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16090806,2,'1/1/2021 7:3:28','7:3:28','7:13:28');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16031107,3,'1/1/2021 6:1:48','6:1:48','6:11:48');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16800803,1,'1/1/2021 6:4:37','6:4:37','6:14:37');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16630515,1,'1/1/2021 7:5:47','7:5:47','7:15:47');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16030417,1,'1/1/2021 9:8:47','9:8:47','9:18:47');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16240409,2,'1/1/2021 5:10:47','5:10:47','5:20:47');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16100321,1,'1/1/2021 3:5:58','3:5:58','3:15:58');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16300908,3,'1/1/2021 7:8:55','7:8:55','7:18:55');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16290830,1,'1/1/2021 7:8:13','7:8:13','7:18:13');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16120427,2,'1/1/2021 8:4:10','8:4:10','8:14:10');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16361222,2,'1/1/2021 2:7:49','2:7:49','2:17:49');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16730811,1,'1/1/2021 3:4:12','3:4:12','3:14:12');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16590710,2,'1/1/2021 4:6:54','4:6:54','4:16:54');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16470823,3,'1/1/2021 7:10:23','7:10:23','7:20:23');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16770610,1,'1/1/2021 7:3:40','7:3:40','7:13:40');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16270802,1,'1/1/2021 7:5:27','7:5:27','7:15:27');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16110623,1,'1/1/2021 10:8:45','10:8:45','10:18:45');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16741101,2,'1/1/2021 4:5:47','4:5:47','4:15:47');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16560207,1,'1/1/2021 9:10:57','9:10:57','9:20:57');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16871210,2,'1/1/2021 4:5:48','4:5:48','4:15:48');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16591210,3,'1/1/2021 3:7:56','3:7:56','3:17:56');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16981228,3,'1/1/2021 2:7:43','2:7:43','2:17:43');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16311214,2,'1/1/2021 3:7:0','3:7:0','3:17:0');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16080302,3,'1/1/2021 4:6:31','4:6:31','4:16:31');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16611004,3,'1/1/2021 2:10:14','2:10:14','2:20:14');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16210212,2,'1/1/2021 10:4:15','10:4:15','10:14:15');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16640220,1,'1/1/2021 7:10:22','7:10:22','7:20:22');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16700329,2,'1/1/2021 10:2:7','10:2:7','10:12:7');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16790803,3,'1/1/2021 3:5:50','3:5:50','3:15:50');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16141023,2,'1/1/2021 10:6:24','10:6:24','10:16:24');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16260407,1,'1/1/2021 2:7:15','2:7:15','2:17:15');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16981219,1,'1/1/2021 6:3:39','6:3:39','6:13:39');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16080918,1,'1/1/2021 6:1:31','6:1:31','6:11:31');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16101226,1,'1/1/2021 5:4:19','5:4:19','5:14:19');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16821009,3,'1/1/2021 4:1:32','4:1:32','4:11:32');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16120611,3,'1/1/2021 6:6:41','6:6:41','6:16:41');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16810826,3,'1/1/2021 5:2:55','5:2:55','5:12:55');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16310709,1,'1/1/2021 1:3:7','1:3:7','1:13:7');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16680122,1,'1/1/2021 4:6:48','4:6:48','4:16:48');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16100713,2,'1/1/2021 4:10:10','4:10:10','4:20:10');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16140417,2,'1/1/2021 5:5:47','5:5:47','5:15:47');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16371227,2,'1/1/2021 1:6:18','1:6:18','1:16:18');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16310310,2,'1/1/2021 5:7:33','5:7:33','5:17:33');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16940106,1,'1/1/2021 10:4:7','10:4:7','10:14:7');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16100830,3,'1/1/2021 6:7:19','6:7:19','6:17:19');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16010817,3,'1/1/2021 7:6:31','7:6:31','7:16:31');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16681025,1,'1/1/2021 9:9:56','9:9:56','9:19:56');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16300307,1,'1/1/2021 2:9:57','2:9:57','2:19:57');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16910202,2,'1/1/2021 1:9:49','1:9:49','1:19:49');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16640530,1,'1/1/2021 4:10:22','4:10:22','4:20:22');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16930211,3,'1/1/2021 2:9:7','2:9:7','2:19:7');
INSERT INTO Accede (nie_alumno,id_edificio,fecha,hora_entrada,hora_salida) VALUES(16590107,2,'1/1/2021 2:10:40','2:10:40','2:20:40');

--***************************************************************************************************************************************

INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16981120,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16420327,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16500116,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16801118,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16490216,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16360718,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16130113,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16340112,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16971101,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16360622,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16010603,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16840725,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16340111,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16250714,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16990801,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16820907,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16650523,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16420515,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16440801,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16081015,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16381121,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16220615,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16570110,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16980202,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16800622,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16620716,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16920319,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16260113,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16371118,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16311217,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16540104,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16560817,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16611027,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16820129,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16380305,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16171119,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16340712,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16310212,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16471222,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16421010,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16351029,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16891001,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16150610,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16840721,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16151119,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16680622,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16120615,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16020927,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16030517,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16380503,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16450211,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16010208,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16041204,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16131006,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16870129,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16640229,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16040602,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16230704,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16090806,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16031107,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16800803,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16630515,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16030417,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16240409,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16100321,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16300908,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16290830,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16120427,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16361222,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16730811,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16590710,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16470823,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16770610,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16270802,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16110623,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16741101,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16560207,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16871210,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16591210,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16981228,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16311214,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16080302,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16611004,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16210212,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16640220,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16700329,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16790803,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16141023,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16260407,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16981219,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16080918,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16101226,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16821009,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16120611,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16810826,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16310709,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16680122,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16100713,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16140417,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16371227,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16310310,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16940106,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16100830,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16010817,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16681025,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16300307,2,90.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16910202,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16640530,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16930211,1,60.00,'pagado','1/1/2021','1/1/2021','1/2/2021');
INSERT INTO Talonario (nie_alumno,id_pago,monto,estado,fecha_pago,fecha_admision,fecha_vencimiento) VALUES(16590107,3,110.00,'pagado','1/1/2021','1/1/2021','1/2/2021');


--***************************************************************************************************************************************

INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16981120',16981120,'16981129-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16420327',16420327,'16350423-4');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16500116',16500116,'16901008-5');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16801118',16801118,'16161125-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16490216',16490216,'16881126-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16360718',16360718,'16540808-6');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16130113',16130113,'16880618-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16340112',16340112,'16600710-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16971101',16971101,'16021027-6');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16360622',16360622,'16900809-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16010603',16010603,'16490112-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16840725',16840725,'16431020-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16340111',16340111,'16990614-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16250714',16250714,'16470226-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16990801',16990801,'16130911-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16820907',16820907,'16040118-1');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16650523',16650523,'16080725-6');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16420515',16420515,'16060126-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16440801',16440801,'16361224-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16081015',16081015,'16590609-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16381121',16381121,'16200504-6');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16220615',16220615,'16240112-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16570110',16570110,'16650713-4');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16980202',16980202,'16270208-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16800622',16800622,'16970520-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16620716',16620716,'16441204-5');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16920319',16920319,'16850627-6');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16260113',16260113,'16800813-1');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16371118',16371118,'16500504-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16311217',16311217,'16400724-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16540104',16540104,'16080927-4');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16560817',16560817,'16130114-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16611027',16611027,'16770901-5');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16820129',16820129,'16460827-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16380305',16380305,'16610405-4');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16171119',16171119,'16631211-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16340712',16340712,'16500905-4');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16310212',16310212,'16841125-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16471222',16471222,'16891105-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16421010',16421010,'16681215-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16351029',16351029,'16160210-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16891001',16891001,'16140524-5');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16150610',16150610,'16191107-6');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16840721',16840721,'16810916-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16151119',16151119,'16640525-4');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16680622',16680622,'16960806-1');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16120615',16120615,'16241020-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16020927',16020927,'16340803-6');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16030517',16030517,'16351127-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16380503',16380503,'16680419-1');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16450211',16450211,'16721019-6');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16010208',16010208,'16661008-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16041204',16041204,'16740506-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16131006',16131006,'16090418-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16870129',16870129,'16600723-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16640229',16640229,'16470414-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16040602',16040602,'16840218-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16230704',16230704,'16291129-5');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16090806',16090806,'16400615-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16031107',16031107,'16960809-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16800803',16800803,'16390408-5');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16630515',16630515,'16491120-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16030417',16030417,'16590213-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16240409',16240409,'16320929-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16100321',16100321,'16210124-5');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16300908',16300908,'16961002-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16290830',16290830,'16200324-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16120427',16120427,'16031114-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16361222',16361222,'16320903-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16730811',16730811,'16080114-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16590710',16590710,'16610725-1');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16470823',16470823,'16541203-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16770610',16770610,'16900607-4');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16270802',16270802,'16881009-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16110623',16110623,'16800817-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16741101',16741101,'16630529-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16560207',16560207,'16140601-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16871210',16871210,'16060526-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16591210',16591210,'16191123-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16981228',16981228,'16860806-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16311214',16311214,'16310806-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16080302',16080302,'16400414-4');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16611004',16611004,'16760727-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16210212',16210212,'16930122-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16640220',16640220,'16650613-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16700329',16700329,'16541104-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16790803',16790803,'16610406-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16141023',16141023,'16310612-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16260407',16260407,'16880111-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16981219',16981219,'16630604-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16080918',16080918,'16590109-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16101226',16101226,'16050714-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16821009',16821009,'16740216-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16120611',16120611,'16110217-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16810826',16810826,'16541109-4');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16310709',16310709,'16850501-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16680122',16680122,'16120703-8');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16100713',16100713,'16780313-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16140417',16140417,'16860806-1');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16371227',16371227,'16910711-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16310310',16310310,'16390511-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16940106',16940106,'16750519-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16100830',16100830,'16841125-3');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16010817',16010817,'16870724-7');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16681025',16681025,'16350504-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16300307',16300307,'16770807-1');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16910202',16910202,'16161122-0');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16640530',16640530,'16810809-9');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16930211',16930211,'16760603-2');
INSERT INTO Bitacora (correlativo,nie_alumno,dui_responsable) VALUES('COD-16590107',16590107,'16180504-3');

--************************************************************************************************************
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(1,'COD-16981120','16970415-5','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(2,'COD-16420327','16970415-5','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(3,'COD-16500116','16970415-5','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(4,'COD-16801118','16970415-5','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(5,'COD-16490216','16970415-5','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(6,'COD-16360718','16970415-5','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(7,'COD-16130113','16970415-5','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(8,'COD-16340112','16970415-5','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(9,'COD-16971101','16970415-5','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(10,'COD-16360622','16970415-5','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(11,'COD-16010603','16351211-8','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(12,'COD-16840725','16351211-8','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(13,'COD-16340111','16351211-8','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(14,'COD-16250714','16351211-8','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(15,'COD-16990801','16351211-8','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(16,'COD-16820907','16351211-8','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(17,'COD-16650523','16351211-8','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(18,'COD-16420515','16351211-8','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(19,'COD-16440801','16351211-8','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(20,'COD-16081015','16351211-8','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(21,'COD-16381121','16851203-6','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(22,'COD-16220615','16851203-6','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(23,'COD-16570110','16851203-6','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(24,'COD-16980202','16851203-6','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(25,'COD-16800622','16851203-6','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(26,'COD-16620716','16851203-6','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(27,'COD-16920319','16851203-6','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(28,'COD-16260113','16851203-6','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(29,'COD-16371118','16851203-6','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(30,'COD-16311217','16851203-6','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(31,'COD-16540104','16380520-5','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(32,'COD-16560817','16380520-5','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(33,'COD-16611027','16380520-5','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(34,'COD-16820129','16380520-5','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(35,'COD-16380305','16380520-5','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(36,'COD-16171119','16380520-5','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(37,'COD-16340712','16380520-5','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(38,'COD-16310212','16380520-5','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(39,'COD-16471222','16380520-5','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(40,'COD-16421010','16380520-5','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(41,'COD-16351029','16770629-9','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(42,'COD-16891001','16770629-9','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(43,'COD-16150610','16770629-9','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(44,'COD-16840721','16770629-9','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(45,'COD-16151119','16770629-9','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(46,'COD-16680622','16770629-9','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(47,'COD-16120615','16770629-9','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(48,'COD-16020927','16770629-9','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(49,'COD-16030517','16770629-9','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(50,'COD-16380503','16770629-9','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(51,'COD-16450211','16830727-5','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(52,'COD-16010208','16830727-5','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(53,'COD-16041204','16830727-5','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(54,'COD-16131006','16830727-5','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(55,'COD-16870129','16830727-5','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(56,'COD-16640229','16830727-5','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(57,'COD-16040602','16830727-5','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(58,'COD-16230704','16830727-5','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(59,'COD-16090806','16830727-5','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(60,'COD-16031107','16830727-5','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(61,'COD-16550810','16991127-9','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(62,'COD-16800803','16991127-9','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(63,'COD-16310916','16991127-9','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(64,'COD-16630515','16991127-9','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(65,'COD-16160914','16991127-9','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(66,'COD-16030417','16991127-9','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(67,'COD-16011015','16991127-9','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(68,'COD-16240409','16991127-9','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(69,'COD-16260624','16991127-9','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(70,'COD-16100321','16991127-9','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(71,'COD-16300802','16990125-2','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(72,'COD-16300908','16990125-2','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(73,'COD-16361119','16990125-2','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(74,'COD-16290830','16990125-2','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(75,'COD-16071014','16990125-2','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(76,'COD-16120427','16990125-2','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(77,'COD-16500907','16990125-2','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(78,'COD-16361222','16990125-2','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(79,'COD-16650611','16990125-2','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(80,'COD-16730811','16990125-2','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(81,'COD-16540414','16480905-3','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(82,'COD-16590710','16480905-3','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(83,'COD-16900722','16480905-3','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(84,'COD-16470823','16480905-3','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(85,'COD-16810625','16480905-3','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(86,'COD-16770610','16480905-3','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(87,'COD-16470526','16480905-3','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(88,'COD-16270802','16480905-3','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(89,'COD-16910213','16480905-3','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(90,'COD-16110623','16480905-3','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(91,'COD-16541019','16461023-8','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(92,'COD-16741101','16461023-8','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(93,'COD-16161113','16461023-8','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(94,'COD-16560207','16461023-8','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(95,'COD-16030220','16461023-8','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(96,'COD-16871210','16461023-8','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(97,'COD-16810924','16461023-8','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(98,'COD-16591210','16461023-8','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(99,'COD-16001227','16461023-8','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(100,'COD-16981228','16461023-8','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(101,'COD-16680827','16990410-4','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(102,'COD-16311214','16990410-4','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(103,'COD-16540110','16990410-4','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(104,'COD-16080302','16990410-4','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(105,'COD-16520721','16990410-4','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(106,'COD-16611004','16990410-4','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(107,'COD-16261115','16990410-4','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(108,'COD-16210212','16990410-4','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(109,'COD-16761220','16990410-4','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(110,'COD-16640220','16990410-4','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(111,'COD-16460429','16280226-9','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(112,'COD-16700329','16280226-9','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(113,'COD-16850209','16280226-9','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(114,'COD-16790803','16280226-9','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(115,'COD-16090824','16280226-9','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(116,'COD-16141023','16280226-9','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(117,'COD-16741116','16280226-9','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(118,'COD-16260407','16280226-9','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(119,'COD-16031017','16280226-9','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(120,'COD-16981219','16280226-9','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(121,'COD-16280918','16291004-4','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(122,'COD-16080918','16291004-4','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(123,'COD-16410313','16291004-4','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(124,'COD-16101226','16291004-4','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(125,'COD-16320317','16291004-4','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(126,'COD-16821009','16291004-4','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(127,'COD-16171205','16291004-4','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(128,'COD-16120611','16291004-4','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(129,'COD-16180509','16291004-4','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(130,'COD-16810826','16291004-4','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(131,'COD-16070827','16761006-4','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(132,'COD-16310709','16761006-4','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(133,'COD-16680812','16761006-4','1/12/2021','Notas','6');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(134,'COD-16680122','16761006-4','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(135,'COD-16270812','16761006-4','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(136,'COD-16100713','16761006-4','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(137,'COD-16380721','16761006-4','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(138,'COD-16140417','16761006-4','1/12/2021','Notas','9');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(139,'COD-16030626','16761006-4','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(140,'COD-16371227','16761006-4','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(141,'COD-16841115','16441015-4','1/12/2021','Notas','2');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(142,'COD-16310310','16441015-4','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(143,'COD-16830701','16441015-4','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(144,'COD-16940106','16441015-4','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(145,'COD-16890219','16441015-4','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(146,'COD-16100830','16441015-4','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(147,'COD-16640114','16441015-4','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(148,'COD-16010817','16441015-4','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(149,'COD-16020611','16441015-4','1/12/2021','Notas','10');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(150,'COD-16681025','16441015-4','1/12/2021','Notas','5');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(151,'COD-16770611','16701229-2','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(152,'COD-16300307','16701229-2','1/12/2021','Notas','1');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(153,'COD-16160307','16701229-2','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(154,'COD-16910202','16701229-2','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(155,'COD-16870415','16701229-2','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(156,'COD-16640530','16701229-2','1/12/2021','Notas','3');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(157,'COD-16660218','16701229-2','1/12/2021','Notas','4');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(158,'COD-16930211','16701229-2','1/12/2021','Notas','8');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(159,'COD-16810926','16701229-2','1/12/2021','Notas','7');
INSERT INTO BitacoraXdocente (id,coorelativo,dui_docente,fecha_hora,tipo,comentario) VALUES(160,'COD-16590107','16701229-2','1/12/2021','Notas','7');

--**************************************************************************
INSERT INTO Empleado (id,area,dui_responsable) VALUES(1,'Oficina','16981129-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(2,'UCA','16350423-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(3,'UCA','16901008-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(4,'UCA','16161125-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(5,'UCA','16881126-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(6,'Oficina','16540808-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(7,'UCA','16880618-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(8,'Oficina','16600710-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(9,'Oficina','16021027-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(10,'UCA','16900809-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(11,'UCA','16490112-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(12,'UCA','16431020-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(13,'Oficina','16990614-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(14,'Oficina','16470226-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(15,'UCA','16130911-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(16,'UCA','16040118-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(17,'Oficina','16080725-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(18,'Oficina','16060126-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(19,'UCA','16361224-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(20,'UCA','16590609-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(21,'UCA','16200504-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(22,'UCA','16240112-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(23,'Oficina','16650713-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(24,'UCA','16270208-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(25,'UCA','16970520-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(26,'UCA','16441204-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(27,'UCA','16850627-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(28,'Oficina','16800813-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(29,'Oficina','16500504-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(30,'Oficina','16400724-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(31,'UCA','16080927-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(32,'Oficina','16130114-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(33,'UCA','16770901-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(34,'UCA','16460827-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(35,'Oficina','16610405-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(36,'Oficina','16631211-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(37,'Oficina','16500905-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(38,'Oficina','16841125-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(39,'Oficina','16891105-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(40,'UCA','16681215-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(41,'UCA','16160210-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(42,'UCA','16140524-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(43,'UCA','16191107-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(44,'Oficina','16810916-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(45,'UCA','16640525-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(46,'Oficina','16960806-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(47,'UCA','16241020-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(48,'UCA','16340803-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(49,'UCA','16351127-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(50,'UCA','16680419-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(51,'Oficina','16721019-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(52,'UCA','16661008-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(53,'Oficina','16740506-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(54,'UCA','16090418-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(55,'UCA','16600723-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(56,'Oficina','16470414-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(57,'Oficina','16840218-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(58,'UCA','16291129-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(59,'Oficina','16400615-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(60,'UCA','16960809-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(61,'UCA','16271217-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(62,'UCA','16390408-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(63,'UCA','16141016-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(64,'Oficina','16491120-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(65,'UCA','16930229-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(66,'UCA','16590213-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(67,'Oficina','16130501-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(68,'UCA','16320929-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(69,'Oficina','16950214-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(70,'Oficina','16210124-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(71,'Oficina','16511203-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(72,'Oficina','16961002-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(73,'Oficina','16800205-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(74,'Oficina','16200324-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(75,'UCA','16100104-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(76,'UCA','16031114-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(77,'Oficina','16131210-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(78,'Oficina','16320903-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(79,'UCA','16840630-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(80,'UCA','16080114-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(81,'Oficina','16931010-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(82,'Oficina','16610725-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(83,'Oficina','16521013-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(84,'Oficina','16541203-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(85,'Oficina','16011212-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(86,'Oficina','16900607-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(87,'Oficina','16540909-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(88,'UCA','16881009-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(89,'UCA','16510426-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(90,'Oficina','16800817-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(91,'Oficina','16971123-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(92,'Oficina','16630529-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(93,'Oficina','16220723-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(94,'UCA','16140601-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(95,'UCA','16681016-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(96,'UCA','16060526-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(97,'Oficina','16150107-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(98,'Oficina','16191123-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(99,'UCA','16970821-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(100,'UCA','16860806-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(101,'UCA','16550215-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(102,'UCA','16310806-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(103,'UCA','16440207-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(104,'Oficina','16400414-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(105,'Oficina','16561113-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(106,'UCA','16760727-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(107,'Oficina','16240814-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(108,'UCA','16930122-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(109,'Oficina','16950702-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(110,'UCA','16650613-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(111,'UCA','16401002-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(112,'UCA','16541104-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(113,'UCA','16091224-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(114,'Oficina','16610406-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(115,'Oficina','16450528-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(116,'UCA','16310612-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(117,'Oficina','16960704-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(118,'UCA','16880111-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(119,'UCA','16320719-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(120,'Oficina','16630604-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(121,'UCA','16260401-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(122,'UCA','16590109-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(123,'Oficina','16791021-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(124,'Oficina','16050714-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(125,'UCA','16430917-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(126,'UCA','16740216-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(127,'Oficina','16280915-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(128,'UCA','16110217-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(129,'UCA','16070620-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(130,'Oficina','16541109-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(131,'UCA','16841009-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(132,'UCA','16850501-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(133,'UCA','16211105-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(134,'Oficina','16120703-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(135,'Oficina','16790114-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(136,'UCA','16780313-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(137,'UCA','16040422-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(138,'UCA','16860806-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(139,'Oficina','16670914-6');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(140,'Oficina','16910711-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(141,'Oficina','16940314-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(142,'UCA','16390511-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(143,'UCA','16411113-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(144,'Oficina','16750519-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(145,'Oficina','16820427-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(146,'UCA','16841125-3');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(147,'UCA','16610408-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(148,'UCA','16870724-7');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(149,'Oficina','16280719-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(150,'Oficina','16350504-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(151,'UCA','16490912-5');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(152,'UCA','16770807-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(153,'Oficina','16530524-1');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(154,'UCA','16161122-0');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(155,'Oficina','16110703-4');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(156,'UCA','16810809-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(157,'UCA','16320124-9');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(158,'UCA','16760603-2');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(159,'Oficina','16110604-8');
INSERT INTO Empleado (id,area,dui_responsable) VALUES(160,'UCA','16180504-3');

INSERT INTO Estudia (id,nie,id_carrera,anno) VALUES(1,16410921,5,'1/1/2018');
INSERT INTO Estudia (id,nie,id_carrera,anno) VALUES(2,16300730,3,'1/1/2018');
INSERT INTO Estudia (id,nie,id_carrera,anno) VALUES(3,16301204,6,'1/1/2018');


