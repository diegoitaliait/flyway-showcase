
--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::20170211_v_customer_city_country::diego
CREATE OR REPLACE VIEW v_customer_city_country AS select  cu.*,ci.id as id_city, ci.name as city_name, ci.state as city_state, co.name as country_name
            from Customer cu join City ci on (cu.City like ci.name)
            join Country co on (ci.country_id = co.id);


--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::20170209_add_city_id_to_customer::diego
ALTER TABLE Customer ADD city_id INT NULL;


--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::201702111550_01_p_generate_city_id::diego
DROP PROCEDURE IF EXISTS `p_generate_city_id`;

DELIMITER //
CREATE PROCEDURE `p_generate_city_id`()
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
  SQL SECURITY DEFINER
  COMMENT ''
  BEGIN

    DECLARE v_finished INTEGER DEFAULT 0;
    DECLARE cu_id INTEGER DEFAULT 0;
    DECLARE cursor_customer_id CURSOR FOR SELECT CustomerId
                                          FROM Customer;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

    DROP TEMPORARY TABLE IF EXISTS tmp_t;

    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_t
      ENGINE = MEMORY
    AS (SELECT *
        FROM v_customer_city_country);

    OPEN cursor_customer_id;

    get_customers: LOOP

      FETCH cursor_customer_id
      INTO cu_id;
      IF v_finished = 1
      THEN
        LEAVE get_customers;
      END IF;

      SELECT cu_id;

      -- build email list
      UPDATE `Customer`
      SET `city_id` = (SELECT v.id_city
                       FROM tmp_t v
                       WHERE v.CustomerId = cu_id)
      WHERE `CustomerId` = cu_id;

    END LOOP get_customers;

    CLOSE cursor_customer_id;

  END //

DELIMITER ;


--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::201702121706_launch_p_generate_city_id::diego
CALL `p_generate_city_id`();


