BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "calibrated_temperature" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "rawDataId" uuid,
    "temperature" double precision NOT NULL,
    "calibratedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "raw_data_unique" ON "calibrated_temperature" USING btree ("rawDataId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "calibrated_temperature"
    ADD CONSTRAINT "calibrated_temperature_fk_0"
    FOREIGN KEY("rawDataId")
    REFERENCES "raw_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR flutter_server
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('flutter_server', '20251101095022729', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251101095022729', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
