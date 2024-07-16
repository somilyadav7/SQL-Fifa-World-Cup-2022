DROP TABLE Team cascade constraint;
DROP TABLE Manager cascade constraint;
DROP TABLE Player cascade constraint;
DROP TABLE Attacking_stats cascade constraint;
DROP TABLE Defensive_stats cascade constraint;
DROP TABLE GoalKeeper cascade constraint;
DROP TABLE Stadium cascade constraint;
DROP TABLE match cascade constraint;
DROP TABLE Player_Award cascade constraint;
DROP TABLE Team_award cascade constraint;

CREATE TABLE Team
(
  Name VARCHAR(50),
  Region VARCHAR(50) NOT NULL,
  Group_position INT NOT NULL,
  Group_no INT NOT NULL,
  PRIMARY KEY (Name)
);

CREATE TABLE Manager
(
  Manager_id INT NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Team_name VARCHAR(50),
  DOB DATE NOT NULL,
  Nationality VARCHAR(50) NOT NULL,
  PRIMARY KEY (Manager_id),
  FOREIGN KEY(Team_name) REFERENCES Team(Name)
);

CREATE TABLE Player
(
  Name VARCHAR(100) NOT NULL,
  Team_name VARCHAR(50), 
  Yellow_Card INT,
  Red_Card INT,
  No_of_matches INT,
  Position VARCHAR(3) NOT NULL,
  PRIMARY KEY (Name),
  FOREIGN KEY(Team_name) REFERENCES Team(Name)
);

CREATE TABLE Attacking_stats
(
  Player_Name VARCHAR(100),
  Goal_scored INT NOT NULL,
  Assist INT NOT NULL,
  PRIMARY KEY (Goal_scored,Player_Name),
  FOREIGN KEY(Player_Name) REFERENCES Player(name)
);

CREATE TABLE Defensive_stats
(
  Player_Name VARCHAR(100),
  Tackles INT NOT NULL,
  PRIMARY KEY (Tackles,Player_Name),
  FOREIGN KEY(Player_Name) REFERENCES Player(name)
);

CREATE TABLE GoalKeeper
(
  Player_Name VARCHAR(100),
  Saves INT,
  Clean_sheets INT,
  Shot_faced INT,
  PRIMARY KEY (Clean_sheets,Player_Name),
  FOREIGN KEY(Player_Name) REFERENCES Player(name)
);

CREATE TABLE Stadium
(
  Name VARCHAR(50),
  Capacity INT NOT NULL,
  Location VARCHAR(50) NOT NULL,
  PRIMARY KEY (Name)
);

CREATE TABLE match
(
  Match_id INT,
  Match_Date DATE NOT NULL,
  Team1 VARCHAR(50),
  Team2 VARCHAR(50),
  Team1_Score INT NOT NULL,
  Team2_score INT NOT NULL,
  Stadium_name VARCHAR(50),
  Match_type VARCHAR(50) NOT NULL,
  PRIMARY KEY (Match_id),
  FOREIGN KEY(Team1) REFERENCES Team(Name),
  FOREIGN KEY(Team2) REFERENCES Team(Name),
  FOREIGN KEY(Stadium_name) REFERENCES Stadium(Name)
);

CREATE TABLE Player_Award
(
  Player_Name VARCHAR(100),
  Award_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (Award_name,Player_Name),
  FOREIGN KEY(Player_Name) REFERENCES Player(name)
);

CREATE TABLE Team_award
(
  Team_name VARCHAR(50), 
  Award_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (Award_name,Team_name),
  FOREIGN KEY(Team_name) REFERENCES Team(Name)
);

INSERT INTO team VALUES ('Netherlands','Europe',1,1);
INSERT INTO team VALUES ('Senegal','Africa',2,1);
INSERT INTO team VALUES ('Ecuador','South America',3,1);
INSERT INTO team VALUES ('Qatar','Asia',4,1);
INSERT INTO team VALUES ('England','Europe',1,2);
INSERT INTO team VALUES ('United States','North America',2,2);
INSERT INTO team VALUES ('IR Iran','Asia',3,2);
INSERT INTO team VALUES ('Wales','Europe',4,2);
INSERT INTO team VALUES ('Argentina','South America',1,3);
INSERT INTO team VALUES ('Poland','Europe',2,3);
INSERT INTO team VALUES ('Mexico','North America',3,3);
INSERT INTO team VALUES ('Saudi Arabia','Asia',4,3);
INSERT INTO team VALUES ('France','Europe',1,4);
INSERT INTO team VALUES ('Australia','Oceania',2,4);
INSERT INTO team VALUES ('Tunisia','Africa',3,4);
INSERT INTO team VALUES ('Denmark','Europe',4,4);
INSERT INTO team VALUES ('Japan','Asia',1,5);
INSERT INTO team VALUES ('Spain','Europe',2,5);
INSERT INTO team VALUES ('Germany','Europe',3,5);
INSERT INTO team VALUES ('Costa Rica','North America',4,5);
INSERT INTO team VALUES ('Morocco','Africa',1,6);
INSERT INTO team VALUES ('Croatia','Europe',2,6);
INSERT INTO team VALUES ('Belgium','Europe',3,6);
INSERT INTO team VALUES ('Canada','North America',4,6);
INSERT INTO team VALUES ('Brazil','South America',1,7);
INSERT INTO team VALUES ('Switzerland','Europe',2,7);
INSERT INTO team VALUES ('Cameroon','Africa',3,7);
INSERT INTO team VALUES ('Serbia','Europe',4,7);
INSERT INTO team VALUES ('Portugal','Europe',1,8);
INSERT INTO team VALUES ('Korea Republic','Asia',2,8);
INSERT INTO team VALUES ('Uruguay','South America',3,8);
INSERT INTO team VALUES ('Ghana','Africa',4,8);
--Src https://www.kaggle.com/datasets/swaptr/fifa-world-cup-2022-statistics

INSERT INTO MANAGER VALUES (1000,'Felix Sanchez','Qatar','01-JAN-1975','Spanish');
INSERT INTO MANAGER VALUES (1001,'Gustavo Alfaro','Ecuador','14-AUG-1962','Argentine');
INSERT INTO MANAGER VALUES (1002,'Aliou Cisse','Senegal','24-MAR-1976','Senegalese');
INSERT INTO MANAGER VALUES (1003,'Louis van Gaal','Netherlands','08-AUG-1951','Dutch');
INSERT INTO MANAGER VALUES (1004,'Gareth Southgate','England','03-SEP-1970','English');
INSERT INTO MANAGER VALUES (1005,'Carlos Queiroz','IR Iran','01-MAR-1953','Portuguese');
INSERT INTO MANAGER VALUES (1006,'Gregg Berhalter','United States','01-AUG-1973','American');
INSERT INTO MANAGER VALUES (1007,'Rob Page','Wales','03-SEP-1974','Welsh');
INSERT INTO MANAGER VALUES (1008,'Lionel Scaloni','Argentina','16-MAY-1978','Argentine');
INSERT INTO MANAGER VALUES (1009,'Herve Renard','Saudi Arabia','30-SEP-1968','French');
INSERT INTO MANAGER VALUES (1010,'Gerardo Martino' ,'Mexico' ,'20-NOV-1962' ,'Argentine' );
INSERT INTO MANAGER VALUES (1011,'Czeslaw Michniewicz' ,'Poland' ,'12-FEB-1970' ,'Polish' );
INSERT INTO MANAGER VALUES (1012,'Didier Deschamps' ,'France' ,'15-OCT-1968' ,'French' );
INSERT INTO MANAGER VALUES (1013,'Graham Arnold' ,'Australia' ,'03-AUG-1963' ,'Australian' );
INSERT INTO MANAGER VALUES (1014,'Kasper Hjulmand' ,'Denmark' ,'09-APR-1972' ,'Danish' );
INSERT INTO MANAGER VALUES (1015,'Jalel Kadri' ,'Tunisia' ,'14-DEC-1971' ,'Tunisian');
INSERT INTO MANAGER VALUES (1016,'Luis Enrique','Spain','08-MAY-1970','Spanish');
INSERT INTO MANAGER VALUES (1017,'Luis Fernando Suarez','Costa Rica','23-DEC-1959','Colombian');
INSERT INTO MANAGER VALUES (1018,'Hansi Flick','Germany','24-FEB-1965','German');
INSERT INTO MANAGER VALUES (1019,'Hajime Moriyasu','Japan','23-AUG-1968','Japanese');
INSERT INTO MANAGER VALUES (1020,'Roberto Martinez','Belgium','13-JUL-1973','Spanish');
INSERT INTO MANAGER VALUES (1021,'John Herdman','Canada','19-JUL-1975','English');
INSERT INTO MANAGER VALUES (1022,'Walid Regragui','Morocco','23-SEP-1975','Moroccan');
INSERT INTO MANAGER VALUES (1023,'Zlatko Dalic','Croatia','26-OCT-1966','Croatian');
INSERT INTO MANAGER VALUES (1024,'Tite' ,'Brazil' ,'25-MAY-1961' ,'Brazilian');
INSERT INTO MANAGER VALUES (1025,'Dragan Stojkovic' ,'Serbia' ,'03-MAR-1965' ,'Serbian');
INSERT INTO MANAGER VALUES (1026,'Murat Yakin' ,'Switzerland' ,'15-SEP-1974' ,'Swiss');
INSERT INTO MANAGER VALUES (1027,'Rigobert Song' ,'Cameroon' ,'01-JUL-1976' ,'Cameroonian');
INSERT INTO MANAGER VALUES (1028,'Fernando Santos','Portugal', '10-OCT-1954' , 'Portuguese');
INSERT INTO MANAGER VALUES (1029,'Otto Addo','Ghana','09-JUN-1975','German,Ghanaian');
INSERT INTO MANAGER VALUES (1030,'Diego Alonso','Uruguay','16-APR-1975','Uruguayan');
INSERT INTO MANAGER VALUES (1031,'Paulo Bento','Korea Republic','20-JUN-1969','Portuguese');
--Src https://www.90min.com/posts/every-manager-at-the-2022-world-cup

INSERT INTO player VALUES ('Aaron Mooy','Australia',1,0,4,'MF');
INSERT INTO player VALUES ('Aaron Ramsey','Wales',1,0,3,'MF');
INSERT INTO player VALUES ('Abdelhamid Sabiri','Morocco',1,0,5,'MF');
INSERT INTO player VALUES ('Abdelkarim Hassan','Qatar',0,0,3,'DF');
INSERT INTO player VALUES ('Abderrazak Hamdallah','Morocco',0,0,4,'FW');
INSERT INTO player VALUES ('Abdessamad Ezzalzouli','Morocco',0,0,3,'FW');
INSERT INTO player VALUES ('Abdou Diallo','Senegal',0,0,4,'DF');
INSERT INTO player VALUES ('Abdul Fatawu Issahaku','Ghana',0,0,1,'FW');
INSERT INTO player VALUES ('Abdulaziz Hatem','Qatar',0,0,3,'MF');
INSERT INTO player VALUES ('Abdulelah Al-Amri','Saudi Arabia',2,0,3,'DF');
INSERT INTO player VALUES ('Abdulellah Al-Malki','Saudi Arabia',2,0,2,'MF');
INSERT INTO player VALUES ('Abdullah Madu','Saudi Arabia',1,0,1,'DF');
INSERT INTO player VALUES ('Abdulrahman Al-Aboud','Saudi Arabia',0,0,2,'MF');
INSERT INTO player VALUES ('Abolfazl Jalali','IR Iran',1,0,1,'DF');
INSERT INTO player VALUES ('Achraf Dari','Morocco',1,0,3,'DF');
INSERT INTO player VALUES ('Achraf Hakimi','Morocco',0,0,7,'DF');
INSERT INTO player VALUES ('Adrien Rabiot','France',1,0,6,'MF');
INSERT INTO player VALUES ('Agustin Canobbio','Uruguay',0,0,1,'MF');
INSERT INTO player VALUES ('Ahmad Nourollahi','IR Iran',0,0,3,'MF');
INSERT INTO player VALUES ('Ahmed Alaaeldin','Qatar',0,0,1,'FW');
INSERT INTO player VALUES ('Aimen Dahmen','Tunisia',0,0,3,'GK');
INSERT INTO player VALUES ('Ajdin Hrustic','Australia',0,0,3,'MF');
INSERT INTO player VALUES ('Akram Afif','Qatar',1,0,3,'FW');
INSERT INTO player VALUES ('Alan Franco','Ecuador',0,0,2,'MF');
INSERT INTO player VALUES ('Alejandro Balde','Spain',0,0,4,'DF');
INSERT INTO player VALUES ('Aleksandar Mitrovic','Serbia',1,0,3,'FW');
INSERT INTO player VALUES ('Alex Sandro','Brazil',0,0,3,'DF');
INSERT INTO player VALUES ('Alex Telles','Brazil',0,0,2,'DF');
INSERT INTO player VALUES ('Alexander Bah','Denmark',0,0,2,'DF');
INSERT INTO player VALUES ('Alexander Djiku','Ghana',0,0,2,'DF');
INSERT INTO player VALUES ('Alexis Mac Allister','Argentina',0,0,6,'MF');
INSERT INTO player VALUES ('Alexis Vega','Mexico',0,0,3,'FW');
INSERT INTO player VALUES ('Ali Abdi','Tunisia',1,0,3,'DF');
INSERT INTO player VALUES ('Ali Al Hassan','Saudi Arabia',1,0,1,'MF');
INSERT INTO player VALUES ('Ali Al-Bulaihi','Saudi Arabia',1,0,3,'DF');
INSERT INTO player VALUES ('Ali Assadalla','Qatar',0,0,1,'MF');
INSERT INTO player VALUES ('Ali Gholizadeh','IR Iran',0,0,3,'MF');
INSERT INTO player VALUES ('Ali Karimi','IR Iran',0,0,3,'MF');
INSERT INTO player VALUES ('Ali Maaloul','Tunisia',0,0,1,'DF');
INSERT INTO player VALUES ('Alidu Seidu','Ghana',2,0,2,'DF');
INSERT INTO player VALUES ('Alireza Beiranvand','IR Iran',0,0,2,'GK');
INSERT INTO player VALUES ('Alireza Jahanbakhsh','IR Iran',2,0,2,'MF');
INSERT INTO player VALUES ('Alisson','Brazil',0,0,4,'GK');
INSERT INTO player VALUES ('Alistair Johnston','Canada',1,0,3,'DF');
INSERT INTO player VALUES ('Almoez Ali','Qatar',1,0,3,'FW');
INSERT INTO player VALUES ('Alphonso Davies','Canada',1,0,3,'MF');
INSERT INTO player VALUES ('Amadou Onana','Belgium',2,0,2,'MF');
INSERT INTO player VALUES ('Anass Zaroury','Morocco',0,0,1,'FW');
INSERT INTO player VALUES ('Andre-Frank Zambo Anguissa','Cameroon',0,0,3,'MF');
INSERT INTO player VALUES ('Andreas Christensen','Denmark',1,0,3,'DF');
INSERT INTO player VALUES ('Andreas Cornelius','Denmark',1,0,3,'FW');
INSERT INTO player VALUES ('Andreas Skov Olsen','Denmark',0,0,2,'FW');
INSERT INTO player VALUES ('Andrej Kramaric','Croatia',0,0,7,'FW');
INSERT INTO player VALUES ('Andries Noppert','Netherlands',0,0,5,'GK');
INSERT INTO player VALUES ('Andrija Zivkovic','Serbia',0,0,3,'DF');
INSERT INTO player VALUES ('Andre Ayew','Ghana',1,0,3,'MF');
INSERT INTO player VALUES ('Andre Onana','Cameroon',0,0,1,'GK');
INSERT INTO player VALUES ('Andre Silva','Portugal',0,0,1,'FW');
INSERT INTO player VALUES ('Andres Guardado','Mexico',0,0,1,'MF');
INSERT INTO player VALUES ('Anis Ben Slimane','Tunisia',0,0,2,'MF');
INSERT INTO player VALUES ('Ansu Fati','Spain',0,0,2,'FW');
INSERT INTO player VALUES ('Ante Budimir','Croatia',0,0,2,'FW');
INSERT INTO player VALUES ('Anthony Contreras','Costa Rica',1,0,3,'FW');
INSERT INTO player VALUES ('Antoine Griezmann','France',1,0,7,'MF');
INSERT INTO player VALUES ('Antoine Semenyo','Ghana',0,0,2,'FW');
INSERT INTO player VALUES ('Antonee Robinson','United States',0,0,4,'DF');
INSERT INTO player VALUES ('Antonio Rudiger','Germany',0,0,3,'DF');
INSERT INTO player VALUES ('Antony','Brazil',0,0,4,'FW');
INSERT INTO player VALUES ('Antonio Silva','Portugal',0,0,1,'DF');
INSERT INTO player VALUES ('Ao Tanaka','Japan',0,0,3,'MF');
INSERT INTO player VALUES ('Ardon Jasari','Switzerland',0,0,1,'FW');
INSERT INTO player VALUES ('Arkadiusz Milik','Poland',1,0,3,'FW');
INSERT INTO player VALUES ('Artur Jedrzejczyk','Poland',0,0,1,'DF');
INSERT INTO player VALUES ('Asiri Haitham','Saudi Arabia',0,0,1,'FW');
INSERT INTO player VALUES ('Assim Madibo','Qatar',1,0,2,'MF');
INSERT INTO player VALUES ('Atiba Hutchinson','Canada',0,0,3,'MF');
INSERT INTO player VALUES ('Aurelien Tchouameni','France',1,0,7,'MF');
INSERT INTO player VALUES ('Awer Mabil','Australia',0,0,2,'MF');
INSERT INTO player VALUES ('Axel Disasi','France',0,0,3,'DF');
INSERT INTO player VALUES ('Axel Witsel','Belgium',0,0,3,'MF');
INSERT INTO player VALUES ('Ayase Ueda','Japan',0,0,1,'FW');
INSERT INTO player VALUES ('Aymeric Laporte','Spain',1,0,3,'DF');
INSERT INTO player VALUES ('Aziz Behich','Australia',1,0,4,'DF');
INSERT INTO player VALUES ('Azzedine Ounahi','Morocco',1,0,7,'MF');
INSERT INTO player VALUES ('Aissa Laidouni','Tunisia',1,0,3,'MF');
INSERT INTO player VALUES ('Baba Rahman','Ghana',0,0,3,'DF');
INSERT INTO player VALUES ('Badr Banoun','Morocco',0,0,3,'DF');
INSERT INTO player VALUES ('Bailey Wright','Australia',0,0,1,'DF');
INSERT INTO player VALUES ('Bamba Dieng','Senegal',0,0,4,'FW');
INSERT INTO player VALUES ('Bartosz Bereszynski','Poland',1,0,4,'DF');
INSERT INTO player VALUES ('Bassam Al-Rawi','Qatar',0,0,1,'DF');
INSERT INTO player VALUES ('Ben Davies','Wales',0,0,3,'DF');
INSERT INTO player VALUES ('Benjamin Pavard','France',0,0,1,'DF');
INSERT INTO player VALUES ('Bernardo Silva','Portugal',0,0,5,'MF');
INSERT INTO player VALUES ('Bilal El Khannous','Morocco',0,0,1,'MF');
INSERT INTO player VALUES ('Borna Barisic','Croatia',1,0,1,'DF');
INSERT INTO player VALUES ('Borna Sosa','Croatia',0,0,5,'DF');
INSERT INTO player VALUES ('Boualem Khoukhi','Qatar',0,0,3,'DF');
INSERT INTO player VALUES ('Boulaye Dia','Senegal',1,0,4,'FW');
INSERT INTO player VALUES ('Brandon Aguilera','Costa Rica',0,0,3,'MF');
INSERT INTO player VALUES ('Breel Embolo','Switzerland',0,0,4,'FW');
INSERT INTO player VALUES ('Brenden Aaronson','United States',0,0,4,'MF');
INSERT INTO player VALUES ('Brennan Johnson','Wales',0,0,3,'FW');
INSERT INTO player VALUES ('Bruno Fernandes','Portugal',1,0,4,'FW');
INSERT INTO player VALUES ('Bruno Guimaraes','Brazil',1,0,2,'MF');
INSERT INTO player VALUES ('Bruno Petkovic','Croatia',1,0,6,'FW');
INSERT INTO player VALUES ('Bryan Mbeumo','Cameroon',0,0,3,'FW');
INSERT INTO player VALUES ('Bryan Oviedo','Costa Rica',0,0,3,'DF');
INSERT INTO player VALUES ('Bryan Ruiz','Costa Rica',0,0,1,'MF');
INSERT INTO player VALUES ('Bukayo Saka','England',0,0,4,'FW');
INSERT INTO player VALUES ('Callum Wilson','England',0,0,2,'FW');
INSERT INTO player VALUES ('Cameron Carter-Vickers','United States',0,0,1,'DF');
INSERT INTO player VALUES ('Carlos Gruezo','Ecuador',0,0,1,'MF');
INSERT INTO player VALUES ('Carlos Martinez','Costa Rica',0,0,1,'DF');
INSERT INTO player VALUES ('Carlos Soler','Spain',0,0,2,'MF');
INSERT INTO player VALUES ('Casemiro','Brazil',1,0,4,'MF');
INSERT INTO player VALUES ('Celso Borges','Costa Rica',1,0,3,'MF');
INSERT INTO player VALUES ('Charles De Ketelaere','Belgium',0,0,1,'FW');
INSERT INTO player VALUES ('Charly Rodriguez','Mexico',0,0,2,'MF');
INSERT INTO player VALUES ('Cheikhou Kouyate','Senegal',0,0,1,'MF');
INSERT INTO player VALUES ('Cho Guesung','Korea Republic',1,0,4,'FW');
INSERT INTO player VALUES ('Cho Yumin','Korea Republic',0,0,1,'FW');
INSERT INTO player VALUES ('Chris Mepham','Wales',1,0,3,'DF');
INSERT INTO player VALUES ('Christian Bassogog','Cameroon',1,0,1,'MF');
INSERT INTO player VALUES ('Christian Eriksen','Denmark',0,0,3,'MF');
INSERT INTO player VALUES ('Christian Fassnacht','Switzerland',0,0,1,'FW');
INSERT INTO player VALUES ('Christian Norgaard','Denmark',0,0,1,'MF');
INSERT INTO player VALUES ('Christian Pulisic','United States',0,0,4,'FW');
INSERT INTO player VALUES ('Christopher Wooh','Cameroon',0,0,1,'DF');
INSERT INTO player VALUES ('Cody Gakpo','Netherlands',0,0,5,'FW');
INSERT INTO player VALUES ('Collins Fai','Cameroon',2,0,3,'DF');
INSERT INTO player VALUES ('Connor Roberts','Wales',0,0,3,'DF');
INSERT INTO player VALUES ('Craig Goodwin','Australia',0,0,4,'MF');
INSERT INTO player VALUES ('Cristian Romero','Argentina',2,0,7,'DF');
INSERT INTO player VALUES ('Cristiano Ronaldo','Portugal',0,0,5,'FW');
INSERT INTO player VALUES ('Cyle Larin','Canada',0,0,3,'FW');
INSERT INTO player VALUES ('Cesar Azpilicueta','Spain',0,0,2,'DF');
INSERT INTO player VALUES ('Cesar Montes','Mexico',0,0,3,'DF');
INSERT INTO player VALUES ('Daichi Kamada','Japan',0,0,4,'FW');
INSERT INTO player VALUES ('Daizen Maeda','Japan',0,0,3,'FW');
INSERT INTO player VALUES ('Daley Blind','Netherlands',0,0,5,'DF');
INSERT INTO player VALUES ('Damian Szymanski','Poland',0,0,1,'MF');
INSERT INTO player VALUES ('Dani Alves','Brazil',0,0,2,'DF');
INSERT INTO player VALUES ('Dani Carvajal','Spain',0,0,2,'DF');
INSERT INTO player VALUES ('Dani Olmo','Spain',0,0,4,'FW');
INSERT INTO player VALUES ('Daniel Amartey','Ghana',2,0,3,'DF');
INSERT INTO player VALUES ('Daniel Chacon','Costa Rica',0,0,1,'MF');
INSERT INTO player VALUES ('Daniel James','Wales',1,0,3,'FW');
INSERT INTO player VALUES ('Daniel Kyereh','Ghana',0,0,3,'MF');
INSERT INTO player VALUES ('Danilo','Brazil',1,0,3,'DF');
INSERT INTO player VALUES ('Danilo Pereira','Portugal',1,0,1,'DF');
INSERT INTO player VALUES ('Danny Ward','Wales',0,0,2,'GK');
INSERT INTO player VALUES ('Darko Lazovic','Serbia',0,0,1,'DF');
INSERT INTO player VALUES ('Darwin Nunez','Uruguay',1,0,3,'FW');
INSERT INTO player VALUES ('David Raum','Germany',0,0,3,'DF');
INSERT INTO player VALUES ('David Wotherspoon','Canada',0,0,1,'MF');
INSERT INTO player VALUES ('Davy Klaassen','Netherlands',0,0,4,'MF');
INSERT INTO player VALUES ('Dayot Upamecano','France',0,0,5,'DF');
INSERT INTO player VALUES ('DeAndre Yedlin','United States',0,0,2,'DF');
INSERT INTO player VALUES ('Declan Rice','England',0,0,5,'MF');
INSERT INTO player VALUES ('Dejan Lovren','Croatia',1,0,6,'DF');
INSERT INTO player VALUES ('Denis Odoi','Ghana',0,0,1,'DF');
INSERT INTO player VALUES ('Denis Zakaria','Switzerland',0,0,2,'MF');
INSERT INTO player VALUES ('Denzel Dumfries','Netherlands',2,1,5,'DF');
INSERT INTO player VALUES ('Devis Epassy','Cameroon',0,0,2,'GK');
INSERT INTO player VALUES ('Diego Godin','Uruguay',0,0,2,'DF');
INSERT INTO player VALUES ('Diogo Costa','Portugal',0,0,5,'GK');
INSERT INTO player VALUES ('Diogo Dalot','Portugal',0,0,3,'DF');
INSERT INTO player VALUES ('Djibril Sow','Switzerland',0,0,4,'MF');
INSERT INTO player VALUES ('Djorkaeff Reasco','Ecuador',0,0,1,'FW');
INSERT INTO player VALUES ('Dominik Livakovic','Croatia',1,0,7,'GK');
INSERT INTO player VALUES ('Dries Mertens','Belgium',0,0,2,'MF');
INSERT INTO player VALUES ('Dusan Tadic','Serbia',0,0,3,'MF');
INSERT INTO player VALUES ('Dusan Vlahovic','Serbia',0,0,2,'FW');
INSERT INTO player VALUES ('Dylan Bronn','Tunisia',0,0,2,'DF');
INSERT INTO player VALUES ('Eden Hazard','Belgium',0,0,3,'MF');
INSERT INTO player VALUES ('Ederson','Brazil',0,0,1,'GK');
INSERT INTO player VALUES ('Edimilson Fernandes','Switzerland',0,0,3,'FW');
INSERT INTO player VALUES ('Edinson Cavani','Uruguay',1,0,3,'FW');
INSERT INTO player VALUES ('Edouard Mendy','Senegal',0,0,4,'GK');
INSERT INTO player VALUES ('Edson Alvarez','Mexico',1,0,2,'MF');
INSERT INTO player VALUES ('Eduardo Camavinga','France',0,0,2,'DF');
INSERT INTO player VALUES ('Ehsan Hajsafi','IR Iran',0,0,3,'MF');
INSERT INTO player VALUES ('Ellyes Skhiri','Tunisia',0,0,3,'MF');
INSERT INTO player VALUES ('Emiliano Martinez','Argentina',1,0,7,'GK');
INSERT INTO player VALUES ('Enner Valencia','Ecuador',0,0,3,'FW');
INSERT INTO player VALUES ('Enzo Ebosse','Cameroon',0,0,1,'DF');
INSERT INTO player VALUES ('Enzo Fernandez','Argentina',1,0,7,'MF');
INSERT INTO player VALUES ('Eray Comert','Switzerland',1,0,2,'DF');
INSERT INTO player VALUES ('Eric Dier','England',0,0,2,'DF');
INSERT INTO player VALUES ('Eric Maxim Choupo-Moting','Cameroon',0,0,3,'FW');
INSERT INTO player VALUES ('Erick Gutierrez','Mexico',1,0,1,'MF');
INSERT INTO player VALUES ('Ethan Ampadu','Wales',0,0,3,'MF');
INSERT INTO player VALUES ('Everton Ribeiro','Brazil',0,0,1,'MF');
INSERT INTO player VALUES ('Exequiel Palacios','Argentina',0,0,3,'MF');
INSERT INTO player VALUES ('Fabian Frei','Switzerland',0,0,2,'MF');
INSERT INTO player VALUES ('Fabian Rieder','Switzerland',1,0,2,'FW');
INSERT INTO player VALUES ('Fabian Schar','Switzerland',2,0,2,'DF');
INSERT INTO player VALUES ('Fabinho','Brazil',0,0,1,'MF');
INSERT INTO player VALUES ('Facundo Pellistri','Uruguay',0,0,3,'MF');
INSERT INTO player VALUES ('Famara Diedhiou','Senegal',0,0,2,'FW');
INSERT INTO player VALUES ('Federico Valverde','Uruguay',0,0,3,'MF');
INSERT INTO player VALUES ('Ferjani Sassi','Tunisia',1,0,2,'MF');
INSERT INTO player VALUES ('Ferran Torres','Spain',0,0,4,'FW');
INSERT INTO player VALUES ('Filip Kostic','Serbia',0,0,2,'DF');
INSERT INTO player VALUES ('Filip Mladenovic','Serbia',0,0,1,'DF');
INSERT INTO player VALUES ('Filip Duricic','Serbia',0,0,2,'MF');
INSERT INTO player VALUES ('Firas Al-Buraikan','Saudi Arabia',0,0,3,'MF');
INSERT INTO player VALUES ('Fode Ballo-Toure','Senegal',0,0,1,'DF');
INSERT INTO player VALUES ('Fran Karacic','Australia',0,0,2,'DF');
INSERT INTO player VALUES ('Francisco Calvo','Costa Rica',2,0,2,'DF');
INSERT INTO player VALUES ('Fred','Brazil',1,0,4,'MF');
INSERT INTO player VALUES ('Frenkie de Jong','Netherlands',1,0,5,'MF');
INSERT INTO player VALUES ('Felix Torres Caicedo','Ecuador',0,0,3,'DF');
INSERT INTO player VALUES ('Gabriel Jesus','Brazil',0,0,3,'FW');
INSERT INTO player VALUES ('Garang Kuol','Australia',0,0,2,'FW');
INSERT INTO player VALUES ('Gareth Bale','Wales',1,0,3,'FW');
INSERT INTO player VALUES ('Gavi','Spain',0,0,4,'MF');
INSERT INTO player VALUES ('Gael Ondoua','Cameroon',0,0,2,'MF');
INSERT INTO player VALUES ('Georges-Kevin N''Koudou','Cameroon',0,0,2,'FW');
INSERT INTO player VALUES ('German Pezzella','Argentina',1,0,3,'DF');
INSERT INTO player VALUES ('Gerson Torres','Costa Rica',0,0,1,'MF');
INSERT INTO player VALUES ('Ghaylene Chaalali','Tunisia',0,0,1,'MF');
INSERT INTO player VALUES ('Gideon Mensah','Ghana',0,0,1,'DF');
INSERT INTO player VALUES ('Gio Reyna','United States',0,0,2,'FW');
INSERT INTO player VALUES ('Giorgian De Arrascaeta','Uruguay',0,0,2,'MF');
INSERT INTO player VALUES ('Gleison Bremer','Brazil',0,0,2,'DF');
INSERT INTO player VALUES ('Gonzalo Montiel','Argentina',3,0,4,'DF');
INSERT INTO player VALUES ('Gonzalo Plata','Ecuador',0,0,3,'MF');
INSERT INTO player VALUES ('Goncalo Ramos','Portugal',0,0,4,'FW');
INSERT INTO player VALUES ('Granit Xhaka','Switzerland',1,0,4,'MF');
INSERT INTO player VALUES ('Gregor Kobel','Switzerland',0,0,1,'GK');
INSERT INTO player VALUES ('Grzegorz Krychowiak','Poland',1,0,4,'MF');
INSERT INTO player VALUES ('Guido Rodriguez','Argentina',0,0,1,'MF');
INSERT INTO player VALUES ('Guillermo Ochoa','Mexico',0,0,3,'GK');
INSERT INTO player VALUES ('Guillermo Varela','Uruguay',0,0,3,'DF');
INSERT INTO player VALUES ('Haji Wright','United States',0,0,4,'FW');
INSERT INTO player VALUES ('Hakim Ziyech','Morocco',0,0,7,'FW');
INSERT INTO player VALUES ('Hannibal Mejbri','Tunisia',0,0,1,'MF');
INSERT INTO player VALUES ('Haris Seferovic','Switzerland',0,0,3,'FW');
INSERT INTO player VALUES ('Harry Kane','England',0,0,5,'FW');
INSERT INTO player VALUES ('Harry Maguire','England',1,0,5,'DF');
INSERT INTO player VALUES ('Harry Souttar','Australia',0,0,4,'DF');
INSERT INTO player VALUES ('Harry Wilson','Wales',0,0,3,'MF');
INSERT INTO player VALUES ('Hassan Al Tambakti','Saudi Arabia',1,0,2,'DF');
INSERT INTO player VALUES ('Hassan Al-Haydos','Qatar',0,0,3,'MF');
INSERT INTO player VALUES ('Hattan Bahebri','Saudi Arabia',1,0,2,'MF');
INSERT INTO player VALUES ('Henry Martin','Mexico',0,0,2,'FW');
INSERT INTO player VALUES ('Hernan Galindez','Ecuador',0,0,3,'GK');
INSERT INTO player VALUES ('Hidemasa Morita','Japan',0,0,3,'MF');
INSERT INTO player VALUES ('Hiroki Ito','Japan',0,0,1,'DF');
INSERT INTO player VALUES ('Hiroki Sakai','Japan',0,0,2,'MF');
INSERT INTO player VALUES ('Hirving Lozano','Mexico',0,0,3,'FW');
INSERT INTO player VALUES ('Homam Ahmed','Qatar',1,0,3,'DF');
INSERT INTO player VALUES ('Hong Chul','Korea Republic',0,0,1,'DF');
INSERT INTO player VALUES ('Hossein Hosseini','IR Iran',0,0,2,'GK');
INSERT INTO player VALUES ('Hossein Kanaanizadegan','IR Iran',1,0,1,'DF');
INSERT INTO player VALUES ('Hugo Lloris','France',0,0,6,'GK');
INSERT INTO player VALUES ('Hwang Hee-chan','Korea Republic',1,0,2,'MF');
INSERT INTO player VALUES ('Hwang In-beom','Korea Republic',0,0,4,'MF');
INSERT INTO player VALUES ('Hwang Ui-jo','Korea Republic',0,0,4,'FW');
INSERT INTO player VALUES ('Hector Herrera','Mexico',1,0,2,'MF');
INSERT INTO player VALUES ('Hector Moreno','Mexico',1,0,3,'DF');
INSERT INTO player VALUES ('Ibrahima Konate','France',0,0,5,'DF');
INSERT INTO player VALUES ('Idrissa Gana Gueye','Senegal',2,0,3,'MF');
INSERT INTO player VALUES ('Ilias Chair','Morocco',0,0,1,'MF');
INSERT INTO player VALUES ('Iliman Ndiaye','Senegal',0,0,3,'FW');
INSERT INTO player VALUES ('Ismail Jakobs','Senegal',1,0,4,'DF');
INSERT INTO player VALUES ('Ismail Mohamad','Qatar',1,0,2,'FW');
INSERT INTO player VALUES ('Ismaila Sarr','Senegal',0,0,4,'FW');
INSERT INTO player VALUES ('Ismael Kone','Canada',0,0,3,'MF');
INSERT INTO player VALUES ('Issam Jebali','Tunisia',0,0,3,'FW');
INSERT INTO player VALUES ('Ivan Ilic','Serbia',0,0,1,'MF');
INSERT INTO player VALUES ('Ivan Perisic','Croatia',0,0,7,'FW');
INSERT INTO player VALUES ('Inaki Williams','Ghana',0,0,3,'FW');
INSERT INTO player VALUES ('Jack Grealish','England',0,0,5,'FW');
INSERT INTO player VALUES ('Jackson Irvine','Australia',2,0,4,'MF');
INSERT INTO player VALUES ('Jackson Porozo','Ecuador',0,0,2,'DF');
INSERT INTO player VALUES ('Jakub Kaminski','Poland',0,0,4,'MF');
INSERT INTO player VALUES ('Jakub Kiwior','Poland',1,0,4,'DF');
INSERT INTO player VALUES ('Jamal Musiala','Germany',0,0,3,'MF');
INSERT INTO player VALUES ('Jamie Maclaren','Australia',0,0,3,'FW');
INSERT INTO player VALUES ('Jan Bednarek','Poland',0,0,1,'DF');
INSERT INTO player VALUES ('Jan Vertonghen','Belgium',0,0,3,'DF');
INSERT INTO player VALUES ('Jason Cummings','Australia',0,0,1,'FW');
INSERT INTO player VALUES ('Jawad El Yamiq','Morocco',0,0,6,'DF');
INSERT INTO player VALUES ('Jean-Charles Castelletto','Cameroon',0,0,2,'DF');
INSERT INTO player VALUES ('Jeong Woo-yeong','Korea Republic',0,0,1,'MF');
INSERT INTO player VALUES ('Jeremy Doku','Belgium',0,0,1,'MF');
INSERT INTO player VALUES ('Jeremy Sarmiento','Ecuador',0,0,3,'MF');
INSERT INTO player VALUES ('Jerome Ngom Mbekeli','Cameroon',0,0,1,'MF');
INSERT INTO player VALUES ('Jesper Lindstrom','Denmark',0,0,3,'MF');
INSERT INTO player VALUES ('Jesus Ferreira','United States',0,0,1,'FW');
INSERT INTO player VALUES ('Jesus Gallardo','Mexico',0,0,3,'DF');
INSERT INTO player VALUES ('Jewison Bennette','Costa Rica',0,0,3,'MF');
INSERT INTO player VALUES ('Jhegson Mendez','Ecuador',2,0,2,'MF');
INSERT INTO player VALUES ('Joachim Andersen','Denmark',0,0,3,'DF');
INSERT INTO player VALUES ('Joakim Maehle','Denmark',0,0,3,'DF');
INSERT INTO player VALUES ('Joe Allen','Wales',0,0,2,'MF');
INSERT INTO player VALUES ('Joe Morrell','Wales',0,0,2,'MF');
INSERT INTO player VALUES ('Joe Rodon','Wales',1,0,3,'DF');
INSERT INTO player VALUES ('Joel Campbell','Costa Rica',1,0,3,'FW');
INSERT INTO player VALUES ('Johan Venegas','Costa Rica',0,0,1,'FW');
INSERT INTO player VALUES ('John Stones','England',0,0,5,'DF');
INSERT INTO player VALUES ('Jonas Hofmann','Germany',0,0,2,'FW');
INSERT INTO player VALUES ('Jonathan David','Canada',0,0,3,'FW');
INSERT INTO player VALUES ('Jonathan Osorio','Canada',1,0,3,'MF');
INSERT INTO player VALUES ('Jordan Ayew','Ghana',0,0,3,'FW');
INSERT INTO player VALUES ('Jordan Henderson','England',0,0,4,'MF');
INSERT INTO player VALUES ('Jordan Morris','United States',0,0,2,'FW');
INSERT INTO player VALUES ('Jordan Pickford','England',0,0,5,'GK');
INSERT INTO player VALUES ('Jordan Veretout','France',0,0,1,'MF');
INSERT INTO player VALUES ('Jordi Alba','Spain',0,0,4,'DF');
INSERT INTO player VALUES ('Jorge Eduardo Sanchez','Mexico',1,0,2,'DF');
INSERT INTO player VALUES ('Josh Sargent','United States',0,0,3,'FW');
INSERT INTO player VALUES ('Joshua Kimmich','Germany',1,0,3,'MF');
INSERT INTO player VALUES ('Josip Juranovic','Croatia',0,0,6,'DF');
INSERT INTO player VALUES ('Josip Stanisic','Croatia',0,0,1,'DF');
INSERT INTO player VALUES ('Josip Šutalo','Croatia',0,0,1,'DF');
INSERT INTO player VALUES ('Jose Cifuentes','Ecuador',0,0,2,'MF');
INSERT INTO player VALUES ('Jose Maria Gimenez','Uruguay',1,0,3,'DF');
INSERT INTO player VALUES ('Joao Cancelo','Portugal',0,0,4,'DF');
INSERT INTO player VALUES ('Joao Felix','Portugal',1,0,4,'FW');
INSERT INTO player VALUES ('Joao Mario','Portugal',0,0,2,'FW');
INSERT INTO player VALUES ('Joao Palhinha','Portugal',0,0,3,'MF');
INSERT INTO player VALUES ('Josko Gvardiol','Croatia',0,0,7,'DF');
INSERT INTO player VALUES ('Juan Foyth','Argentina',0,0,1,'DF');
INSERT INTO player VALUES ('Juan Pablo Vargas','Costa Rica',0,0,1,'DF');
INSERT INTO player VALUES ('Jude Bellingham','England',0,0,5,'MF');
INSERT INTO player VALUES ('Jules Kounde','France',1,0,6,'DF');
INSERT INTO player VALUES ('Julian Alvarez','Argentina',0,0,7,'FW');
INSERT INTO player VALUES ('Jung Woo-young','Korea Republic',2,0,4,'MF');
INSERT INTO player VALUES ('Junior Hoilett','Canada',1,0,3,'FW');
INSERT INTO player VALUES ('Junya Ito','Japan',0,0,4,'MF');
INSERT INTO player VALUES ('Jurrien Timber','Netherlands',1,0,4,'DF');
INSERT INTO player VALUES ('Kai Havertz','Germany',0,0,2,'FW');
INSERT INTO player VALUES ('Kalidou Koulibaly','Senegal',1,0,4,'DF');
INSERT INTO player VALUES ('Kalvin Phillips','England',0,0,2,'MF');
INSERT INTO player VALUES ('Kamal Miller','Canada',1,0,3,'DF');
INSERT INTO player VALUES ('Kamaldeen Sulemana','Ghana',1,0,2,'FW');
INSERT INTO player VALUES ('Kamil Glik','Poland',0,0,4,'DF');
INSERT INTO player VALUES ('Kamil Grosicki','Poland',0,0,1,'MF');
INSERT INTO player VALUES ('Kaoru Mitoma','Japan',0,0,4,'MF');
INSERT INTO player VALUES ('Karim Ansarifard','IR Iran',0,0,2,'FW');
INSERT INTO player VALUES ('Karim Boudiaf','Qatar',1,0,3,'MF');
INSERT INTO player VALUES ('Karl Toko Ekambi','Cameroon',0,0,3,'FW');
INSERT INTO player VALUES ('Karol Swiderski','Poland',0,0,1,'FW');
INSERT INTO player VALUES ('Kasper Dolberg','Denmark',0,0,3,'FW');
INSERT INTO player VALUES ('Kasper Schmeichel','Denmark',0,0,3,'GK');
INSERT INTO player VALUES ('Keanu Baccus','Australia',0,0,4,'MF');
INSERT INTO player VALUES ('Kellyn Acosta','United States',1,0,2,'MF');
INSERT INTO player VALUES ('Kendall Waston','Costa Rica',0,0,3,'DF');
INSERT INTO player VALUES ('Kenneth Taylor','Netherlands',0,0,1,'MF');
INSERT INTO player VALUES ('Kevin De Bruyne','Belgium',0,0,3,'FW');
INSERT INTO player VALUES ('Kevin Rodriguez','Ecuador',0,0,2,'FW');
INSERT INTO player VALUES ('Kevin Alvarez','Mexico',0,0,2,'DF');
INSERT INTO player VALUES ('Keylor Navas','Costa Rica',0,0,3,'GK');
INSERT INTO player VALUES ('Keysher Fuller','Costa Rica',0,0,3,'DF');
INSERT INTO player VALUES ('Kieffer Moore','Wales',0,0,3,'FW');
INSERT INTO player VALUES ('Kieran Trippier','England',0,0,3,'DF');
INSERT INTO player VALUES ('Kim Jin-su','Korea Republic',0,0,4,'DF');
INSERT INTO player VALUES ('Kim Min-jae','Korea Republic',0,0,3,'DF');
INSERT INTO player VALUES ('Kim Moonhwan','Korea Republic',0,0,4,'DF');
INSERT INTO player VALUES ('Kim Seung-gyu','Korea Republic',0,0,4,'GK');
INSERT INTO player VALUES ('Kim Young-gwon','Korea Republic',1,0,4,'DF');
INSERT INTO player VALUES ('Kingsley Coman','France',0,0,6,'FW');
INSERT INTO player VALUES ('Ko Itakura','Japan',2,0,3,'DF');
INSERT INTO player VALUES ('Koke','Spain',0,0,2,'MF');
INSERT INTO player VALUES ('Kristijan Jakic','Croatia',0,0,1,'FW');
INSERT INTO player VALUES ('Krystian Bielik','Poland',0,0,4,'MF');
INSERT INTO player VALUES ('Krzysztof Piatek','Poland',0,0,2,'FW');
INSERT INTO player VALUES ('Krepin Diatta','Senegal',0,0,3,'FW');
INSERT INTO player VALUES ('Kudus Mohammed','Ghana',1,0,3,'FW');
INSERT INTO player VALUES ('Kwon Chang-hoon','Korea Republic',0,0,1,'FW');
INSERT INTO player VALUES ('Kwon Kyung-won','Korea Republic',0,0,2,'DF');
INSERT INTO player VALUES ('Kye Rowles','Australia',0,0,4,'DF');
INSERT INTO player VALUES ('Kyle Walker','England',0,0,3,'DF');
INSERT INTO player VALUES ('Kylian Mbappe','France',0,0,7,'FW');
INSERT INTO player VALUES ('Lautaro Martinez','Argentina',0,0,6,'FW');
INSERT INTO player VALUES ('Lawrence Ati-Zigi','Ghana',0,0,3,'GK');
INSERT INTO player VALUES ('Leander Dendoncker','Belgium',1,0,2,'DF');
INSERT INTO player VALUES ('Leandro Paredes','Argentina',2,0,5,'MF');
INSERT INTO player VALUES ('Leandro Trossard','Belgium',0,0,3,'FW');
INSERT INTO player VALUES ('Lee Jae-sung','Korea Republic',0,0,3,'MF');
INSERT INTO player VALUES ('Lee Kangin','Korea Republic',1,0,4,'MF');
INSERT INTO player VALUES ('Leon Goretzka','Germany',1,0,3,'MF');
INSERT INTO player VALUES ('Leroy Sane','Germany',0,0,2,'FW');
INSERT INTO player VALUES ('Liam Millar','Canada',0,0,1,'DF');
INSERT INTO player VALUES ('Lionel Messi','Argentina',1,0,7,'FW');
INSERT INTO player VALUES ('Lisandro Martinez','Argentina',1,0,5,'DF');
INSERT INTO player VALUES ('Lovro Majer','Croatia',0,0,7,'MF');
INSERT INTO player VALUES ('Lois Openda','Belgium',0,0,1,'FW');
INSERT INTO player VALUES ('Lucas Cavallini','Canada',0,0,1,'FW');
INSERT INTO player VALUES ('Lucas Hernandez','France',0,0,1,'DF');
INSERT INTO player VALUES ('Lucas Paqueta','Brazil',0,0,4,'MF');
INSERT INTO player VALUES ('Luis Chavez','Mexico',0,0,3,'MF');
INSERT INTO player VALUES ('Luis Suarez','Uruguay',1,0,3,'FW');
INSERT INTO player VALUES ('Luka Jovic','Serbia',1,0,1,'FW');
INSERT INTO player VALUES ('Luka Modric','Croatia',1,0,7,'MF');
INSERT INTO player VALUES ('Lukas Klostermann','Germany',0,0,2,'DF');
INSERT INTO player VALUES ('Luke Shaw','England',0,0,5,'DF');
INSERT INTO player VALUES ('Luuk de Jong','Netherlands',0,0,1,'FW');
INSERT INTO player VALUES ('Majid Hosseini','IR Iran',1,0,3,'DF');
INSERT INTO player VALUES ('Manuel Akanji','Switzerland',1,0,4,'DF');
INSERT INTO player VALUES ('Manuel Neuer','Germany',0,0,3,'GK');
INSERT INTO player VALUES ('Marcelo Brozovic','Croatia',1,0,6,'MF');
INSERT INTO player VALUES ('Marco Asensio','Spain',0,0,4,'FW');
INSERT INTO player VALUES ('Marcos Acuna','Argentina',3,0,6,'DF');
INSERT INTO player VALUES ('Marcos Llorente','Spain',0,0,1,'DF');
INSERT INTO player VALUES ('Marcus Rashford','England',0,0,5,'FW');
INSERT INTO player VALUES ('Marcus Thuram','France',1,0,5,'FW');
INSERT INTO player VALUES ('Mario Gotze','Germany',0,0,2,'MF');
INSERT INTO player VALUES ('Mario Pasalic','Croatia',0,0,7,'FW');
INSERT INTO player VALUES ('Mark-Anthony Kaye','Canada',0,0,1,'MF');
INSERT INTO player VALUES ('Marko Grujic','Serbia',0,0,1,'MF');
INSERT INTO player VALUES ('Marko Livaja','Croatia',0,0,6,'FW');
INSERT INTO player VALUES ('Marquinhos','Brazil',1,0,5,'DF');
INSERT INTO player VALUES ('Marten de Roon','Netherlands',0,0,5,'MF');
INSERT INTO player VALUES ('Martin Braithwaite','Denmark',0,0,2,'FW');
INSERT INTO player VALUES ('Martin Hongla','Cameroon',0,0,2,'MF');
INSERT INTO player VALUES ('Martinelli','Brazil',0,0,3,'FW');
INSERT INTO player VALUES ('Martin Caceres','Uruguay',1,0,1,'DF');
INSERT INTO player VALUES ('Mason Mount','England',0,0,4,'MF');
INSERT INTO player VALUES ('Mateo Kovacic','Croatia',2,0,7,'MF');
INSERT INTO player VALUES ('Matheus Nunes','Portugal',0,0,2,'MF');
INSERT INTO player VALUES ('Mathew Leckie','Australia',0,0,4,'MF');
INSERT INTO player VALUES ('Mathew Ryan','Australia',0,0,4,'GK');
INSERT INTO player VALUES ('Mathias Jensen','Denmark',1,0,2,'MF');
INSERT INTO player VALUES ('Mathias Olivera','Uruguay',1,0,3,'DF');
INSERT INTO player VALUES ('Matt Turner','United States',0,0,4,'GK');
INSERT INTO player VALUES ('Matthias Ginter','Germany',0,0,1,'DF');
INSERT INTO player VALUES ('Matthijs de Ligt','Netherlands',1,0,2,'DF');
INSERT INTO player VALUES ('Matty Cash','Poland',2,0,4,'DF');
INSERT INTO player VALUES ('Matteo Guendouzi','France',0,0,1,'FW');
INSERT INTO player VALUES ('Matias Vecino','Uruguay',0,0,3,'MF');
INSERT INTO player VALUES ('Matias Vina','Uruguay',0,0,2,'DF');
INSERT INTO player VALUES ('Maxi Gomez','Uruguay',0,0,2,'FW');
INSERT INTO player VALUES ('Maya Yoshida','Japan',1,0,4,'DF');
INSERT INTO player VALUES ('Mehdi Taremi','IR Iran',0,0,3,'FW');
INSERT INTO player VALUES ('Mehdi Torabi','IR Iran',0,0,3,'MF');
INSERT INTO player VALUES ('Memphis','Netherlands',1,0,5,'FW');
INSERT INTO player VALUES ('Meshaal Barsham','Qatar',0,0,2,'GK');
INSERT INTO player VALUES ('Michael Estrada','Ecuador',0,0,3,'FW');
INSERT INTO player VALUES ('Michal Skoras','Poland',0,0,1,'MF');
INSERT INTO player VALUES ('Michel Aebischer','Switzerland',0,0,1,'MF');
INSERT INTO player VALUES ('Michy Batshuayi','Belgium',0,0,2,'FW');
INSERT INTO player VALUES ('Miki Yamane','Japan',1,0,1,'DF');
INSERT INTO player VALUES ('Mikkel Damsgaard','Denmark',0,0,3,'MF');
INSERT INTO player VALUES ('Milad Mohammadi','IR Iran',0,0,3,'DF');
INSERT INTO player VALUES ('Milan Borjan','Canada',0,0,3,'GK');
INSERT INTO player VALUES ('Milos Degenek','Australia',2,0,4,'DF');
INSERT INTO player VALUES ('Milos Veljkovic','Serbia',0,0,3,'DF');
INSERT INTO player VALUES ('Mislav Orsic','Croatia',0,0,6,'FW');
INSERT INTO player VALUES ('Mitchell Duke','Australia',1,0,4,'FW');
INSERT INTO player VALUES ('Mohamed Ali Ben Romdhane','Tunisia',0,0,1,'MF');
INSERT INTO player VALUES ('Mohamed Drager','Tunisia',0,0,2,'DF');
INSERT INTO player VALUES ('Mohamed Kanno','Saudi Arabia',0,0,3,'MF');
INSERT INTO player VALUES ('Mohammed Al-Breik','Saudi Arabia',0,0,2,'DF');
INSERT INTO player VALUES ('Mohammed Al-Owais','Saudi Arabia',1,0,3,'GK');
INSERT INTO player VALUES ('Mohammed Muntari','Qatar',0,0,3,'FW');
INSERT INTO player VALUES ('Mohammed Salisu','Ghana',0,0,3,'DF');
INSERT INTO player VALUES ('Mohammed Waad','Qatar',0,0,2,'MF');
INSERT INTO player VALUES ('Moises Caicedo','Ecuador',1,0,3,'MF');
INSERT INTO player VALUES ('Montassar Talbi','Tunisia',0,0,3,'DF');
INSERT INTO player VALUES ('Morteza Pouraliganji','IR Iran',1,0,3,'DF');
INSERT INTO player VALUES ('Moumi Ngamaleu','Cameroon',0,0,2,'FW');
INSERT INTO player VALUES ('Munir','Morocco',0,0,1,'GK');
INSERT INTO player VALUES ('Musab Kheder','Qatar',0,0,1,'DF');
INSERT INTO player VALUES ('Na Sang-ho','Korea Republic',0,0,2,'FW');
INSERT INTO player VALUES ('Nader Ghandri','Tunisia',0,0,1,'DF');
INSERT INTO player VALUES ('Nahuel Molina','Argentina',0,0,7,'DF');
INSERT INTO player VALUES ('Nampalys Mendy','Senegal',1,0,4,'MF');
INSERT INTO player VALUES ('Nasser Al-Dawsari','Saudi Arabia',0,0,1,'FW');
INSERT INTO player VALUES ('Nathan Ake','Netherlands',1,0,5,'DF');
INSERT INTO player VALUES ('Nathaniel Atkinson','Australia',0,0,1,'DF');
INSERT INTO player VALUES ('Nawaf Al Abed','Saudi Arabia',1,0,2,'MF');
INSERT INTO player VALUES ('Nayef Aguerd','Morocco',0,0,4,'DF');
INSERT INTO player VALUES ('Naim Sliti','Tunisia',0,0,2,'MF');
INSERT INTO player VALUES ('Neco Williams','Wales',0,0,3,'DF');
INSERT INTO player VALUES ('Nemanja Gudelj','Serbia',2,0,2,'MF');
INSERT INTO player VALUES ('Nemanja Maksimovic','Serbia',0,0,3,'MF');
INSERT INTO player VALUES ('Nemanja Radonjic','Serbia',0,0,3,'DF');
INSERT INTO player VALUES ('Neymar','Brazil',0,0,3,'MF');
INSERT INTO player VALUES ('Niclas Fullkrug','Germany',0,0,3,'FW');
INSERT INTO player VALUES ('Nico Elvedi','Switzerland',1,0,2,'DF');
INSERT INTO player VALUES ('Nico Schlotterbeck','Germany',0,0,2,'DF');
INSERT INTO player VALUES ('Nico Williams','Spain',0,0,4,'FW');
INSERT INTO player VALUES ('Nicola Zalewski','Poland',0,0,2,'MF');
INSERT INTO player VALUES ('Nicolas Jackson','Senegal',0,0,1,'FW');
INSERT INTO player VALUES ('Nicolas Nkoulou','Cameroon',1,0,2,'DF');
INSERT INTO player VALUES ('Nicolas De La Cruz','Uruguay',0,0,2,'MF');
INSERT INTO player VALUES ('Nicolas Otamendi','Argentina',2,0,7,'DF');
INSERT INTO player VALUES ('Nicolas Tagliafico','Argentina',0,0,6,'DF');
INSERT INTO player VALUES ('Niklas Sule','Germany',0,0,3,'DF');
INSERT INTO player VALUES ('Nikola Milenkovic','Serbia',2,0,3,'DF');
INSERT INTO player VALUES ('Nikola Vlasic','Croatia',0,0,6,'FW');
INSERT INTO player VALUES ('Noa Lang','Netherlands',1,0,1,'MF');
INSERT INTO player VALUES ('Noah Okafor','Switzerland',0,0,3,'FW');
INSERT INTO player VALUES ('Nouhou Tolo','Cameroon',1,0,3,'DF');
INSERT INTO player VALUES ('Noussair Mazraoui','Morocco',0,0,5,'DF');
INSERT INTO player VALUES ('Nuno Mendes','Portugal',0,0,1,'DF');
INSERT INTO player VALUES ('Nestor Araujo','Mexico',1,0,1,'DF');
INSERT INTO player VALUES ('Olivier Giroud','France',1,0,6,'FW');
INSERT INTO player VALUES ('Olivier Ntcham','Cameroon',0,0,1,'MF');
INSERT INTO player VALUES ('Orbelin Pineda','Mexico',0,0,1,'MF');
INSERT INTO player VALUES ('Osman Bukari','Ghana',0,0,2,'MF');
INSERT INTO player VALUES ('Otavio','Portugal',0,0,3,'MF');
INSERT INTO player VALUES ('Ousmane Dembele','France',1,0,7,'FW');
INSERT INTO player VALUES ('Pablo Sarabia','Spain',0,0,1,'FW');
INSERT INTO player VALUES ('Paik Seung-ho','Korea Republic',0,0,1,'MF');
INSERT INTO player VALUES ('Pape Abou Cisse','Senegal',0,0,3,'DF');
INSERT INTO player VALUES ('Pape Gueye','Senegal',0,0,3,'MF');
INSERT INTO player VALUES ('Pape Matar Sarr','Senegal',0,0,2,'MF');
INSERT INTO player VALUES ('Papu Gomez','Argentina',0,0,2,'MF');
INSERT INTO player VALUES ('Pathe Ciss','Senegal',1,0,3,'MF');
INSERT INTO player VALUES ('Pau Torres','Spain',0,0,1,'DF');
INSERT INTO player VALUES ('Paulo Dybala','Argentina',0,0,2,'FW');
INSERT INTO player VALUES ('Pedri','Spain',0,0,4,'MF');
INSERT INTO player VALUES ('Pedro','Brazil',0,0,2,'FW');
INSERT INTO player VALUES ('Pepe','Portugal',0,0,4,'DF');
INSERT INTO player VALUES ('Pervis Estupinan','Ecuador',0,0,3,'DF');
INSERT INTO player VALUES ('Phil Foden','England',0,0,4,'FW');
INSERT INTO player VALUES ('Piero Hincapie','Ecuador',0,0,3,'DF');
INSERT INTO player VALUES ('Pierre Hojbjerg','Denmark',0,0,3,'MF');
INSERT INTO player VALUES ('Pierre Kunde','Cameroon',1,0,2,'MF');
INSERT INTO player VALUES ('Piotr Zielinski','Poland',0,0,4,'MF');
INSERT INTO player VALUES ('Przemyslaw Frankowski','Poland',1,0,4,'MF');
INSERT INTO player VALUES ('Rafael Leao','Portugal',0,0,5,'FW');
INSERT INTO player VALUES ('Raheem Sterling','England',0,0,3,'FW');
INSERT INTO player VALUES ('Ramin Rezaeian','IR Iran',1,0,2,'DF');
INSERT INTO player VALUES ('Randal Kolo Muani','France',0,0,3,'FW');
INSERT INTO player VALUES ('Raphael Guerreiro','Portugal',0,0,4,'DF');
INSERT INTO player VALUES ('Raphael Varane','France',0,0,6,'DF');
INSERT INTO player VALUES ('Raphinha','Brazil',0,0,5,'FW');
INSERT INTO player VALUES ('Rasmus Nissen','Denmark',1,0,3,'DF');
INSERT INTO player VALUES ('Raul Jimenez','Mexico',0,0,3,'FW');
INSERT INTO player VALUES ('Remo Freuler','Switzerland',0,0,4,'MF');
INSERT INTO player VALUES ('Renato Steffen','Switzerland',0,0,1,'FW');
INSERT INTO player VALUES ('Ricardo Horta','Portugal',0,0,3,'FW');
INSERT INTO player VALUES ('Ricardo Rodriguez','Switzerland',0,0,4,'DF');
INSERT INTO player VALUES ('Richarlison','Brazil',0,0,4,'FW');
INSERT INTO player VALUES ('Richie Laryea','Canada',0,0,3,'DF');
INSERT INTO player VALUES ('Riley McGree','Australia',0,0,4,'FW');
INSERT INTO player VALUES ('Ritsu Doan','Japan',0,0,4,'FW');
INSERT INTO player VALUES ('Riyadh Sharahili','Saudi Arabia',0,0,1,'MF');
INSERT INTO player VALUES ('Roan Wilson','Costa Rica',0,0,1,'MF');
INSERT INTO player VALUES ('Robert Lewandowski','Poland',0,0,4,'FW');
INSERT INTO player VALUES ('Robert Skov','Denmark',1,0,1,'DF');
INSERT INTO player VALUES ('Roberto Alvarado','Mexico',1,0,1,'FW');
INSERT INTO player VALUES ('Rodri','Spain',0,0,4,'DF');
INSERT INTO player VALUES ('Rodrigo Bentancur','Uruguay',1,0,3,'MF');
INSERT INTO player VALUES ('Rodrigo De Paul','Argentina',0,0,7,'MF');
INSERT INTO player VALUES ('Rodrygo','Brazil',0,0,5,'MF');
INSERT INTO player VALUES ('Rogelio Funes Mori','Mexico',0,0,1,'FW');
INSERT INTO player VALUES ('Romain Saiss','Morocco',1,0,6,'DF');
INSERT INTO player VALUES ('Romario Ibarra','Ecuador',0,0,2,'MF');
INSERT INTO player VALUES ('Romelu Lukaku','Belgium',0,0,2,'FW');
INSERT INTO player VALUES ('Roozbeh Cheshmi','IR Iran',0,0,2,'DF');
INSERT INTO player VALUES ('Ruben Vargas','Switzerland',1,0,4,'FW');
INSERT INTO player VALUES ('Rubin Colwill','Wales',0,0,1,'MF');
INSERT INTO player VALUES ('Ro-Ro','Qatar',0,0,3,'DF');
INSERT INTO player VALUES ('Ronald Matarrita','Costa Rica',0,0,2,'DF');
INSERT INTO player VALUES ('Ruben Dias','Portugal',1,0,4,'DF');
INSERT INTO player VALUES ('Ruben Neves','Portugal',1,0,5,'MF');
INSERT INTO player VALUES ('Saad Al Sheeb','Qatar',1,0,1,'GK');
INSERT INTO player VALUES ('Sadegh Moharrami','IR Iran',0,0,1,'DF');
INSERT INTO player VALUES ('Saeid Ezatolahi','IR Iran',0,0,3,'MF');
INSERT INTO player VALUES ('Saleh Al-Shehri','Saudi Arabia',1,0,3,'FW');
INSERT INTO player VALUES ('Salem Al-Dawsari','Saudi Arabia',1,0,3,'MF');
INSERT INTO player VALUES ('Salis Abdul Samed','Ghana',0,0,3,'MF');
INSERT INTO player VALUES ('Salman Al-Faraj','Saudi Arabia',0,0,1,'MF');
INSERT INTO player VALUES ('Sam Adekugbe','Canada',1,0,3,'DF');
INSERT INTO player VALUES ('Saman Ghoddos','IR Iran',0,0,1,'MF');
INSERT INTO player VALUES ('Sami Al-Najei','Saudi Arabia',0,0,1,'MF');
INSERT INTO player VALUES ('Samuel Oum Gouet','Cameroon',0,0,2,'MF');
INSERT INTO player VALUES ('Sardar Azmoun','IR Iran',0,0,3,'FW');
INSERT INTO player VALUES ('Saud Abdulhamid','Saudi Arabia',1,0,3,'DF');
INSERT INTO player VALUES ('Sasa Lukic','Serbia',2,0,3,'MF');
INSERT INTO player VALUES ('Sebastian Szymanski','Poland',0,0,2,'MF');
INSERT INTO player VALUES ('Sebastian Coates','Uruguay',1,0,2,'DF');
INSERT INTO player VALUES ('Selim Amallah','Morocco',1,0,7,'MF');
INSERT INTO player VALUES ('Serge Gnabry','Germany',0,0,3,'FW');
INSERT INTO player VALUES ('Sergej Milinkovic-Savic','Serbia',1,0,3,'MF');
INSERT INTO player VALUES ('Sergio Busquets','Spain',1,0,4,'MF');
INSERT INTO player VALUES ('Sergio Rochet','Uruguay',0,0,3,'GK');
INSERT INTO player VALUES ('Sergino Dest','United States',1,0,4,'DF');
INSERT INTO player VALUES ('Shaquell Moore','United States',0,0,2,'DF');
INSERT INTO player VALUES ('Shogo Taniguchi','Japan',1,0,2,'DF');
INSERT INTO player VALUES ('Shuichi Gonda','Japan',0,0,4,'GK');
INSERT INTO player VALUES ('Silvan Widmer','Switzerland',1,0,3,'DF');
INSERT INTO player VALUES ('Simon Kjaer','Denmark',0,0,1,'DF');
INSERT INTO player VALUES ('Sofiane Boufal','Morocco',1,0,7,'FW');
INSERT INTO player VALUES ('Sofyan Amrabat','Morocco',1,0,7,'MF');
INSERT INTO player VALUES ('Son Heung-min','Korea Republic',0,0,4,'FW');
INSERT INTO player VALUES ('Son Jun-ho','Korea Republic',0,0,3,'MF');
INSERT INTO player VALUES ('Sorba Thomas','Wales',0,0,1,'MF');
INSERT INTO player VALUES ('Srdan Babic','Serbia',0,0,1,'DF');
INSERT INTO player VALUES ('Stefan Mitrovic','Serbia',0,0,1,'DF');
INSERT INTO player VALUES ('Stephen Eustaquio','Canada',0,0,2,'MF');
INSERT INTO player VALUES ('Steve Mandanda','France',0,0,1,'GK');
INSERT INTO player VALUES ('Steven Berghuis','Netherlands',1,0,4,'MF');
INSERT INTO player VALUES ('Steven Bergwijn','Netherlands',1,0,4,'FW');
INSERT INTO player VALUES ('Steven Vitoria','Canada',1,0,3,'DF');
INSERT INTO player VALUES ('Strahinja Pavlovic','Serbia',2,0,3,'DF');
INSERT INTO player VALUES ('Sultan Al-Ghanam','Saudi Arabia',0,0,3,'DF');
INSERT INTO player VALUES ('Taha Yassine Khenissi','Tunisia',1,0,2,'FW');
INSERT INTO player VALUES ('Tajon Buchanan','Canada',1,0,3,'MF');
INSERT INTO player VALUES ('Takefusa Kubo','Japan',0,0,2,'FW');
INSERT INTO player VALUES ('Takehiro Tomiyasu','Japan',0,0,3,'DF');
INSERT INTO player VALUES ('Takuma Asano','Japan',0,0,4,'FW');
INSERT INTO player VALUES ('Takumi Minamino','Japan',0,0,3,'FW');
INSERT INTO player VALUES ('Tarek Salman','Qatar',0,0,1,'DF');
INSERT INTO player VALUES ('Tariq Lamptey','Ghana',1,0,2,'DF');
INSERT INTO player VALUES ('Teun Koopmeiners','Netherlands',1,0,5,'MF');
INSERT INTO player VALUES ('Theo Hernandez','France',1,0,6,'DF');
INSERT INTO player VALUES ('Thiago Almada','Argentina',0,0,1,'MF');
INSERT INTO player VALUES ('Thiago Silva','Brazil',0,0,4,'DF');
INSERT INTO player VALUES ('Thibaut Courtois','Belgium',0,0,3,'GK');
INSERT INTO player VALUES ('Thilo Kehrer','Germany',1,0,1,'DF');
INSERT INTO player VALUES ('Thomas Delaney','Denmark',0,0,1,'MF');
INSERT INTO player VALUES ('Thomas Meunier','Belgium',1,0,3,'DF');
INSERT INTO player VALUES ('Thomas Muller','Germany',0,0,3,'FW');
INSERT INTO player VALUES ('Thomas Partey','Ghana',0,0,3,'MF');
INSERT INTO player VALUES ('Thorgan Hazard','Belgium',0,0,2,'FW');
INSERT INTO player VALUES ('Tim Ream','United States',1,0,4,'DF');
INSERT INTO player VALUES ('Timothy Castagne','Belgium',0,0,3,'DF');
INSERT INTO player VALUES ('Timothy Weah','United States',0,0,4,'FW');
INSERT INTO player VALUES ('Toby Alderweireld','Belgium',0,0,3,'DF');
INSERT INTO player VALUES ('Trent Alexander-Arnold','England',0,0,1,'DF');
INSERT INTO player VALUES ('Tyler Adams','United States',1,0,4,'MF');
INSERT INTO player VALUES ('Unai Simon','Spain',0,0,4,'GK');
INSERT INTO player VALUES ('Uriel Antuna','Mexico',0,0,3,'FW');
INSERT INTO player VALUES ('Vanja Milinkovic-Savic','Serbia',0,0,3,'GK');
INSERT INTO player VALUES ('Victor Nelsson','Denmark',0,0,1,'DF');
INSERT INTO player VALUES ('Vincent Aboubakar','Cameroon',2,1,3,'FW');
INSERT INTO player VALUES ('Vincent Janssen','Netherlands',0,0,2,'FW');
INSERT INTO player VALUES ('Vinicius Junior','Brazil',0,0,4,'FW');
INSERT INTO player VALUES ('Virgil van Dijk','Netherlands',0,0,5,'DF');
INSERT INTO player VALUES ('Vitinha','Portugal',1,0,3,'MF');
INSERT INTO player VALUES ('Wahbi Khazri','Tunisia',0,0,2,'FW');
INSERT INTO player VALUES ('Wajdi Kechrida','Tunisia',1,0,3,'DF');
INSERT INTO player VALUES ('Walid Cheddira','Morocco',2,1,2,'FW');
INSERT INTO player VALUES ('Walker Zimmerman','United States',0,0,4,'DF');
INSERT INTO player VALUES ('Wataru Endo','Japan',1,0,4,'MF');
INSERT INTO player VALUES ('Wayne Hennessey','Wales',0,1,2,'GK');
INSERT INTO player VALUES ('Weston McKennie','United States',1,0,4,'MF');
INSERT INTO player VALUES ('William Carvalho','Portugal',0,0,4,'MF');
INSERT INTO player VALUES ('William Saliba','France',0,0,1,'DF');
INSERT INTO player VALUES ('Wojciech Szczesny','Poland',0,0,4,'GK');
INSERT INTO player VALUES ('Wout Weghorst','Netherlands',1,0,4,'FW');
INSERT INTO player VALUES ('Weverton','Brazil',0,0,1,'GK');
INSERT INTO player VALUES ('Xavi Simons','Netherlands',0,0,1,'FW');
INSERT INTO player VALUES ('Xherdan Shaqiri','Switzerland',0,0,3,'FW');
INSERT INTO player VALUES ('Yahya Attiat Allah','Morocco',0,0,6,'DF');
INSERT INTO player VALUES ('Yahya Jabrane','Morocco',0,0,2,'MF');
INSERT INTO player VALUES ('Yann Sommer','Switzerland',0,0,3,'GK');
INSERT INTO player VALUES ('Yannick Carrasco','Belgium',1,0,2,'FW');
INSERT INTO player VALUES ('Yasser Al-Shahrani','Saudi Arabia',0,0,1,'DF');
INSERT INTO player VALUES ('Yassine Bounou','Morocco',0,0,6,'GK');
INSERT INTO player VALUES ('Yassine Meriah','Tunisia',0,0,3,'DF');
INSERT INTO player VALUES ('Yeltsin Tejeda','Costa Rica',0,0,3,'MF');
INSERT INTO player VALUES ('Youri Tielemans','Belgium',0,0,3,'MF');
INSERT INTO player VALUES ('Youssef En-Nesyri','Morocco',0,0,7,'FW');
INSERT INTO player VALUES ('Youssef Msakni','Tunisia',0,0,2,'MF');
INSERT INTO player VALUES ('Youssouf Fofana','France',0,0,6,'MF');
INSERT INTO player VALUES ('Youssouf Sabaly','Senegal',0,0,4,'DF');
INSERT INTO player VALUES ('Youssoufa Moukoko','Germany',0,0,1,'FW');
INSERT INTO player VALUES ('Youstin Salas','Costa Rica',0,0,2,'DF');
INSERT INTO player VALUES ('Yuki Soma','Japan',0,0,1,'FW');
INSERT INTO player VALUES ('Yunus Musah','United States',0,0,4,'MF');
INSERT INTO player VALUES ('Yuto Nagatomo','Japan',0,0,4,'MF');
INSERT INTO player VALUES ('Zakaria Aboukhlal','Morocco',0,0,4,'FW');
INSERT INTO player VALUES ('Alvaro Morata','Spain',0,0,4,'FW');
INSERT INTO player VALUES ('Alvaro Zamora','Costa Rica',0,0,1,'MF');
INSERT INTO player VALUES ('Angel Correa','Argentina',0,0,1,'MF');
INSERT INTO player VALUES ('Angel Di Maria','Argentina',0,0,5,'MF');
INSERT INTO player VALUES ('Angelo Preciado','Ecuador',0,0,3,'DF');
INSERT INTO player VALUES ('Eder Militao','Brazil',1,0,4,'DF');
INSERT INTO player VALUES ('Oscar Duarte','Costa Rica',1,0,3,'DF');
INSERT INTO player VALUES ('Ilkay Gundogan','Germany',0,0,3,'MF');
--Src https://www.kaggle.com/datasets/swaptr/fifa-world-cup-2022-statistics

INSERT INTO Attacking_stats VALUES ('Abdelhamid Sabiri',0,1);
INSERT INTO Attacking_stats VALUES ('Achraf Dari',1,0);
INSERT INTO Attacking_stats VALUES ('Achraf Hakimi',0,1);
INSERT INTO Attacking_stats VALUES ('Adrien Rabiot',1,1);
INSERT INTO Attacking_stats VALUES ('Aleksandar Mitrovic',2,0);
INSERT INTO Attacking_stats VALUES ('Alexis Mac Allister',1,1);
INSERT INTO Attacking_stats VALUES ('Ali Gholizadeh',0,1);
INSERT INTO Attacking_stats VALUES ('Alphonso Davies',1,0);
INSERT INTO Attacking_stats VALUES ('Andre-Frank Zambo Anguissa',0,1);
INSERT INTO Attacking_stats VALUES ('Andreas Christensen',1,0);
INSERT INTO Attacking_stats VALUES ('Andrej Kramaric',2,0);
INSERT INTO Attacking_stats VALUES ('Andrija Zivkovic',0,2);
INSERT INTO Attacking_stats VALUES ('Andre Ayew',1,0);
INSERT INTO Attacking_stats VALUES ('Antoine Griezmann',0,3);
INSERT INTO Attacking_stats VALUES ('Ao Tanaka',1,0);
INSERT INTO Attacking_stats VALUES ('Aurelien Tchouameni',1,0);
INSERT INTO Attacking_stats VALUES ('Aissa Laidouni',0,1);
INSERT INTO Attacking_stats VALUES ('Bamba Dieng',1,0);
INSERT INTO Attacking_stats VALUES ('Boulaye Dia',1,0);
INSERT INTO Attacking_stats VALUES ('Breel Embolo',2,0);
INSERT INTO Attacking_stats VALUES ('Bruno Fernandes',2,3);
INSERT INTO Attacking_stats VALUES ('Bruno Petkovic',1,0);
INSERT INTO Attacking_stats VALUES ('Bukayo Saka',3,0);
INSERT INTO Attacking_stats VALUES ('Callum Wilson',0,1);
INSERT INTO Attacking_stats VALUES ('Carlos Soler',1,0);
INSERT INTO Attacking_stats VALUES ('Casemiro',1,0);
INSERT INTO Attacking_stats VALUES ('Cho Guesung',2,0);
INSERT INTO Attacking_stats VALUES ('Christian Pulisic',1,2);
INSERT INTO Attacking_stats VALUES ('Cody Gakpo',3,0);
INSERT INTO Attacking_stats VALUES ('Craig Goodwin',1,1);
INSERT INTO Attacking_stats VALUES ('Cristiano Ronaldo',1,0);
INSERT INTO Attacking_stats VALUES ('Cesar Azpilicueta',0,1);
INSERT INTO Attacking_stats VALUES ('Cesar Montes',0,1);
INSERT INTO Attacking_stats VALUES ('Daizen Maeda',1,0);
INSERT INTO Attacking_stats VALUES ('Daley Blind',1,1);
INSERT INTO Attacking_stats VALUES ('Dani Olmo',1,1);
INSERT INTO Attacking_stats VALUES ('David Raum',0,1);
INSERT INTO Attacking_stats VALUES ('Davy Klaassen',1,2);
INSERT INTO Attacking_stats VALUES ('Dejan Lovren',0,1);
INSERT INTO Attacking_stats VALUES ('Denzel Dumfries',1,2);
INSERT INTO Attacking_stats VALUES ('Diogo Dalot',0,2);
INSERT INTO Attacking_stats VALUES ('Djibril Sow',0,1);
INSERT INTO Attacking_stats VALUES ('Dusan Tadic',0,2);
INSERT INTO Attacking_stats VALUES ('Dusan Vlahovic',1,0);
INSERT INTO Attacking_stats VALUES ('Enner Valencia',3,0);
INSERT INTO Attacking_stats VALUES ('Enzo Fernandez',1,1);
INSERT INTO Attacking_stats VALUES ('Eric Maxim Choupo-Moting',1,0);
INSERT INTO Attacking_stats VALUES ('Famara Diedhiou',1,0);
INSERT INTO Attacking_stats VALUES ('Ferran Torres',2,0);
INSERT INTO Attacking_stats VALUES ('Firas Al-Buraikan',0,1);
INSERT INTO Attacking_stats VALUES ('Frenkie de Jong',1,1);
INSERT INTO Attacking_stats VALUES ('Felix Torres Caicedo',0,1);
INSERT INTO Attacking_stats VALUES ('Gareth Bale',1,0);
INSERT INTO Attacking_stats VALUES ('Gavi',1,0);
INSERT INTO Attacking_stats VALUES ('Gideon Mensah',0,1);
INSERT INTO Attacking_stats VALUES ('Giorgian De Arrascaeta',2,0);
INSERT INTO Attacking_stats VALUES ('Goncalo Ramos',3,1);
INSERT INTO Attacking_stats VALUES ('Haji Wright',1,0);
INSERT INTO Attacking_stats VALUES ('Hakim Ziyech',1,1);
INSERT INTO Attacking_stats VALUES ('Harry Kane',2,3);
INSERT INTO Attacking_stats VALUES ('Harry Maguire',0,1);
INSERT INTO Attacking_stats VALUES ('Hattan Bahebri',0,1);
INSERT INTO Attacking_stats VALUES ('Henry Martin',1,0);
INSERT INTO Attacking_stats VALUES ('Hwang Hee-chan',1,0);
INSERT INTO Attacking_stats VALUES ('Iliman Ndiaye',0,1);
INSERT INTO Attacking_stats VALUES ('Ismail Jakobs',0,1);
INSERT INTO Attacking_stats VALUES ('Ismail Mohamad',0,1);
INSERT INTO Attacking_stats VALUES ('Ismaila Sarr',1,0);
INSERT INTO Attacking_stats VALUES ('Ivan Perisic',1,3);
INSERT INTO Attacking_stats VALUES ('Jack Grealish',1,0);
INSERT INTO Attacking_stats VALUES ('Jamal Musiala',0,1);
INSERT INTO Attacking_stats VALUES ('Jean-Charles Castelletto',1,1);
INSERT INTO Attacking_stats VALUES ('Joachim Andersen',0,1);
INSERT INTO Attacking_stats VALUES ('Jordan Ayew',0,1);
INSERT INTO Attacking_stats VALUES ('Jordan Henderson',1,0);
INSERT INTO Attacking_stats VALUES ('Jordi Alba',0,2);
INSERT INTO Attacking_stats VALUES ('Josip Juranovic',0,1);
INSERT INTO Attacking_stats VALUES ('Joao Felix',1,2);
INSERT INTO Attacking_stats VALUES ('Josko Gvardiol',1,0);
INSERT INTO Attacking_stats VALUES ('Juan Pablo Vargas',1,0);
INSERT INTO Attacking_stats VALUES ('Jude Bellingham',1,1);
INSERT INTO Attacking_stats VALUES ('Julian Alvarez',4,0);
INSERT INTO Attacking_stats VALUES ('Junya Ito',0,1);
INSERT INTO Attacking_stats VALUES ('Kai Havertz',2,0);
INSERT INTO Attacking_stats VALUES ('Kalidou Koulibaly',1,0);
INSERT INTO Attacking_stats VALUES ('Kalvin Phillips',0,1);
INSERT INTO Attacking_stats VALUES ('Kaoru Mitoma',0,1);
INSERT INTO Attacking_stats VALUES ('Keysher Fuller',1,0);
INSERT INTO Attacking_stats VALUES ('Kim Jin-su',0,1);
INSERT INTO Attacking_stats VALUES ('Kim Young-gwon',1,0);
INSERT INTO Attacking_stats VALUES ('Ko Itakura',0,1);
INSERT INTO Attacking_stats VALUES ('Kudus Mohammed',2,0);
INSERT INTO Attacking_stats VALUES ('Kylian Mbappe',8,2);
INSERT INTO Attacking_stats VALUES ('Lee Kangin',0,1);
INSERT INTO Attacking_stats VALUES ('Leroy Sane',0,1);
INSERT INTO Attacking_stats VALUES ('Lionel Messi',7,3);
INSERT INTO Attacking_stats VALUES ('Lovro Majer',1,0);
INSERT INTO Attacking_stats VALUES ('Lucas Paqueta',1,1);
INSERT INTO Attacking_stats VALUES ('Luis Chavez',1,0);
INSERT INTO Attacking_stats VALUES ('Luis Suarez',0,1);
INSERT INTO Attacking_stats VALUES ('Luke Shaw',0,1);
INSERT INTO Attacking_stats VALUES ('Manuel Akanji',1,0);
INSERT INTO Attacking_stats VALUES ('Marco Asensio',1,0);
INSERT INTO Attacking_stats VALUES ('Marcus Rashford',3,0);
INSERT INTO Attacking_stats VALUES ('Marcus Thuram',0,2);
INSERT INTO Attacking_stats VALUES ('Marko Livaja',1,1);
INSERT INTO Attacking_stats VALUES ('Mathew Leckie',1,1);
INSERT INTO Attacking_stats VALUES ('Maya Yoshida',0,1);
INSERT INTO Attacking_stats VALUES ('Mehdi Taremi',2,1);
INSERT INTO Attacking_stats VALUES ('Memphis',1,0);
INSERT INTO Attacking_stats VALUES ('Michy Batshuayi',1,0);
INSERT INTO Attacking_stats VALUES ('Mislav Orsic',1,2);
INSERT INTO Attacking_stats VALUES ('Mitchell Duke',1,0);
INSERT INTO Attacking_stats VALUES ('Mohammed Muntari',1,0);
INSERT INTO Attacking_stats VALUES ('Mohammed Salisu',1,0);
INSERT INTO Attacking_stats VALUES ('Moises Caicedo',1,0);
INSERT INTO Attacking_stats VALUES ('Nahuel Molina',1,1);
INSERT INTO Attacking_stats VALUES ('Neymar',2,0);
INSERT INTO Attacking_stats VALUES ('Niclas Fullkrug',2,1);
INSERT INTO Attacking_stats VALUES ('Nicolas Nkoulou',0,1);
INSERT INTO Attacking_stats VALUES ('Nicolas Otamendi',0,1);
INSERT INTO Attacking_stats VALUES ('Olivier Giroud',4,0);
INSERT INTO Attacking_stats VALUES ('Osman Bukari',1,0);
INSERT INTO Attacking_stats VALUES ('Ousmane Dembele',0,2);
INSERT INTO Attacking_stats VALUES ('Paik Seung-ho',1,0);
INSERT INTO Attacking_stats VALUES ('Pepe',1,0);
INSERT INTO Attacking_stats VALUES ('Phil Foden',1,2);
INSERT INTO Attacking_stats VALUES ('Piotr Zielinski',1,0);
INSERT INTO Attacking_stats VALUES ('Rafael Leao',2,0);
INSERT INTO Attacking_stats VALUES ('Raheem Sterling',1,1);
INSERT INTO Attacking_stats VALUES ('Ramin Rezaeian',1,0);
INSERT INTO Attacking_stats VALUES ('Randal Kolo Muani',1,0);
INSERT INTO Attacking_stats VALUES ('Raphael Guerreiro',1,2);
INSERT INTO Attacking_stats VALUES ('Raphinha',0,1);
INSERT INTO Attacking_stats VALUES ('Remo Freuler',1,0);
INSERT INTO Attacking_stats VALUES ('Ricardo Horta',1,0);
INSERT INTO Attacking_stats VALUES ('Richarlison',3,0);
INSERT INTO Attacking_stats VALUES ('Riley McGree',0,1);
INSERT INTO Attacking_stats VALUES ('Ritsu Doan',2,0);
INSERT INTO Attacking_stats VALUES ('Robert Lewandowski',2,1);
INSERT INTO Attacking_stats VALUES ('Rodrygo',0,1);
INSERT INTO Attacking_stats VALUES ('Romain Saiss',1,0);
INSERT INTO Attacking_stats VALUES ('Roozbeh Cheshmi',1,0);
INSERT INTO Attacking_stats VALUES ('Ruben Vargas',0,1);
INSERT INTO Attacking_stats VALUES ('Saleh Al-Shehri',1,0);
INSERT INTO Attacking_stats VALUES ('Salem Al-Dawsari',2,0);
INSERT INTO Attacking_stats VALUES ('Serge Gnabry',1,1);
INSERT INTO Attacking_stats VALUES ('Sergej Milinkovic-Savic',1,0);
INSERT INTO Attacking_stats VALUES ('Sergino Dest',0,1);
INSERT INTO Attacking_stats VALUES ('Silvan Widmer',0,1);
INSERT INTO Attacking_stats VALUES ('Son Heung-min',0,1);
INSERT INTO Attacking_stats VALUES ('Steven Berghuis',0,1);
INSERT INTO Attacking_stats VALUES ('Strahinja Pavlovic',1,0);
INSERT INTO Attacking_stats VALUES ('Tajon Buchanan',0,1);
INSERT INTO Attacking_stats VALUES ('Takuma Asano',1,0);
INSERT INTO Attacking_stats VALUES ('Teun Koopmeiners',0,1);
INSERT INTO Attacking_stats VALUES ('Theo Hernandez',1,2);
INSERT INTO Attacking_stats VALUES ('Thiago Silva',0,1);
INSERT INTO Attacking_stats VALUES ('Timothy Weah',1,0);
INSERT INTO Attacking_stats VALUES ('Toby Alderweireld',0,1);
INSERT INTO Attacking_stats VALUES ('Vincent Aboubakar',2,1);
INSERT INTO Attacking_stats VALUES ('Vinicius Junior',1,2);
INSERT INTO Attacking_stats VALUES ('Wahbi Khazri',1,0);
INSERT INTO Attacking_stats VALUES ('Wout Weghorst',2,0);
INSERT INTO Attacking_stats VALUES ('Xherdan Shaqiri',1,1);
INSERT INTO Attacking_stats VALUES ('Yahya Attiat Allah',0,1);
INSERT INTO Attacking_stats VALUES ('Yeltsin Tejeda',1,1);
INSERT INTO Attacking_stats VALUES ('Youssef En-Nesyri',2,0);
INSERT INTO Attacking_stats VALUES ('Zakaria Aboukhlal',1,0);
INSERT INTO Attacking_stats VALUES ('Alvaro Morata',3,1);
INSERT INTO Attacking_stats VALUES ('Angel Di Maria',1,1);
INSERT INTO Attacking_stats VALUES ('Angelo Preciado',0,1);
INSERT INTO Attacking_stats VALUES ('Ilkay Gundogan',1,0);
--Src https://www.kaggle.com/datasets/swaptr/fifa-world-cup-2022-statistics

SELECT * FROM Attacking_stats WHERE Goal_scored > 0 OR Assist > 0;

INSERT INTO Defensive_stats VALUES ('Aaron Mooy',9);
INSERT INTO Defensive_stats VALUES ('Aaron Ramsey',2);
INSERT INTO Defensive_stats VALUES ('Abdelhamid Sabiri',3);
INSERT INTO Defensive_stats VALUES ('Abdelkarim Hassan',7);
INSERT INTO Defensive_stats VALUES ('Abdessamad Ezzalzouli',3);
INSERT INTO Defensive_stats VALUES ('Abdou Diallo',2);
INSERT INTO Defensive_stats VALUES ('Abdulaziz Hatem',1);
INSERT INTO Defensive_stats VALUES ('Abdulelah Al-Amri',1);
INSERT INTO Defensive_stats VALUES ('Abdulellah Al-Malki',3);
INSERT INTO Defensive_stats VALUES ('Abdullah Madu',1);
INSERT INTO Defensive_stats VALUES ('Abdulrahman Al-Aboud',3);
INSERT INTO Defensive_stats VALUES ('Achraf Dari',1);
INSERT INTO Defensive_stats VALUES ('Achraf Hakimi',26);
INSERT INTO Defensive_stats VALUES ('Adrien Rabiot',12);
INSERT INTO Defensive_stats VALUES ('Agustin Canobbio',1);
INSERT INTO Defensive_stats VALUES ('Ahmad Nourollahi',4);
INSERT INTO Defensive_stats VALUES ('Ajdin Hrustic',2);
INSERT INTO Defensive_stats VALUES ('Alan Franco',1);
INSERT INTO Defensive_stats VALUES ('Alejandro Balde',6);
INSERT INTO Defensive_stats VALUES ('Aleksandar Mitrovic',1);
INSERT INTO Defensive_stats VALUES ('Alex Sandro',8);
INSERT INTO Defensive_stats VALUES ('Alex Telles',2);
INSERT INTO Defensive_stats VALUES ('Alexander Bah',4);
INSERT INTO Defensive_stats VALUES ('Alexander Djiku',1);
INSERT INTO Defensive_stats VALUES ('Alexis Mac Allister',9);
INSERT INTO Defensive_stats VALUES ('Ali Abdi',8);
INSERT INTO Defensive_stats VALUES ('Ali Al Hassan',2);
INSERT INTO Defensive_stats VALUES ('Ali Al-Bulaihi',4);
INSERT INTO Defensive_stats VALUES ('Ali Karimi',3);
INSERT INTO Defensive_stats VALUES ('Ali Maaloul',1);
INSERT INTO Defensive_stats VALUES ('Alidu Seidu',6);
INSERT INTO Defensive_stats VALUES ('Alireza Jahanbakhsh',1);
INSERT INTO Defensive_stats VALUES ('Alistair Johnston',5);
INSERT INTO Defensive_stats VALUES ('Almoez Ali',1);
INSERT INTO Defensive_stats VALUES ('Alphonso Davies',2);
INSERT INTO Defensive_stats VALUES ('Amadou Onana',4);
INSERT INTO Defensive_stats VALUES ('Andre-Frank Zambo Anguissa',4);
INSERT INTO Defensive_stats VALUES ('Andreas Christensen',4);
INSERT INTO Defensive_stats VALUES ('Andrej Kramaric',3);
INSERT INTO Defensive_stats VALUES ('Andrija Zivkovic',5);
INSERT INTO Defensive_stats VALUES ('Andre Ayew',4);
INSERT INTO Defensive_stats VALUES ('Andres Guardado',4);
INSERT INTO Defensive_stats VALUES ('Anis Ben Slimane',3);
INSERT INTO Defensive_stats VALUES ('Ansu Fati',1);
INSERT INTO Defensive_stats VALUES ('Ante Budimir',1);
INSERT INTO Defensive_stats VALUES ('Anthony Contreras',5);
INSERT INTO Defensive_stats VALUES ('Antoine Griezmann',14);
INSERT INTO Defensive_stats VALUES ('Antonee Robinson',5);
INSERT INTO Defensive_stats VALUES ('Antonio Rudiger',2);
INSERT INTO Defensive_stats VALUES ('Antony',3);
INSERT INTO Defensive_stats VALUES ('Antonio Silva',1);
INSERT INTO Defensive_stats VALUES ('Ao Tanaka',3);
INSERT INTO Defensive_stats VALUES ('Assim Madibo',6);
INSERT INTO Defensive_stats VALUES ('Atiba Hutchinson',4);
INSERT INTO Defensive_stats VALUES ('Aurelien Tchouameni',11);
INSERT INTO Defensive_stats VALUES ('Axel Disasi',3);
INSERT INTO Defensive_stats VALUES ('Axel Witsel',4);
INSERT INTO Defensive_stats VALUES ('Aymeric Laporte',2);
INSERT INTO Defensive_stats VALUES ('Aziz Behich',8);
INSERT INTO Defensive_stats VALUES ('Azzedine Ounahi',9);
INSERT INTO Defensive_stats VALUES ('Aissa Laidouni',3);
INSERT INTO Defensive_stats VALUES ('Baba Rahman',5);
INSERT INTO Defensive_stats VALUES ('Bamba Dieng',2);
INSERT INTO Defensive_stats VALUES ('Bartosz Bereszynski',6);
INSERT INTO Defensive_stats VALUES ('Ben Davies',4);
INSERT INTO Defensive_stats VALUES ('Bernardo Silva',2);
INSERT INTO Defensive_stats VALUES ('Borna Barisic',1);
INSERT INTO Defensive_stats VALUES ('Borna Sosa',14);
INSERT INTO Defensive_stats VALUES ('Boualem Khoukhi',2);
INSERT INTO Defensive_stats VALUES ('Boulaye Dia',1);
INSERT INTO Defensive_stats VALUES ('Brandon Aguilera',2);
INSERT INTO Defensive_stats VALUES ('Breel Embolo',1);
INSERT INTO Defensive_stats VALUES ('Brenden Aaronson',3);
INSERT INTO Defensive_stats VALUES ('Bruno Fernandes',4);
INSERT INTO Defensive_stats VALUES ('Bruno Petkovic',6);
INSERT INTO Defensive_stats VALUES ('Bryan Oviedo',6);
INSERT INTO Defensive_stats VALUES ('Bryan Ruiz',1);
INSERT INTO Defensive_stats VALUES ('Bukayo Saka',7);
INSERT INTO Defensive_stats VALUES ('Carlos Gruezo',2);
INSERT INTO Defensive_stats VALUES ('Carlos Martinez',1);
INSERT INTO Defensive_stats VALUES ('Casemiro',11);
INSERT INTO Defensive_stats VALUES ('Celso Borges',5);
INSERT INTO Defensive_stats VALUES ('Chris Mepham',8);
INSERT INTO Defensive_stats VALUES ('Christian Eriksen',1);
INSERT INTO Defensive_stats VALUES ('Christian Pulisic',2);
INSERT INTO Defensive_stats VALUES ('Christopher Wooh',1);
INSERT INTO Defensive_stats VALUES ('Cody Gakpo',8);
INSERT INTO Defensive_stats VALUES ('Collins Fai',5);
INSERT INTO Defensive_stats VALUES ('Connor Roberts',3);
INSERT INTO Defensive_stats VALUES ('Craig Goodwin',4);
INSERT INTO Defensive_stats VALUES ('Cristian Romero',5);
INSERT INTO Defensive_stats VALUES ('Cesar Azpilicueta',1);
INSERT INTO Defensive_stats VALUES ('Cesar Montes',6);
INSERT INTO Defensive_stats VALUES ('Daichi Kamada',7);
INSERT INTO Defensive_stats VALUES ('Daizen Maeda',3);
INSERT INTO Defensive_stats VALUES ('Daley Blind',14);
INSERT INTO Defensive_stats VALUES ('Dani Alves',5);
INSERT INTO Defensive_stats VALUES ('Dani Carvajal',1);
INSERT INTO Defensive_stats VALUES ('Dani Olmo',5);
INSERT INTO Defensive_stats VALUES ('Daniel Amartey',6);
INSERT INTO Defensive_stats VALUES ('Daniel James',1);
INSERT INTO Defensive_stats VALUES ('Daniel Kyereh',2);
INSERT INTO Defensive_stats VALUES ('Danilo',5);
INSERT INTO Defensive_stats VALUES ('Danilo Pereira',2);
INSERT INTO Defensive_stats VALUES ('Darwin Nunez',3);
INSERT INTO Defensive_stats VALUES ('David Raum',6);
INSERT INTO Defensive_stats VALUES ('Davy Klaassen',3);
INSERT INTO Defensive_stats VALUES ('Dayot Upamecano',11);
INSERT INTO Defensive_stats VALUES ('DeAndre Yedlin',2);
INSERT INTO Defensive_stats VALUES ('Declan Rice',6);
INSERT INTO Defensive_stats VALUES ('Dejan Lovren',7);
INSERT INTO Defensive_stats VALUES ('Denis Odoi',1);
INSERT INTO Defensive_stats VALUES ('Denzel Dumfries',8);
INSERT INTO Defensive_stats VALUES ('Diogo Costa',1);
INSERT INTO Defensive_stats VALUES ('Diogo Dalot',8);
INSERT INTO Defensive_stats VALUES ('Djibril Sow',2);
INSERT INTO Defensive_stats VALUES ('Dries Mertens',2);
INSERT INTO Defensive_stats VALUES ('Dusan Tadic',4);
INSERT INTO Defensive_stats VALUES ('Dusan Vlahovic',1);
INSERT INTO Defensive_stats VALUES ('Dylan Bronn',4);
INSERT INTO Defensive_stats VALUES ('Edimilson Fernandes',2);
INSERT INTO Defensive_stats VALUES ('Edson Alvarez',3);
INSERT INTO Defensive_stats VALUES ('Eduardo Camavinga',14);
INSERT INTO Defensive_stats VALUES ('Ehsan Hajsafi',6);
INSERT INTO Defensive_stats VALUES ('Ellyes Skhiri',10);
INSERT INTO Defensive_stats VALUES ('Enner Valencia',2);
INSERT INTO Defensive_stats VALUES ('Enzo Ebosse',4);
INSERT INTO Defensive_stats VALUES ('Enzo Fernandez',22);
INSERT INTO Defensive_stats VALUES ('Eric Dier',1);
INSERT INTO Defensive_stats VALUES ('Eric Maxim Choupo-Moting',4);
INSERT INTO Defensive_stats VALUES ('Erick Gutierrez',1);
INSERT INTO Defensive_stats VALUES ('Ethan Ampadu',4);
INSERT INTO Defensive_stats VALUES ('Everton Ribeiro',1);
INSERT INTO Defensive_stats VALUES ('Fabian Frei',1);
INSERT INTO Defensive_stats VALUES ('Fabian Rieder',3);
INSERT INTO Defensive_stats VALUES ('Fabian Schar',2);
INSERT INTO Defensive_stats VALUES ('Fabinho',3);
INSERT INTO Defensive_stats VALUES ('Facundo Pellistri',2);
INSERT INTO Defensive_stats VALUES ('Federico Valverde',7);
INSERT INTO Defensive_stats VALUES ('Ferjani Sassi',2);
INSERT INTO Defensive_stats VALUES ('Filip Kostic',6);
INSERT INTO Defensive_stats VALUES ('Firas Al-Buraikan',3);
INSERT INTO Defensive_stats VALUES ('Fran Karacic',2);
INSERT INTO Defensive_stats VALUES ('Francisco Calvo',7);
INSERT INTO Defensive_stats VALUES ('Fred',3);
INSERT INTO Defensive_stats VALUES ('Frenkie de Jong',12);
INSERT INTO Defensive_stats VALUES ('Felix Torres Caicedo',2);
INSERT INTO Defensive_stats VALUES ('Gabriel Jesus',2);
INSERT INTO Defensive_stats VALUES ('Gareth Bale',1);
INSERT INTO Defensive_stats VALUES ('Gavi',8);
INSERT INTO Defensive_stats VALUES ('Gael Ondoua',2);
INSERT INTO Defensive_stats VALUES ('Gideon Mensah',1);
INSERT INTO Defensive_stats VALUES ('Giorgian De Arrascaeta',3);
INSERT INTO Defensive_stats VALUES ('Gleison Bremer',1);
INSERT INTO Defensive_stats VALUES ('Gonzalo Montiel',3);
INSERT INTO Defensive_stats VALUES ('Gonzalo Plata',3);
INSERT INTO Defensive_stats VALUES ('Goncalo Ramos',1);
INSERT INTO Defensive_stats VALUES ('Granit Xhaka',6);
INSERT INTO Defensive_stats VALUES ('Grzegorz Krychowiak',9);
INSERT INTO Defensive_stats VALUES ('Guido Rodriguez',2);
INSERT INTO Defensive_stats VALUES ('Guillermo Varela',3);
INSERT INTO Defensive_stats VALUES ('Haji Wright',2);
INSERT INTO Defensive_stats VALUES ('Hakim Ziyech',10);
INSERT INTO Defensive_stats VALUES ('Hannibal Mejbri',1);
INSERT INTO Defensive_stats VALUES ('Harry Kane',2);
INSERT INTO Defensive_stats VALUES ('Harry Maguire',7);
INSERT INTO Defensive_stats VALUES ('Harry Souttar',4);
INSERT INTO Defensive_stats VALUES ('Harry Wilson',4);
INSERT INTO Defensive_stats VALUES ('Hassan Al Tambakti',4);
INSERT INTO Defensive_stats VALUES ('Hassan Al-Haydos',4);
INSERT INTO Defensive_stats VALUES ('Henry Martin',1);
INSERT INTO Defensive_stats VALUES ('Hiroki Sakai',5);
INSERT INTO Defensive_stats VALUES ('Hirving Lozano',7);
INSERT INTO Defensive_stats VALUES ('Homam Ahmed',2);
INSERT INTO Defensive_stats VALUES ('Hwang Hee-chan',1);
INSERT INTO Defensive_stats VALUES ('Hwang In-beom',4);
INSERT INTO Defensive_stats VALUES ('Hector Herrera',4);
INSERT INTO Defensive_stats VALUES ('Hector Moreno',2);
INSERT INTO Defensive_stats VALUES ('Ibrahima Konate',15);
INSERT INTO Defensive_stats VALUES ('Idrissa Gana Gueye',2);
INSERT INTO Defensive_stats VALUES ('Ilias Chair',1);
INSERT INTO Defensive_stats VALUES ('Ismaila Sarr',4);
INSERT INTO Defensive_stats VALUES ('Issam Jebali',3);
INSERT INTO Defensive_stats VALUES ('Ivan Perisic',7);
INSERT INTO Defensive_stats VALUES ('Inaki Williams',4);
INSERT INTO Defensive_stats VALUES ('Jack Grealish',3);
INSERT INTO Defensive_stats VALUES ('Jackson Irvine',4);
INSERT INTO Defensive_stats VALUES ('Jackson Porozo',2);
INSERT INTO Defensive_stats VALUES ('Jakub Kaminski',6);
INSERT INTO Defensive_stats VALUES ('Jakub Kiwior',2);
INSERT INTO Defensive_stats VALUES ('Jamal Musiala',1);
INSERT INTO Defensive_stats VALUES ('Jawad El Yamiq',4);
INSERT INTO Defensive_stats VALUES ('Jean-Charles Castelletto',3);
INSERT INTO Defensive_stats VALUES ('Jeremy Sarmiento',2);
INSERT INTO Defensive_stats VALUES ('Jesper Lindstrom',1);
INSERT INTO Defensive_stats VALUES ('Jesus Ferreira',1);
INSERT INTO Defensive_stats VALUES ('Jesus Gallardo',9);
INSERT INTO Defensive_stats VALUES ('Jhegson Mendez',2);
INSERT INTO Defensive_stats VALUES ('Joachim Andersen',4);
INSERT INTO Defensive_stats VALUES ('Joakim Maehle',9);
INSERT INTO Defensive_stats VALUES ('Joe Allen',1);
INSERT INTO Defensive_stats VALUES ('Joe Morrell',3);
INSERT INTO Defensive_stats VALUES ('Joe Rodon',2);
INSERT INTO Defensive_stats VALUES ('Joel Campbell',9);
INSERT INTO Defensive_stats VALUES ('John Stones',2);
INSERT INTO Defensive_stats VALUES ('Jonathan David',1);
INSERT INTO Defensive_stats VALUES ('Jonathan Osorio',2);
INSERT INTO Defensive_stats VALUES ('Jordan Ayew',3);
INSERT INTO Defensive_stats VALUES ('Jordan Henderson',4);
INSERT INTO Defensive_stats VALUES ('Jordan Veretout',2);
INSERT INTO Defensive_stats VALUES ('Jordi Alba',6);
INSERT INTO Defensive_stats VALUES ('Jorge Eduardo Sanchez',1);
INSERT INTO Defensive_stats VALUES ('Joshua Kimmich',5);
INSERT INTO Defensive_stats VALUES ('Josip Juranovic',12);
INSERT INTO Defensive_stats VALUES ('Josip Stanisic',3);
INSERT INTO Defensive_stats VALUES ('Jose Cifuentes',2);
INSERT INTO Defensive_stats VALUES ('Jose Maria Gimenez',4);
INSERT INTO Defensive_stats VALUES ('Joao Cancelo',7);
INSERT INTO Defensive_stats VALUES ('Joao Felix',4);
INSERT INTO Defensive_stats VALUES ('Joao Mario',2);
INSERT INTO Defensive_stats VALUES ('Joao Palhinha',2);
INSERT INTO Defensive_stats VALUES ('Josko Gvardiol',9);
INSERT INTO Defensive_stats VALUES ('Juan Pablo Vargas',4);
INSERT INTO Defensive_stats VALUES ('Jude Bellingham',16);
INSERT INTO Defensive_stats VALUES ('Jules Kounde',11);
INSERT INTO Defensive_stats VALUES ('Julian Alvarez',4);
INSERT INTO Defensive_stats VALUES ('Jung Woo-young',5);
INSERT INTO Defensive_stats VALUES ('Junior Hoilett',8);
INSERT INTO Defensive_stats VALUES ('Junya Ito',7);
INSERT INTO Defensive_stats VALUES ('Jurrien Timber',12);
INSERT INTO Defensive_stats VALUES ('Kai Havertz',1);
INSERT INTO Defensive_stats VALUES ('Kalidou Koulibaly',12);
INSERT INTO Defensive_stats VALUES ('Kamal Miller',6);
INSERT INTO Defensive_stats VALUES ('Kamil Glik',2);
INSERT INTO Defensive_stats VALUES ('Kaoru Mitoma',7);
INSERT INTO Defensive_stats VALUES ('Karim Boudiaf',2);
INSERT INTO Defensive_stats VALUES ('Karl Toko Ekambi',1);
INSERT INTO Defensive_stats VALUES ('Karol Swiderski',4);
INSERT INTO Defensive_stats VALUES ('Kasper Dolberg',1);
INSERT INTO Defensive_stats VALUES ('Keanu Baccus',1);
INSERT INTO Defensive_stats VALUES ('Kellyn Acosta',3);
INSERT INTO Defensive_stats VALUES ('Kendall Waston',7);
INSERT INTO Defensive_stats VALUES ('Kevin De Bruyne',1);
INSERT INTO Defensive_stats VALUES ('Kevin Alvarez',1);
INSERT INTO Defensive_stats VALUES ('Keylor Navas',1);
INSERT INTO Defensive_stats VALUES ('Keysher Fuller',4);
INSERT INTO Defensive_stats VALUES ('Kieffer Moore',1);
INSERT INTO Defensive_stats VALUES ('Kieran Trippier',6);
INSERT INTO Defensive_stats VALUES ('Kim Jin-su',10);
INSERT INTO Defensive_stats VALUES ('Kim Min-jae',2);
INSERT INTO Defensive_stats VALUES ('Kim Moonhwan',9);
INSERT INTO Defensive_stats VALUES ('Kim Young-gwon',3);
INSERT INTO Defensive_stats VALUES ('Kingsley Coman',3);
INSERT INTO Defensive_stats VALUES ('Ko Itakura',9);
INSERT INTO Defensive_stats VALUES ('Koke',1);
INSERT INTO Defensive_stats VALUES ('Krystian Bielik',5);
INSERT INTO Defensive_stats VALUES ('Kudus Mohammed',5);
INSERT INTO Defensive_stats VALUES ('Kwon Chang-hoon',1);
INSERT INTO Defensive_stats VALUES ('Kye Rowles',8);
INSERT INTO Defensive_stats VALUES ('Kyle Walker',3);
INSERT INTO Defensive_stats VALUES ('Leander Dendoncker',6);
INSERT INTO Defensive_stats VALUES ('Leandro Paredes',10);
INSERT INTO Defensive_stats VALUES ('Leandro Trossard',1);
INSERT INTO Defensive_stats VALUES ('Lee Jae-sung',5);
INSERT INTO Defensive_stats VALUES ('Lee Kangin',4);
INSERT INTO Defensive_stats VALUES ('Leon Goretzka',5);
INSERT INTO Defensive_stats VALUES ('Leroy Sane',1);
INSERT INTO Defensive_stats VALUES ('Lionel Messi',5);
INSERT INTO Defensive_stats VALUES ('Lisandro Martinez',6);
INSERT INTO Defensive_stats VALUES ('Lovro Majer',3);
INSERT INTO Defensive_stats VALUES ('Lois Openda',1);
INSERT INTO Defensive_stats VALUES ('Lucas Hernandez',1);
INSERT INTO Defensive_stats VALUES ('Lucas Paqueta',7);
INSERT INTO Defensive_stats VALUES ('Luis Chavez',1);
INSERT INTO Defensive_stats VALUES ('Luis Suarez',1);
INSERT INTO Defensive_stats VALUES ('Luka Modric',16);
INSERT INTO Defensive_stats VALUES ('Lukas Klostermann',3);
INSERT INTO Defensive_stats VALUES ('Luke Shaw',3);
INSERT INTO Defensive_stats VALUES ('Luuk de Jong',2);
INSERT INTO Defensive_stats VALUES ('Majid Hosseini',7);
INSERT INTO Defensive_stats VALUES ('Manuel Akanji',4);
INSERT INTO Defensive_stats VALUES ('Marcelo Brozovic',13);
INSERT INTO Defensive_stats VALUES ('Marco Asensio',1);
INSERT INTO Defensive_stats VALUES ('Marcos Acuna',12);
INSERT INTO Defensive_stats VALUES ('Marcus Rashford',1);
INSERT INTO Defensive_stats VALUES ('Marcus Thuram',3);
INSERT INTO Defensive_stats VALUES ('Mario Gotze',1);
INSERT INTO Defensive_stats VALUES ('Mario Pasalic',7);
INSERT INTO Defensive_stats VALUES ('Mark-Anthony Kaye',2);
INSERT INTO Defensive_stats VALUES ('Marko Grujic',1);
INSERT INTO Defensive_stats VALUES ('Marko Livaja',2);
INSERT INTO Defensive_stats VALUES ('Marquinhos',5);
INSERT INTO Defensive_stats VALUES ('Marten de Roon',7);
INSERT INTO Defensive_stats VALUES ('Martinelli',2);
INSERT INTO Defensive_stats VALUES ('Mason Mount',2);
INSERT INTO Defensive_stats VALUES ('Mateo Kovacic',24);
INSERT INTO Defensive_stats VALUES ('Mathew Leckie',4);
INSERT INTO Defensive_stats VALUES ('Mathias Jensen',1);
INSERT INTO Defensive_stats VALUES ('Mathias Olivera',9);
INSERT INTO Defensive_stats VALUES ('Matty Cash',4);
INSERT INTO Defensive_stats VALUES ('Matteo Guendouzi',1);
INSERT INTO Defensive_stats VALUES ('Matias Vecino',4);
INSERT INTO Defensive_stats VALUES ('Matias Vina',4);
INSERT INTO Defensive_stats VALUES ('Maya Yoshida',4);
INSERT INTO Defensive_stats VALUES ('Mehdi Taremi',4);
INSERT INTO Defensive_stats VALUES ('Mehdi Torabi',1);
INSERT INTO Defensive_stats VALUES ('Memphis',1);
INSERT INTO Defensive_stats VALUES ('Michael Estrada',1);
INSERT INTO Defensive_stats VALUES ('Michy Batshuayi',1);
INSERT INTO Defensive_stats VALUES ('Miki Yamane',1);
INSERT INTO Defensive_stats VALUES ('Mikkel Damsgaard',4);
INSERT INTO Defensive_stats VALUES ('Milad Mohammadi',10);
INSERT INTO Defensive_stats VALUES ('Milos Degenek',6);
INSERT INTO Defensive_stats VALUES ('Milos Veljkovic',4);
INSERT INTO Defensive_stats VALUES ('Mislav Orsic',3);
INSERT INTO Defensive_stats VALUES ('Mohamed Ali Ben Romdhane',5);
INSERT INTO Defensive_stats VALUES ('Mohamed Drager',5);
INSERT INTO Defensive_stats VALUES ('Mohamed Kanno',6);
INSERT INTO Defensive_stats VALUES ('Mohammed Al-Breik',1);
INSERT INTO Defensive_stats VALUES ('Mohammed Muntari',2);
INSERT INTO Defensive_stats VALUES ('Mohammed Salisu',2);
INSERT INTO Defensive_stats VALUES ('Moises Caicedo',6);
INSERT INTO Defensive_stats VALUES ('Montassar Talbi',2);
INSERT INTO Defensive_stats VALUES ('Morteza Pouraliganji',2);
INSERT INTO Defensive_stats VALUES ('Moumi Ngamaleu',3);
INSERT INTO Defensive_stats VALUES ('Musab Kheder',1);
INSERT INTO Defensive_stats VALUES ('Na Sang-ho',4);
INSERT INTO Defensive_stats VALUES ('Nader Ghandri',2);
INSERT INTO Defensive_stats VALUES ('Nahuel Molina',8);
INSERT INTO Defensive_stats VALUES ('Nampalys Mendy',4);
INSERT INTO Defensive_stats VALUES ('Nasser Al-Dawsari',2);
INSERT INTO Defensive_stats VALUES ('Nathan Ake',6);
INSERT INTO Defensive_stats VALUES ('Nathaniel Atkinson',4);
INSERT INTO Defensive_stats VALUES ('Nayef Aguerd',4);
INSERT INTO Defensive_stats VALUES ('Naim Sliti',3);
INSERT INTO Defensive_stats VALUES ('Neco Williams',5);
INSERT INTO Defensive_stats VALUES ('Nemanja Gudelj',2);
INSERT INTO Defensive_stats VALUES ('Nemanja Maksimovic',4);
INSERT INTO Defensive_stats VALUES ('Neymar',1);
INSERT INTO Defensive_stats VALUES ('Nico Elvedi',2);
INSERT INTO Defensive_stats VALUES ('Nico Schlotterbeck',4);
INSERT INTO Defensive_stats VALUES ('Nico Williams',4);
INSERT INTO Defensive_stats VALUES ('Nicola Zalewski',4);
INSERT INTO Defensive_stats VALUES ('Nicolas Nkoulou',2);
INSERT INTO Defensive_stats VALUES ('Nicolas Otamendi',10);
INSERT INTO Defensive_stats VALUES ('Nicolas Tagliafico',7);
INSERT INTO Defensive_stats VALUES ('Niklas Sule',5);
INSERT INTO Defensive_stats VALUES ('Nikola Milenkovic',10);
INSERT INTO Defensive_stats VALUES ('Nikola Vlasic',1);
INSERT INTO Defensive_stats VALUES ('Nouhou Tolo',8);
INSERT INTO Defensive_stats VALUES ('Noussair Mazraoui',14);
INSERT INTO Defensive_stats VALUES ('Nestor Araujo',1);
INSERT INTO Defensive_stats VALUES ('Olivier Giroud',1);
INSERT INTO Defensive_stats VALUES ('Orbelin Pineda',4);
INSERT INTO Defensive_stats VALUES ('Otavio',7);
INSERT INTO Defensive_stats VALUES ('Ousmane Dembele',11);
INSERT INTO Defensive_stats VALUES ('Paik Seung-ho',3);
INSERT INTO Defensive_stats VALUES ('Pape Gueye',4);
INSERT INTO Defensive_stats VALUES ('Pape Matar Sarr',3);
INSERT INTO Defensive_stats VALUES ('Papu Gomez',2);
INSERT INTO Defensive_stats VALUES ('Pathe Ciss',3);
INSERT INTO Defensive_stats VALUES ('Paulo Dybala',3);
INSERT INTO Defensive_stats VALUES ('Pedri',4);
INSERT INTO Defensive_stats VALUES ('Pedro',2);
INSERT INTO Defensive_stats VALUES ('Pepe',5);
INSERT INTO Defensive_stats VALUES ('Pervis Estupinan',6);
INSERT INTO Defensive_stats VALUES ('Phil Foden',1);
INSERT INTO Defensive_stats VALUES ('Piero Hincapie',7);
INSERT INTO Defensive_stats VALUES ('Pierre Hojbjerg',4);
INSERT INTO Defensive_stats VALUES ('Pierre Kunde',4);
INSERT INTO Defensive_stats VALUES ('Piotr Zielinski',7);
INSERT INTO Defensive_stats VALUES ('Przemyslaw Frankowski',7);
INSERT INTO Defensive_stats VALUES ('Raheem Sterling',1);
INSERT INTO Defensive_stats VALUES ('Ramin Rezaeian',7);
INSERT INTO Defensive_stats VALUES ('Randal Kolo Muani',7);
INSERT INTO Defensive_stats VALUES ('Raphael Guerreiro',3);
INSERT INTO Defensive_stats VALUES ('Raphael Varane',1);
INSERT INTO Defensive_stats VALUES ('Raphinha',8);
INSERT INTO Defensive_stats VALUES ('Rasmus Nissen',8);
INSERT INTO Defensive_stats VALUES ('Remo Freuler',8);
INSERT INTO Defensive_stats VALUES ('Ricardo Horta',2);
INSERT INTO Defensive_stats VALUES ('Ricardo Rodriguez',7);
INSERT INTO Defensive_stats VALUES ('Richarlison',2);
INSERT INTO Defensive_stats VALUES ('Richie Laryea',3);
INSERT INTO Defensive_stats VALUES ('Riley McGree',2);
INSERT INTO Defensive_stats VALUES ('Ritsu Doan',6);
INSERT INTO Defensive_stats VALUES ('Robert Lewandowski',2);
INSERT INTO Defensive_stats VALUES ('Rodri',5);
INSERT INTO Defensive_stats VALUES ('Rodrigo Bentancur',9);
INSERT INTO Defensive_stats VALUES ('Rodrigo De Paul',11);
INSERT INTO Defensive_stats VALUES ('Rodrygo',4);
INSERT INTO Defensive_stats VALUES ('Rogelio Funes Mori',1);
INSERT INTO Defensive_stats VALUES ('Romain Saiss',5);
INSERT INTO Defensive_stats VALUES ('Ro-Ro',6);
INSERT INTO Defensive_stats VALUES ('Ruben Dias',4);
INSERT INTO Defensive_stats VALUES ('Ruben Neves',2);
INSERT INTO Defensive_stats VALUES ('Sadegh Moharrami',1);
INSERT INTO Defensive_stats VALUES ('Saeid Ezatolahi',6);
INSERT INTO Defensive_stats VALUES ('Saleh Al-Shehri',3);
INSERT INTO Defensive_stats VALUES ('Salem Al-Dawsari',5);
INSERT INTO Defensive_stats VALUES ('Salis Abdul Samed',2);
INSERT INTO Defensive_stats VALUES ('Salman Al-Faraj',1);
INSERT INTO Defensive_stats VALUES ('Saman Ghoddos',1);
INSERT INTO Defensive_stats VALUES ('Samuel Oum Gouet',1);
INSERT INTO Defensive_stats VALUES ('Saud Abdulhamid',5);
INSERT INTO Defensive_stats VALUES ('Sasa Lukic',2);
INSERT INTO Defensive_stats VALUES ('Sebastian Szymanski',6);
INSERT INTO Defensive_stats VALUES ('Sebastian Coates',1);
INSERT INTO Defensive_stats VALUES ('Selim Amallah',13);
INSERT INTO Defensive_stats VALUES ('Serge Gnabry',5);
INSERT INTO Defensive_stats VALUES ('Sergej Milinkovic-Savic',5);
INSERT INTO Defensive_stats VALUES ('Sergio Busquets',7);
INSERT INTO Defensive_stats VALUES ('Sergino Dest',4);
INSERT INTO Defensive_stats VALUES ('Shaquell Moore',2);
INSERT INTO Defensive_stats VALUES ('Shogo Taniguchi',1);
INSERT INTO Defensive_stats VALUES ('Silvan Widmer',10);
INSERT INTO Defensive_stats VALUES ('Sofiane Boufal',11);
INSERT INTO Defensive_stats VALUES ('Sofyan Amrabat',16);
INSERT INTO Defensive_stats VALUES ('Son Heung-min',5);
INSERT INTO Defensive_stats VALUES ('Son Jun-ho',3);
INSERT INTO Defensive_stats VALUES ('Sorba Thomas',1);
INSERT INTO Defensive_stats VALUES ('Srdan Babic',1);
INSERT INTO Defensive_stats VALUES ('Stephen Eustaquio',4);
INSERT INTO Defensive_stats VALUES ('Steven Berghuis',2);
INSERT INTO Defensive_stats VALUES ('Steven Bergwijn',1);
INSERT INTO Defensive_stats VALUES ('Steven Vitoria',3);
INSERT INTO Defensive_stats VALUES ('Strahinja Pavlovic',7);
INSERT INTO Defensive_stats VALUES ('Tajon Buchanan',1);
INSERT INTO Defensive_stats VALUES ('Takefusa Kubo',1);
INSERT INTO Defensive_stats VALUES ('Takumi Minamino',2);
INSERT INTO Defensive_stats VALUES ('Tarek Salman',1);
INSERT INTO Defensive_stats VALUES ('Tariq Lamptey',3);
INSERT INTO Defensive_stats VALUES ('Teun Koopmeiners',10);
INSERT INTO Defensive_stats VALUES ('Theo Hernandez',16);
INSERT INTO Defensive_stats VALUES ('Thiago Silva',3);
INSERT INTO Defensive_stats VALUES ('Thilo Kehrer',6);
INSERT INTO Defensive_stats VALUES ('Thomas Delaney',1);
INSERT INTO Defensive_stats VALUES ('Thomas Meunier',6);
INSERT INTO Defensive_stats VALUES ('Thomas Muller',2);
INSERT INTO Defensive_stats VALUES ('Thomas Partey',9);
INSERT INTO Defensive_stats VALUES ('Thorgan Hazard',3);
INSERT INTO Defensive_stats VALUES ('Tim Ream',4);
INSERT INTO Defensive_stats VALUES ('Timothy Castagne',7);
INSERT INTO Defensive_stats VALUES ('Toby Alderweireld',4);
INSERT INTO Defensive_stats VALUES ('Tyler Adams',11);
INSERT INTO Defensive_stats VALUES ('Uriel Antuna',4);
INSERT INTO Defensive_stats VALUES ('Vincent Janssen',2);
INSERT INTO Defensive_stats VALUES ('Vinicius Junior',3);
INSERT INTO Defensive_stats VALUES ('Virgil van Dijk',2);
INSERT INTO Defensive_stats VALUES ('Vitinha',3);
INSERT INTO Defensive_stats VALUES ('Wahbi Khazri',2);
INSERT INTO Defensive_stats VALUES ('Wajdi Kechrida',3);
INSERT INTO Defensive_stats VALUES ('Walid Cheddira',1);
INSERT INTO Defensive_stats VALUES ('Walker Zimmerman',3);
INSERT INTO Defensive_stats VALUES ('Wataru Endo',8);
INSERT INTO Defensive_stats VALUES ('Weston McKennie',2);
INSERT INTO Defensive_stats VALUES ('William Carvalho',6);
INSERT INTO Defensive_stats VALUES ('Xavi Simons',1);
INSERT INTO Defensive_stats VALUES ('Yahya Attiat Allah',4);
INSERT INTO Defensive_stats VALUES ('Yannick Carrasco',5);
INSERT INTO Defensive_stats VALUES ('Yasser Al-Shahrani',3);
INSERT INTO Defensive_stats VALUES ('Yassine Meriah',4);
INSERT INTO Defensive_stats VALUES ('Yeltsin Tejeda',4);
INSERT INTO Defensive_stats VALUES ('Youri Tielemans',3);
INSERT INTO Defensive_stats VALUES ('Youssef En-Nesyri',3);
INSERT INTO Defensive_stats VALUES ('Youssef Msakni',3);
INSERT INTO Defensive_stats VALUES ('Youssouf Fofana',8);
INSERT INTO Defensive_stats VALUES ('Youssouf Sabaly',6);
INSERT INTO Defensive_stats VALUES ('Youstin Salas',5);
INSERT INTO Defensive_stats VALUES ('Yuki Soma',2);
INSERT INTO Defensive_stats VALUES ('Yunus Musah',8);
INSERT INTO Defensive_stats VALUES ('Yuto Nagatomo',4);
INSERT INTO Defensive_stats VALUES ('Zakaria Aboukhlal',1);
INSERT INTO Defensive_stats VALUES ('Alvaro Morata',1);
INSERT INTO Defensive_stats VALUES ('Alvaro Zamora',2);
INSERT INTO Defensive_stats VALUES ('Angel Correa',1);
INSERT INTO Defensive_stats VALUES ('Angel Di Maria',3);
INSERT INTO Defensive_stats VALUES ('Angelo Preciado',7);
INSERT INTO Defensive_stats VALUES ('Eder Militao',7);
INSERT INTO Defensive_stats VALUES ('Oscar Duarte',4);
INSERT INTO Defensive_stats VALUES ('Ilkay Gundogan',3);
--Src https://www.kaggle.com/datasets/swaptr/fifa-world-cup-2022-statistics

SELECT * FROM DEFENSIVE_STATS WHERE TACKLES > 0;

INSERT INTO GoalKeeper VALUES ('Aimen Dahmen',9,2,10);
INSERT INTO GoalKeeper VALUES ('Alireza Beiranvand',4,0,5);
INSERT INTO GoalKeeper VALUES ('Alisson',5,2,7);
INSERT INTO GoalKeeper VALUES ('Andries Noppert',18,2,22);
INSERT INTO GoalKeeper VALUES ('Andre Onana',2,0,3);
INSERT INTO GoalKeeper VALUES ('Danny Ward',4,0,9);
INSERT INTO GoalKeeper VALUES ('Devis Epassy',9,1,12);
INSERT INTO GoalKeeper VALUES ('Diogo Costa',11,1,17);
INSERT INTO GoalKeeper VALUES ('Dominik Livakovic',24,2,31);
INSERT INTO GoalKeeper VALUES ('Ederson',2,0,3);
INSERT INTO GoalKeeper VALUES ('Edouard Mendy',7,0,14);
INSERT INTO GoalKeeper VALUES ('Emiliano Martinez',6,3,13);
INSERT INTO GoalKeeper VALUES ('Gregor Kobel',2,0,4);
INSERT INTO GoalKeeper VALUES ('Guillermo Ochoa',2,1,6);
INSERT INTO GoalKeeper VALUES ('Hernan Galindez',1,1,4);
INSERT INTO GoalKeeper VALUES ('Hossein Hosseini',4,1,10);
INSERT INTO GoalKeeper VALUES ('Hugo Lloris',17,1,24);
INSERT INTO GoalKeeper VALUES ('Jordan Pickford',7,3,11);
INSERT INTO GoalKeeper VALUES ('Kasper Schmeichel',8,1,11);
INSERT INTO GoalKeeper VALUES ('Keylor Navas',11,1,22);
INSERT INTO GoalKeeper VALUES ('Kim Seung-gyu',11,1,19);
INSERT INTO GoalKeeper VALUES ('Lawrence Ati-Zigi',10,0,17);
INSERT INTO GoalKeeper VALUES ('Manuel Neuer',8,0,13);
INSERT INTO GoalKeeper VALUES ('Mathew Ryan',12,2,18);
INSERT INTO GoalKeeper VALUES ('Matt Turner',8,2,12);
INSERT INTO GoalKeeper VALUES ('Meshaal Barsham',4,0,9);
INSERT INTO GoalKeeper VALUES ('Milan Borjan',8,0,15);
INSERT INTO GoalKeeper VALUES ('Mohammed Al-Owais',14,0,19);
INSERT INTO GoalKeeper VALUES ('Munir',3,1,3);
INSERT INTO GoalKeeper VALUES ('Saad Al Sheeb',1,0,3);
INSERT INTO GoalKeeper VALUES ('Sergio Rochet',4,2,7);
INSERT INTO GoalKeeper VALUES ('Shuichi Gonda',15,0,19);
INSERT INTO GoalKeeper VALUES ('Steve Mandanda',2,0,3);
INSERT INTO GoalKeeper VALUES ('Thibaut Courtois',8,2,11);
INSERT INTO GoalKeeper VALUES ('Unai Simon',6,2,9);
INSERT INTO GoalKeeper VALUES ('Vanja Milinkovic-Savic',16,0,24);
INSERT INTO GoalKeeper VALUES ('Wayne Hennessey',4,0,5);
INSERT INTO GoalKeeper VALUES ('Wojciech Szczesny',21,2,28);
INSERT INTO GoalKeeper VALUES ('Weverton',0,0,0);
INSERT INTO GoalKeeper VALUES ('Yann Sommer',12,1,19);
INSERT INTO GoalKeeper VALUES ('Yassine Bounou',7,3,11);
--Src https://www.kaggle.com/datasets/swaptr/fifa-world-cup-2022-statistics

INSERT INTO STADIUM VALUES ('Al Bayt Stadium', 60000, 'Al Khor');
INSERT INTO STADIUM VALUES ('Lusail Iconic Stadium', 80000, 'Lusail');
INSERT INTO STADIUM VALUES ('Education City Stadium', 40000, 'Al Rayyan');
INSERT INTO STADIUM VALUES ('Stadium 974', 40000, 'Doha');
INSERT INTO STADIUM VALUES ('Khalifa International Stadium', 40000, 'Doha');
INSERT INTO STADIUM VALUES ('Ahmed bin Ali Stadium', 40000, 'Umm Al Afaei');
INSERT INTO STADIUM VALUES ('Al Thumama Stadium', 40000,'Doha');
INSERT INTO STADIUM VALUES ('Al Janoub Stadium', 40000,'Al Wakrah');
--Src https://www.kaggle.com/datasets/swaptr/fifa-world-cup-2022-statistics

INSERT INTO match VALUES (1,'20-Nov-22','Qatar','Ecuador',0,2,'Al Bayt Stadium','Group A');
INSERT INTO match VALUES (2,'21-Nov-22','England','IR Iran',6,2,'Khalifa International Stadium','Group B');
INSERT INTO match VALUES (3,'21-Nov-22','Senegal','Netherlands',0,2,'Al Thumama Stadium','Group A');
INSERT INTO match VALUES (4,'21-Nov-22','United States','Wales',1,1,'Ahmed bin Ali Stadium','Group B');
INSERT INTO match VALUES (5,'22-Nov-22','Argentina','Saudi Arabia',1,2,'Lusail Iconic Stadium','Group C');
INSERT INTO match VALUES (6,'22-Nov-22','Denmark','Tunisia',0,0,'Education City Stadium','Group D');
INSERT INTO match VALUES (7,'22-Nov-22','Mexico','Poland',0,0,'Stadium 974','Group C');
INSERT INTO match VALUES (8,'22-Nov-22','France','Australia',4,1,'Al Janoub Stadium','Group D');
INSERT INTO match VALUES (9,'23-Nov-22','Morocco','Croatia',0,0,'Al Bayt Stadium','Group F');
INSERT INTO match VALUES (10,'23-Nov-22','Germany','Japan',1,2,'Khalifa International Stadium','Group E');
INSERT INTO match VALUES (11,'23-Nov-22','Spain','Costa Rica',7,0,'Al Thumama Stadium','Group E');
INSERT INTO match VALUES (12,'23-Nov-22','Belgium','Canada',1,0,'Ahmed bin Ali Stadium','Group F');
INSERT INTO match VALUES (13,'24-Nov-22','Switzerland','Cameroon',1,0,'Al Janoub Stadium','Group G');
INSERT INTO match VALUES (14,'24-Nov-22','Uruguay','Korea Republic',0,0,'Education City Stadium','Group H');
INSERT INTO match VALUES (15,'24-Nov-22','Portugal','Ghana',3,2,'Stadium 974','Group H');
INSERT INTO match VALUES (16,'24-Nov-22','Brazil','Serbia',2,0,'Lusail Iconic Stadium','Group G');
INSERT INTO match VALUES (17,'25-Nov-22','Wales','IR Iran',0,2,'Ahmed bin Ali Stadium','Group B');
INSERT INTO match VALUES (18,'25-Nov-22','Qatar','Senegal',1,3,'Al Thumama Stadium','Group A');
INSERT INTO match VALUES (19,'25-Nov-22','Netherlands','Ecuador',1,1,'Khalifa International Stadium','Group A');
INSERT INTO match VALUES (20,'25-Nov-22','England','United States',0,0,'Al Bayt Stadium','Group B');
INSERT INTO match VALUES (21,'26-Nov-22','Tunisia','Australia',0,1,'Al Janoub Stadium','Group D');
INSERT INTO match VALUES (22,'26-Nov-22','Poland','Saudi Arabia',2,0,'Education City Stadium','Group C');
INSERT INTO match VALUES (23,'26-Nov-22','France','Denmark',2,1,'Stadium 974','Group D');
INSERT INTO match VALUES (24,'26-Nov-22','Argentina','Mexico',2,0,'Lusail Iconic Stadium','Group C');
INSERT INTO match VALUES (25,'27-Nov-22','Japan','Costa Rica',0,1,'Ahmed bin Ali Stadium','Group E');
INSERT INTO match VALUES (26,'27-Nov-22','Belgium','Morocco',0,2,'Al Thumama Stadium','Group F');
INSERT INTO match VALUES (27,'27-Nov-22','Croatia','Canada',4,1,'Khalifa International Stadium','Group F');
INSERT INTO match VALUES (28,'27-Nov-22','Spain','Germany',1,1,'Al Bayt Stadium','Group E');
INSERT INTO match VALUES (29,'28-Nov-22','Cameroon','Serbia',3,3,'Al Janoub Stadium','Group G');
INSERT INTO match VALUES (30,'28-Nov-22','Korea Republic','Ghana',2,3,'Education City Stadium','Group H');
INSERT INTO match VALUES (31,'28-Nov-22','Brazil','Switzerland',1,0,'Stadium 974','Group G');
INSERT INTO match VALUES (32,'28-Nov-22','Portugal','Uruguay',2,0,'Lusail Iconic Stadium','Group H');
INSERT INTO match VALUES (33,'29-Nov-22','Ecuador','Senegal',2,0,'Khalifa International Stadium','Group A');
INSERT INTO match VALUES (34,'29-Nov-22','Netherlands','Qatar',1,2,'Al Bayt Stadium','Group A');
INSERT INTO match VALUES (35,'29-Nov-22','Wales','England',0,3,'Ahmed bin Ali Stadium','Group B');
INSERT INTO match VALUES (36,'29-Nov-22','IR Iran','United States',0,1,'Al Thumama Stadium','Group B');
INSERT INTO match VALUES (37,'30-Nov-22','Australia','Denmark',1,0,'Al Janoub Stadium','Group D');
INSERT INTO match VALUES (38,'30-Nov-22','Tunisia','France',1,0,'Education City Stadium','Group D');
INSERT INTO match VALUES (39,'30-Nov-22','Saudi Arabia','Mexico',0,2,'Lusail Iconic Stadium','Group C');
INSERT INTO match VALUES (40,'30-Nov-22','Poland','Argentina',1,2,'Stadium 974','Group C');
INSERT INTO match VALUES (41,'01-Dec-22','Canada','Morocco',0,0,'Al Thumama Stadium','Group F');
INSERT INTO match VALUES (42,'01-Dec-22','Croatia','Belgium',1,2,'Ahmed bin Ali Stadium','Group F');
INSERT INTO match VALUES (43,'01-Dec-22','Japan','Spain',2,1,'Khalifa International Stadium','Group E');
INSERT INTO match VALUES (44,'01-Dec-22','Costa Rica','Germany',2,4,'Al Bayt Stadium','Group E');
INSERT INTO match VALUES (45,'02-Dec-22','Ghana','Uruguay',0,2,'Al Janoub Stadium','Group H');
INSERT INTO match VALUES (46,'02-Dec-22','Korea Republic','Portugal',2,1,'Education City Stadium','Group H');
INSERT INTO match VALUES (47,'02-Dec-22','Serbia','Switzerland',2,3,'Stadium 974','Group G');
INSERT INTO match VALUES (48,'02-Dec-22','Cameroon','Brazil',1,0,'Lusail Iconic Stadium','Group G');
INSERT INTO match VALUES (49,'03-Dec-22','Netherlands','United States',3,1,'Khalifa International Stadium','Round of 16');
INSERT INTO match VALUES (50,'03-Dec-22','Argentina','Australia',2,1,'Ahmed bin Ali Stadium','Round of 16');
INSERT INTO match VALUES (51,'04-Dec-22','France','Poland',3,1,'Al Thumama Stadium','Round of 16');
INSERT INTO match VALUES (52,'04-Dec-22','England','Senegal',3,0,'Al Bayt Stadium','Round of 16');
INSERT INTO match VALUES (53,'05-Dec-22','Japan','Croatia',1,1,'Al Janoub Stadium','Round of 16');
INSERT INTO match VALUES (54,'05-Dec-22','Brazil','Korea Republic',4,1,'Stadium 974','Round of 16');
INSERT INTO match VALUES (55,'06-Dec-22','Morocco','Spain',0,0,'Education City Stadium','Round of 16');
INSERT INTO match VALUES (56,'06-Dec-22','Portugal','Switzerland',6,1,'Lusail Iconic Stadium','Round of 16');
INSERT INTO match VALUES (57,'09-Dec-22','Croatia','Brazil',1,1,'Education City Stadium','Quarter-final');
INSERT INTO match VALUES (58,'09-Dec-22','Netherlands','Argentina',2,2,'Lusail Iconic Stadium','Quarter-final');
INSERT INTO match VALUES (59,'10-Dec-22','Morocco','Portugal',1,0,'Al Thumama Stadium','Quarter-final');
INSERT INTO match VALUES (60,'10-Dec-22','England','France',1,2,'Al Bayt Stadium','Quarter-final');
INSERT INTO match VALUES (61,'13-Dec-22','Argentina','Croatia',3,0,'Lusail Iconic Stadium','Semi-final');
INSERT INTO match VALUES (62,'14-Dec-22','France','Morocco',2,0,'Al Bayt Stadium','Semi-final');
INSERT INTO match VALUES (63,'17-Dec-22','Croatia','Morocco',2,1,'Khalifa International Stadium','Play-off for third place');
INSERT INTO match VALUES (64,'18-Dec-22','Argentina','France',3,3,'Lusail Iconic Stadium','Final');
--Src https://www.kaggle.com/datasets/swaptr/fifa-world-cup-2022-statistics

INSERT INTO PLAYER_AWARD VALUES ('Kylian Mbappe', 'Golden Boot');
INSERT INTO PLAYER_AWARD VALUES ('Lionel Messi', 'Golden Ball');
INSERT INTO PLAYER_AWARD VALUES ('Emiliano Martinez', 'Golden Glove');
INSERT INTO PLAYER_AWARD VALUES ('Enzo Fernandez', 'FIFA Young Player');
--Src https://economictimes.indiatimes.com/news/international/us/fifa-world-cup-2022-awards-list-of-all-fifa-prizes-winners-include-messi-mbappe-and-england/articleshow/96345301.cms

INSERT INTO TEAM_AWARD VALUES ('England', 'FIFA Fair Play Trophy');
INSERT INTO TEAM_AWARD VALUES ('Argentina', 'FIFA World Cup Winner');
INSERT INTO TEAM_AWARD VALUES ('France', 'FIFA World Cup Runner-up');
--Src https://economictimes.indiatimes.com/news/international/us/fifa-world-cup-2022-awards-list-of-all-fifa-prizes-winners-include-messi-mbappe-and-england/articleshow/96345301.cms

--Queries
--Q1 Select All teams who have not played in 'Lusail Iconic Stadium'.
SELECT T.Name
FROM TEAM T
WHERE T.Name NOT IN 
    (SELECT DISTINCT(M.Team1) FROM Match M WHERE M.stadium_name = 'Lusail Iconic Stadium')
      AND T.Name NOT IN
     (SELECT DISTINCT(M.Team2) FROM Match M WHERE M.stadium_name = 'Lusail Iconic Stadium'); 

--Q2 Select Most goal scoring match in 'Khalifa International Stadium'
SELECT Team1,Team2,Team1_score+Team2_score AS GOAL_SCORED
FROM MATCH
WHERE Team1_score+Team2_score = (SELECT MAX(Team1_score+Team2_score) FROM MATCH WHERE Stadium_name = 'Khalifa International Stadium');

--Q3 List all Teammates of Golden Ball Winner who assited atleast once
SELECT P.name,ATS.assist
FROM Player P, Attacking_stats ATS
WHERE p.name = ATS.Player_name AND P.team_name IN 
(SELECT P.team_name
FROM Player_award PA, Player P
WHERE PA.Award_name = 'Golden Ball' AND PA.Player_name = P.name)
AND P.name != 
(SELECT Player_name FROM Player_award WHERE Award_name = 'Golden Ball')
AND ATS.assist > 0;

--Q4 SELECT Team Name who has lost in Round of 16
SELECT Name
FROM Team
WHERE Name NOT IN 
(SELECT Team1
FROM Match
Where Match_type = 'Quarter-final')
AND Name NOT IN
(SELECT Team2
FROM Match
Where Match_type = 'Quarter-final')
AND (Name IN 
(SELECT Team1
FROM Match
Where Match_type = 'Round of 16')
OR Name IN
(SELECT Team2
FROM Match
Where Match_type = 'Round of 16'));

--Q5 Select manager name of Winning team and Tell no of player in the winning team.
SELECT M.name,P.Team_name,COUNT(*) AS TOTAL_PLAYERS
FROM Manager M,Player P
WHERE M.team_name = P.Team_name AND P.Team_name = (SELECT Team_name FROM TEAM_AWARD WHERE Award_name = 'FIFA World Cup Winner')
Group by M.name,P.Team_name;

--Q6 No of days World Cup Held
SELECT (MAX(Match_date)-MIN(Match_date)) AS DAYS FROM Match;

--Q7 Select Defenders Who Have Scored Goal alteast once in desending order
SELECT P.Name,AST.Goal_scored
FROM Player P, Attacking_stats AST
WHERE P.name = AST.player_name AND P.position = 'DF' AND AST.Goal_scored > 0
ORDER BY AST.Goal_scored DESC;

--Q8 Name the teams who has beaten or drawn with FIFA Fair Play Trophy Winner
SELECT T.name
FROM Team T
WHERE T.name IN 
(SELECT Team2
From MATCH
    WHERE (SELECT Team_name 
        FROM Team_award 
        WHERE Award_name = 'FIFA Fair Play Trophy') = Team1 
    AND Team2_score >= Team1_score) OR
T.name IN
(SELECT Team1
From MATCH
    WHERE (SELECT Team_name 
        FROM Team_award
        WHERE Award_name = 'FIFA Fair Play Trophy') = Team2 
    AND Team1_score >= Team2_score);
    
--Q9 Select the team Who have Reached Quater-finals But not Finished 1st in the group
SELECT T.name
FROM Team T
WHERE T.group_position != 1 AND (T.Name IN (SELECT Team1 FROM Match WHERE Match_type = 'Quarter-final') OR  T.Name IN (SELECT Team2 FROM Match WHERE Match_type = 'Quarter-final'));

--Q10 Select teams which have atleast 5 different players to score goals in descending order
SELECT P.team_name,COUNT(*)
FROM Player P,Attacking_stats AST
WHERE P.name = AST.player_name AND AST.goal_scored > 0
GROUP BY P.team_name
HAVING COUNT(*) >= 5
ORDER BY COUNT(*) DESC;

--Q11 Select number of matches Each team won in descending order
SELECT T.name,COUNT(*)
FROM Team T,Match M
WHERE (T.name = M.Team1 OR T.name = M.Team2) AND ((M.team1=T.name AND M.team1_score>M.team2_score) OR (M.team2=T.name AND M.team2_score>M.team1_score))
GROUP BY T.name
ORDER BY COUNT(*) DESC;

--Q12 Select the team who have lost most matches
SELECT T.name,COUNT(*)
FROM Team T,Match M
WHERE (T.name = M.Team1 OR T.name = M.Team2) AND ((M.team1=T.name AND M.team1_score<M.team2_score) OR (M.team2=T.name AND M.team2_score<M.team1_score))
GROUP BY T.name
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
FROM Team T,Match M
WHERE (T.name = M.Team1 OR T.name = M.Team2) AND ((M.team1=T.name AND M.team1_score<M.team2_score) OR (M.team2=T.name AND M.team2_score<M.team1_score))
GROUP BY T.name);

--Q13 Show the team name who has highest number of tackles
SELECT P.Team_name,SUM(Tackles)
FROM PLAYER P,defensive_stats DS
WHERE P.Name = DS.Player_name 
GROUP BY P.Team_name
HAVING SUM(Tackles) = (SELECT MAX(SUM(Tackles))
FROM PLAYER P,defensive_stats DS
WHERE P.Name = DS.Player_name 
GROUP BY P.Team_name);

--Q14 Show teams name and number of players who has won any award in desending order
SELECT P.team_name,COUNT(*)
FROM Player_award PA,Player P
WHERE PA.Player_name=P.name
Group BY P.team_name
ORDER BY COUNT(*) DESC;

--Q15 No of saves, Clean Sheets does the Golden Glove winner has?
SELECT PA.Player_name,G.clean_sheets,G.Saves
FROM Player_award PA
JOIN Goalkeeper G ON PA.Player_name = G.Player_name
WHERE PA.Award_name = 'Golden Glove';

--Q16 Write a PL/SQL block to display the names of all players who have received more than 2 yellow cards in the "Player" table.
DECLARE
  v_yellow_card_threshold NUMBER(10) := 2;
BEGIN
  FOR player IN (SELECT Name FROM Player WHERE Yellow_Card > v_yellow_card_threshold)
  LOOP
    DBMS_OUTPUT.PUT_LINE(player.Name);
  END LOOP;
END;

--Q17 Create a Procedure for average number of goals scored per match whenever the given team has played
CREATE OR REPLACE PROCEDURE get_avg_goals(team_name IN VARCHAR2)
  AS
  avg_goals NUMBER;
BEGIN
  SELECT AVG(Team1_Score + Team2_score) INTO avg_goals
  FROM match
  WHERE Team1 = team_name OR Team2 = team_name;
  DBMS_OUTPUT.PUT_LINE('Average goals are '||avg_goals);
END;
/

BEGIN
get_avg_goals('Croatia');
END;
/

--Q18 Write a PL/SQL block to display the total number of matches played by each team in the "match" table
DECLARE
  team_name VARCHAR(50);
  match_count NUMBER(10);
BEGIN
  FOR team IN (SELECT DISTINCT Team1 FROM match UNION SELECT DISTINCT Team2 FROM match)
  LOOP
    team_name := team.Team1;
    SELECT COUNT(*) INTO match_count FROM match WHERE Team1 = team_name OR Team2 = team_name;
    DBMS_OUTPUT.PUT_LINE('Team: ' || team_name || ', Matches Played: ' || match_count);
  END LOOP;
END;
/

--Q19 A function that takes in a team name and returns the total number of red cards received by all the players in that team:
CREATE OR REPLACE FUNCTION get_total_red_cards(team_name IN VARCHAR)
RETURN INT
IS
  total_red_cards INT;
BEGIN
  SELECT SUM(Red_Card) INTO total_red_cards
  FROM Player
  WHERE Team_name = team_name;
  RETURN total_red_cards;
END;
/

select get_total_red_cards('Croatia') from DUAL;

--Q20 Create a trigger to change 'FIFA World Cup Winner' award team if 'Final' type match score is changed
CREATE OR REPLACE TRIGGER winner_changer
AFTER UPDATE ON match
FOR EACH ROW
WHEN (NEW.Match_type = 'Final')
DECLARE
  team1_name VARCHAR(50);
  team2_name VARCHAR(50);
BEGIN
  team1_name := :NEW.Team1;
  team2_name := :NEW.Team2;
  IF :NEW.Team1_Score > :NEW.Team2_score THEN
    UPDATE Team_award
    SET Team_name = team1_name
    WHERE award_name = 'FIFA World Cup Winner';
    UPDATE Team_award
    SET Team_name = team2_name
    WHERE award_name = 'FIFA World Cup Runner-up';
	dbms_output.put_line('New World cup winner is '||team1_name);
  ELSIF :NEW.Team1_Score < :NEW.Team2_score THEN
    UPDATE Team_award
    SET Team_name = team2_name
    WHERE award_name = 'FIFA World Cup Winner';
	dbms_output.put_line('New World cup winner is '||team2_name);
    UPDATE Team_award
    SET Team_name = team1_name
    WHERE award_name = 'FIFA World Cup Runner-up';
  END IF;
END;
/

--UPDATE MATCH SET Team2_score = 3 WHERE MATCH_ID = 64;

SELECT * FROM TEAM_AWARD;


SELECT team1,team2,team1_score,team2_score 
from match 
where (team1='Argentina' or team1='Spain') AND (team2='Argentina' or team2='Spain');

SELECT team1,team2,team1_score,team2_score 
from match 
where (team1='Argentina' or team1='France') AND (team2='Argentina' or team2='France');

SELECT team1,team2,team1_score,team2_score 
from match 
where (team1='Argentina' or team1='Croatia') AND (team2='Argentina' or team2='Croatia');

SELECT team1,team2,team1_score,team2_score 
from match 
where match_type= 'Group D';