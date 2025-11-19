BEGIN;

--
-- ACTION ALTER TABLE
--
CREATE UNIQUE INDEX "node_identifier_idx" ON "nodes" USING btree ("identifier");
--
-- ACTION ALTER TABLE
--
CREATE INDEX "raw_data_sensor_time_idx" ON "raw_data" USING btree ("sensorId", "createdAt");
CREATE INDEX "raw_data_created_at_idx" ON "raw_data" USING btree ("createdAt");
--
-- ACTION ALTER TABLE
--
CREATE UNIQUE INDEX "sensor_identifier_node_idx" ON "sensors" USING btree ("identifier", "parentNodeId");

--
-- MIGRATION VERSION FOR flutter_server
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('flutter_server', '20251119225455711', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251119225455711', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20250825102336032-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102336032-v3-0-0', "timestamp" = now();


COMMIT;
