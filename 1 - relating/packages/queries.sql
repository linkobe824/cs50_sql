--encontrar paquetes de esa direccion
SELECT "name" FROM "drivers"
WHERE "id" = (
    SELECT "driver_id"  FROM "scans"
    WHERE "package_id" = (
        SELECT "id"FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERe "address" = '728 Maple Place'
        )
    )
    ORDER BY "timestamp" DESC LIMIT 1
);
