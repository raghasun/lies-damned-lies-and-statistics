SELECT * FROM
    places JOIN stores USING (province)
WHERE
    zip = 'Y0A' AND
    province = 'yukon';
