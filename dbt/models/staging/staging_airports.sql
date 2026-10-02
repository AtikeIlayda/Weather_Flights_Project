WITH airports_regions_join AS (
        SELECT
                a.faa,
                a.name,
                a.city,
                a.country,
                r.region,
                a.lat,
                a.lon,
                a.alt,
                a.tz,
                a.dst
        FROM {{source('flights_data', 'airports')}} AS a
        LEFT JOIN {{source('flights_data', 'regions')}} AS r
        USING (country)
    )
    SELECT * FROM airports_regions_join