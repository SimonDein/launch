-- We've realized that the last two parts we're using for device number 2, "Gyroscope", actually belong to an "Accelerometer". Write an SQL statement that will associate the last two parts from our parts table with an "Accelerometer" instead of a "Gyroscope".

    ALTER TABLE parts
DROP CONSTRAINT parts_device_id_fkey;

    ALTER TABLE parts
ADD FOREIGN KEY (device_id)
     REFERENCES devices (id) ON DELETE CASCADE;

DELETE FROM devices
WHERE name = 'accelerometer';