
/*CREATE TABLE BLOCK_SERVER_TB
(
  server_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  protocol TINYINT,
  host VARCHAR(256),
  port SMALLINT UNSIGNED,
  prefix VARCHAR(256),

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  `desc` VARCHAR(256),
  PRIMARY KEY(server_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;*/

CREATE TABLE BLOCK_SERVER_TB
(
  server_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  protocol TINYINT,
  host VARCHAR(256),
  port SMALLINT UNSIGNED,
  prefix VARCHAR(256),

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  `desc` VARCHAR(256),
  PRIMARY KEY(server_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE BLOCK_API_TB
(
  api_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  http_method TINYINT,
  path VARCHAR(256),

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  `desc` VARCHAR(256),
  PRIMARY KEY(api_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE BLOCK_PROPERTY_TB
(
  property_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` VARCHAR(256),
  value VARCHAR(256),
  data_type TINYINT,
  max INT,
  min INT,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  `desc` VARCHAR(256),
  PRIMARY KEY(property_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE BLOCK_API_PARAM_TB
(
  param_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  api_sq INT UNSIGNED,
  `type` TINYINT,
  required TINYINT,
  property_sq INT UNSIGNED,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  `desc` VARCHAR(256),
  PRIMARY KEY(param_sq),
  FOREIGN KEY(api_sq)
    REFERENCES BLOCK_API_TB(api_sq)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(property_sq)
    REFERENCES BLOCK_PROPERTY_TB(property_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE BLOCK_API_RESPONSE_TB
(
  response_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  api_sq INT UNSIGNED,
  http_status TINYINT,
  media_type TINYINT,
  property_sq INT UNSIGNED,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  `desc` VARCHAR(256),
  PRIMARY KEY(response_sq),
  FOREIGN KEY(api_sq)
    REFERENCES BLOCK_API_TB(api_sq)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(property_sq)
    REFERENCES BLOCK_PROPERTY_TB(property_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

