/*
Insert one more device into the devices table. You may use this SQL statement or create your own.

Assuming nothing about the existing order of the records in the database, write an SQL statement that will return the name of the oldest device from our devices table.
*/

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);

  SELECT name AS oldest_device
    FROM devices
ORDER BY created_at LIMIT 1;