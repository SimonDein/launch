/*
Return the result from the last exercise sorted alphabetically for the device names
*/

  SELECT devices.name AS device, COUNT(parts.id) AS parts
    FROM devices
    JOIN parts
      ON devices.id = parts.device_id
GROUP BY device
ORDER BY device ASC;