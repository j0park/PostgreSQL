
CREATE TABLE "056_access_log" (
    stamp    varchar(255)
  , referrer text
  , url      text
);


--Hive CREATE TABLE `056_access_log` (
--Hive     stamp    string
--Hive   , referrer string
--Hive   , url      string);

INSERT INTO "056_access_log"
VALUES
    ('2016-08-26 12:02:00', 'http://www.other.com/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video/detail?id=001')
  , ('2016-08-26 12:02:01', 'http://www.other.net/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video#ref'          )
  , ('2016-08-26 12:02:01', 'https://www.other.com/'                               , 'http://www.example.com/book/detail?id=002' )
;

--Hive  INSERT INTO '056_access_log'
--Hive  VALUES
--Hive      ('2016-08-26 12:02:00', 'http://www.other.com/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video/detail?id=001')
--Hive    , ('2016-08-26 12:02:01', 'http://www.other.net/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video#ref'          )
--Hive    , ('2016-08-26 12:02:01', 'https://www.other.com/'                               , 'http://www.example.com/book/detail?id=002' )
--Hive  ;
