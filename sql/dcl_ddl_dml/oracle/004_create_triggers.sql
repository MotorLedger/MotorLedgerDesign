CREATE OR REPLACE TRIGGER trg_trade_ins_check_cession_date
    BEFORE
        INSERT OR UPDATE
    ON trade_ins
    FOR EACH ROW
BEGIN
    IF :new.trade_in_cession_date > sysdate THEN
        raise_application_error(-20001, 'trade_in_cession_date cannot be in the future');
    END IF;
END;
/