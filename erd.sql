CREATE TABLE "Artists"(
    "Id" SERIAL PRIMARY KEY,
    "Name" TEXT NOT NULL,
    "CountryOfOrigin" TEXT,
    "NumberOfMembers" INT,
    "Website" TEXT,
    "Style" TEXT,
    "IsSigned" BOOLEAN,
    "ContactName" TEXT,
    "ContactPhoneNumber" TEXT
    );

CREATE TABLE "Albums"(
    "Id" SERIAL PRIMARY KEY,
    "Title" TEXT NOT NULL,
    "IsExplicit" BOOLEAN,
    "ReleaseDate" TEXT
    );

CREATE TABLE "Songs"(
    "Id" SERIAL PRIMARY KEY,
    "TrackNumber" TEXT,
    "Title" TEXT NOT NULL,
    "Duration" TEXT
    );

ALTER TABLE "Songs" ADD COLUMN "AlbumId" INTEGER NULL REFERENCES "Albums" ("Id");

ALTER TABLE "Albums" ADD COLUMN "ArtistId" INTEGER NULL REFERENCES "Artists" ("Id");

INSERT INTO "Artists" ("Name", "CountryOfOrigin", "NumberOfMembers", "Website", "Style", "IsSigned", "ContactName", "ContactPhoneNumber")
VALUES ('NSYNC', 'USA', '5', 'https://nsynconline.com', 'Pop', 'FALSE', 'Christine', '555-867-5309');

SELECT * 
FROM "Artists";

INSERT INTO "Artists" ("Title", "IsExplicit", "ReleaseDate")
VALUES ('N Sync', 'FALSE', '03/24/1998');

UPDATE "Artists" SET "AlbumId" = 1 WHERE "Id" IN (1);

INSERT INTO "Songs" ("TrackNumber", "Title", "Duration")
VALUES ('1', "Tearin' Up My Heart", '4:47');

UPDATE "Albums" 
SET "SongId" = 1 
WHERE "Id" IN (1);

UPDATE "Artists" 
SET "IsSigned" = TRUE 
WHERE "Name" = "NSYNC";

UPDATE "Artists" 
SET "IsSigned" = FALSE 
WHERE "Name" = 'NSYNC';

SELECT "Artists"."Name" 
FROM "Artists" 
JOIN "Albums" ON "Bands"."AlbumId" = "Albums"."Id";

SELECT "Albums"."Title"
FROM "Albums"
JOIN "Songs" ON "Albums"."SongId" = "Songs"."Id"
ORDER BY "ReleaseDate";

SELECT * 
FROM "Artists" 
WHERE "IsSigned" = TRUE;

SELECT * 
FROM "Artists" 
WHERE "IsSigned" = FALSE;
