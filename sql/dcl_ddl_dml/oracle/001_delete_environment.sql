ALTER SESSION SET "_ORACLE_SCRIPT" = true;

REVOKE connect, resource FROM motor_ledger;

ALTER USER motor_ledger
    QUOTA 0 ON users;

DROP USER motor_ledger CASCADE;

PURGE RECYCLEBIN;