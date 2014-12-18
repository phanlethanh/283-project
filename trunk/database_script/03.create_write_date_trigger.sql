-- INSERT Create date function
CREATE OR REPLACE FUNCTION func_insert() RETURNS TRIGGER AS $$
    BEGIN
      NEW.create_date = now();
      NEW.write_date = now();
	  NEW.active = TRUE;
      RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

-- UPDATE Write date function
CREATE OR REPLACE FUNCTION func_update() RETURNS TRIGGER AS $$
    BEGIN
      NEW.write_date = now();
      RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

-- #############################################################
-- create date triggers 

CREATE TRIGGER trig_create_date BEFORE INSERT ON cart
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON cart_product
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON category
FOR EACH ROW EXECUTE PROCEDURE func_insert();

-- CREATE TRIGGER trig_create_date BEFORE INSERT ON category_product
-- FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON config
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON datas_fields_product
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON fields_product
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON gallery
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON image
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON os_order
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON os_order_detail
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON os_user
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON price
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON producer
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON product
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON promotion
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON status
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON tax
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON transport_fee
FOR EACH ROW EXECUTE PROCEDURE func_insert();

CREATE TRIGGER trig_create_date BEFORE INSERT ON user_group
FOR EACH ROW EXECUTE PROCEDURE func_insert();

-- #############################################################
-- write date triggers
CREATE TRIGGER trig_write_date BEFORE UPDATE ON cart
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON cart_product
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON category
FOR EACH ROW EXECUTE PROCEDURE func_update();

-- CREATE TRIGGER trig_write_date BEFORE UPDATE ON category_product
-- FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON config
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON datas_fields_product
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON fields_product
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON gallery
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON image
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON os_order 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON os_order_detail 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON os_user 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON price 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON producer 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON product 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON promotion 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON status 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON tax 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON transport_fee 
FOR EACH ROW EXECUTE PROCEDURE func_update();

CREATE TRIGGER trig_write_date BEFORE UPDATE ON user_group 
FOR EACH ROW EXECUTE PROCEDURE func_update();
