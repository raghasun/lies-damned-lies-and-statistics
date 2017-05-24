SELECT * FROM places JOIN stores USING (province);

SELECT * FROM places JOIN stores USING (province) WHERE
    profit > 10000;

SELECT province, count(*) FROM stores
    GROUP BY province;
