BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "nodes" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "identifier" text NOT NULL,
    "name" text,
    "description" text,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "raw_data" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "sensorId" uuid NOT NULL,
    "temperature" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sensors" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "parentNodeId" uuid NOT NULL,
    "identifier" text NOT NULL,
    "name" text,
    "description" text,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "raw_data"
    ADD CONSTRAINT "raw_data_fk_0"
    FOREIGN KEY("sensorId")
    REFERENCES "sensors"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "sensors"
    ADD CONSTRAINT "sensors_fk_0"
    FOREIGN KEY("parentNodeId")
    REFERENCES "nodes"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR flutter_server
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('flutter_server', '20251026095052144', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251026095052144', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
