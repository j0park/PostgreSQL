DROP TABLE IF EXISTS mst_users;
CREATE TABLE 0501_mst_users(
    user_id         string--varchar(255)
  , register_date   string--varchar(255)
  , register_device int --integer
);

INSERT INTO 0501_mst_users
VALUES
    ('U001', '2016-08-26', 1)
  , ('U002', '2016-08-26', 2)
  , ('U003', '2016-08-27', 3)
;
