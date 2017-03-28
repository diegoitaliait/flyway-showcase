--  Changeset src/main/resources/liquibase/changelog/1_4/1_4_changelog.xml::201702121720_add_column_vat_to_invoice::diego
ALTER TABLE Invoice ADD vat INT DEFAULT ${vat.value} NULL;