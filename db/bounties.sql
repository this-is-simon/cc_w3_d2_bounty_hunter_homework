DROP TABLE IF EXISTS bounties;

CREATE TABLE bounties (
  id SERIAL8,
  name VARCHAR(255),
  species VARCHAR(255),
  value INT,
  danger_level VARCHAR(255)
);
