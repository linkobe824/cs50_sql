
-- *** The Lost Letter ***
-- Figure out the id of the correct package from the specific address
-- Congratulatory letter - 384
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    -- gettind the destination address using the id of the package
    -- and the action drop
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        -- getting de id of packages from that addres 
        -- that have a content like "congra" for "congratulory"
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            -- getting the id of origin
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
        AND  "contents" LIKE '%congra%'
    )
    AND "action" = 'Drop'
);
-- *** The Devious Delivery ***
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    -- getting the destination id of a package with no origin
    SELECT "to_address_id" FROM "packages"
    WHERE "from_address_id" IS NULL
)
-- *** The Forgotten Gift ***
-- last addres
SELECT "address" FROM "addresses"
WHERE "id" = (
    -- get the last address_id from the scans of that package
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        -- find the packages from that address
        SELECT "id"FROM "packages"
        WHERE "from_address_id" = (
            --find id of the address
            SELECT "id" FROM "addresses"
            WHERe "address" = '728 Maple Place'
        )
    )
    AND
    "action" = "Drop"
    ORDER BY "timestamp" DESC LIMIT 1
);

--last driver
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
