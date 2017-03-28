
--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::201702121706_v_customer_city_country_update::diego
CREATE OR REPLACE VIEW v_customer_city_country AS select  cu.*,ci.id as id_city, ci.name as city_name, ci.state as city_state, co.name as country_name
            from Customer cu join City ci on (cu.city_id like ci.id)
            join Country co on (ci.country_id = co.id);



