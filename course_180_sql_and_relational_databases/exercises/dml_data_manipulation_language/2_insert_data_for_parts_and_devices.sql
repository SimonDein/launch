-- Now that we have the infrastructure for our workshop set up, let's start adding in some data. Add in two different devices. One should be named, "Accelerometer". The other should be named, "Gyroscope".

-- The first device should have 3 parts (this is grossly simplified). The second device should have 5 parts. The part numbers may be any number between 1 and 10000. There should also be 3 parts that don't belong to any device yet.

INSERT INTO devices (name)
VALUES
('accelerometer'),
('gyroscope');

INSERT INTO parts (part_number, device_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2);

INSERT INTO parts (part_number)
VALUES
(83),
(84),
(85);