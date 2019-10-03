INSERT INTO streams (stream_id, stream_name , created_on, metadata)
VALUES
(
  "stream-id",
  "stream_name" /* stream id */,
  PENDING_COMMIT_TIMESTAMP(),
  "metadata");
