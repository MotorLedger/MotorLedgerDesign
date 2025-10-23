ALTER SESSION SET CONTAINER = freepdb1;

ALTER SESSION SET "_ORACLE_SCRIPT" = true;

CREATE USER motor_ledger IDENTIFIED BY ml123;

GRANT connect, resource TO motor_ledger;

ALTER USER motor_ledger
    QUOTA UNLIMITED ON users;

ALTER USER motor_ledger
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp;

GRANT
    CREATE SESSION
TO motor_ledger;

CONN motor_ledger/ml123@//localhost:1521/freepdb1