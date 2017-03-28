
--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::20170130000254::diego
CREATE TABLE City (id INT NOT NULL, name VARCHAR(20) NOT NULL, state VARCHAR(10) NULL, CONSTRAINT PK_CITY PRIMARY KEY (id), CONSTRAINT unq_city_name UNIQUE (name));


--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::20170206_add_country_id_to_city::diego
ALTER TABLE City ADD country_id INT NULL;


--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::201702062256_add_fk_city_country::diego
ALTER TABLE City ADD CONSTRAINT fk_city_country FOREIGN KEY (country_id) REFERENCES Country (id);


--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::20170206_insert_data_City::diego
--  WARNING The following SQL may change each run and therefore is possibly incorrect and/or invalid:
INSERT INTO City (id, name, state, country_id) VALUES (1, 'Amsterdam', 'VV', 17),(2, 'Bangalore', '', 14),(3, 'Berlin', '', 12),(4, 'Bordeaux', '', 11),(5, 'Boston', 'MA', 24),(6, 'Brasília', 'DF', 5),(7, 'Brussels', '', 4),(8, 'Budapest', '', 13),(9, 'Buenos Aires', '', 1),(10, 'Chicago', 'IL', 24),(11, 'Copenhagen', '', 9),(12, 'Cupertino', 'CA', 24),(13, 'Delhi', '', 14),(14, 'Dijon', '', 11),(15, 'Dublin', 'Dublin', 15),(16, 'Edinburgh ', '', 23),(17, 'Edmonton', 'AB', 6),(18, 'Fort Worth', 'TX', 24),(19, 'Frankfurt', '', 12),(20, 'Halifax', 'NS', 6),(21, 'Helsinki', '', 10),(22, 'Lisbon', '', 20),(23, 'London', '', 23),(24, 'Lyon', '', 11),(25, 'Madison', 'WI', 24),(26, 'Madrid', '', 21),(27, 'Montréal', 'QC', 6),(28, 'Mountain View', 'CA', 24),(29, 'New York', 'NY', 24),(30, 'Orlando', 'FL', 24),(31, 'Oslo', '', 18),(32, 'Ottawa', 'ON', 6),(33, 'Paris', '', 11),(34, 'Porto', '', 20),(35, 'Prague', '', 8),(36, 'Redmond', 'WA', 24),(37, 'Reno', 'NV', 24),(38, 'Rio de Janeiro', 'RJ', 5),(39, 'Rome', 'RM', 16),(40, 'Salt Lake City', 'UT', 24),(41, 'Santiago', '', 7),(42, 'São José dos Campos', 'SP', 5),(43, 'São Paulo', 'SP', 5),(44, 'Sidney', 'NSW', 2),(45, 'Stockholm', '', 22),(46, 'Stuttgart', '', 12),(47, 'Toronto', 'ON', 6),(48, 'Tucson', 'AZ', 24),(49, 'Vancouver', 'BC', 6),(50, 'Vienne', '', 3),(51, 'Warsaw', '', 19);

INSERT INTO City (id, name, state, country_id) VALUES (52, 'Winnipeg', 'MB', 6),(53, 'Yellowknife', 'NT', 6);

