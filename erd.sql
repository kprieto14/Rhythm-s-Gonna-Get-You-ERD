CREATE TABLE "Bands"(
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

ALTER TABLE "Bands" ADD COLUMN "AlbumId" INTEGER NULL REFERENCES "Albums" ("Id");

ALTER TABLE "Albums" ADD COLUMN "SongId" INTEGER NULL REFERENCES "Songs" ("Id");

INSERT INTO "Bands" ("Name", "CountryOfOrigin", "NumberOfMembers", "Website", "Style", "IsSigned", "ContactName", "ContactPhoneNumber")
VALUES ('NSYNC', 'USA', '5', 'https://nsynconline.com', 'Pop', 'FALSE', 'Christine', '555-867-5309');

SELECT * 
FROM "Bands";

INSERT INTO "Albums" ("Title", "IsExplicit", "ReleaseDate")
VALUES ('N Sync', 'FALSE', '03/24/1998');

UPDATE "Bands" SET "AlbumId" = 1 WHERE "Id" IN (1);

INSERT INTO "Songs" ("TrackNumber", "Title", "Duration")
VALUES ('1', "Tearin' Up My Heart", '4:47');

UPDATE "Albums" 
SET "SongId" = 1 
WHERE "Id" IN (1);

UPDATE "Bands" 
SET "IsSigned" = TRUE 
WHERE "Name" = "NSYNC";

UPDATE "Bands" 
SET "IsSigned" = FALSE 
WHERE "Name" = 'NSYNC';

SELECT "Bands"."Name" 
FROM "Bands" 
JOIN "Albums" ON "Bands"."AlbumId" = "Albums"."Id";

SELECT "Albums"."Title"
FROM "Albums"
JOIN "Songs" ON "Albums"."SongId" = "Songs"."Id"
ORDER BY "ReleaseDate";

SELECT * 
FROM "Bands" 
WHERE "IsSigned" = TRUE;

SELECT * 
FROM "Bands" 
WHERE "IsSigned" = FALSE;