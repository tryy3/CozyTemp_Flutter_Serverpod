# Performance Optimization Guide

## Data Aggregation Strategy

To handle the high-frequency temperature data (every 5 seconds), the application now uses time-bucketed aggregation using PostgreSQL's [`date_bin()`](https://www.postgresql.org/docs/current/functions-datetime.html#FUNCTIONS-DATETIME-TRUNC) function:

### Aggregation Intervals

- **24h view**: 5-minute buckets → ~288 data points per sensor (down from ~17,280)
- **7d view**: 1-hour buckets → ~168 data points per sensor (down from ~120,960)
- **All time**: 1-day buckets → reasonable amount based on total time span

This reduces data transfer by **98%+** while preserving trend visibility.

### Why `date_bin()` Instead of `date_trunc()`?

PostgreSQL's `date_trunc()` only supports fixed units (second, minute, hour, day, etc.), but we need arbitrary intervals like "5 minutes". The `date_bin()` function is specifically designed for this - it bins timestamps into arbitrary intervals aligned to an origin timestamp.

## Recommended Database Indexes

For optimal query performance, add these indexes to your PostgreSQL database:

```sql
-- Index for sensor + time range queries (most important)
CREATE INDEX idx_raw_data_sensor_time ON raw_data("sensorId", "createdAt");

-- Index for time-based queries only
CREATE INDEX idx_raw_data_created_at ON raw_data("createdAt");
```

### To Apply These Indexes

1. Connect to your PostgreSQL database
2. Run the SQL commands above
3. The indexes will dramatically speed up the aggregation queries

### Expected Performance

With these optimizations:
- Query time reduced from seconds to milliseconds
- Network transfer reduced by 98%+
- Chart rendering is smooth even with years of data
- Database load significantly reduced

## Future Considerations

If you need deeper analytics in the future:
- Consider using PostgreSQL's TimescaleDB extension for time-series optimization
- Or export data to tools like PowerBI, Grafana, or similar analytics platforms
- Keep the raw data for detailed analysis when needed

