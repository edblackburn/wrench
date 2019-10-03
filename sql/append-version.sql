INSERT INTO messages (stream_id, message_id, causation_id, stamp, tx_ordinal, version, message_type, message, metadata)
VALUES (
  "stream-id",
  null,
  null,
  PENDING_COMMIT_TIMESTAMP(),
  (SELECT greatest(2 /* expected version */,(
                            SELECT max(version)
                            FROM messages 
                            WHERE stream_id = "stream-id")
                        )
  ),
  2 /* expected version */,
  "HelloMumed",
  "Hello, Mum!",
  "");
