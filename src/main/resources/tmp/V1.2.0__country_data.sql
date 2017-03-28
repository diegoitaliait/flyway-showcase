--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::20170130002415::diego
CREATE TABLE Country (id INT NOT NULL, name VARCHAR(20) NOT NULL, CONSTRAINT PK_COUNTRY PRIMARY KEY (id), CONSTRAINT unq_country_name UNIQUE (name));


--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::201702062225_insert_data_Country::diego
--  WARNING The following SQL may change each run and therefore is possibly incorrect and/or invalid:
INSERT INTO Country (id, name) VALUES (1, 'Argentina'),(2, 'Australia'),(3, 'Austria'),(4, 'Belgium'),(5, 'Brazil'),(6, 'Canada'),(7, 'Chile'),(8, 'Czech Republic'),(9, 'Denmark'),(10, 'Finland'),(11, 'France'),(12, 'Germany'),(13, 'Hungary'),(14, 'India'),(15, 'Ireland'),(16, 'Italy'),(17, 'Netherlands'),(18, 'Norway'),(19, 'Poland'),(20, 'Portugal'),(21, 'Spain'),(22, 'Sweden'),(23, 'United Kingdom'),(24, 'USA');
