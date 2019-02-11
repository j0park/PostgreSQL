DROP TABLE IF EXISTS mst_users;
CREATE TABLE 053_mst_users(
    user_id         varchar(255)
  , register_date   varchar(255)
  , register_device integer
);

INSERT INTO 053_mst_users
VALUES
    ('U001', '2016-08-26', 1)
  , ('U002', '2016-08-26', 2)
  , ('U003', '2016-08-27', 3)
;

--Hive
--Hive DROP TABLE IF EXISTS mst_users;
--Hive CREATE TABLE 053_mst_users(
--Hive     user_id         string--varchar(255)
--Hive   , register_date   string--varchar(255)
--Hive   , register_device int --integer
--Hive );
--Hive 
--Hive INSERT INTO 053_mst_users
--Hive VALUES
--Hive     ('U001', '2016-08-26', 1)
--Hive   , ('U002', '2016-08-26', 2)
--Hive   , ('U003', '2016-08-27', 3)
--Hive ;