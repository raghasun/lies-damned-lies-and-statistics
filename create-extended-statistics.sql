CREATE STATISTICS zip_province_correlation(dependencies)
ON zip, province FROM stores;

CREATE STATISTICS zip_province_distinct(ndistinct)
ON zip, province FROM stores;
