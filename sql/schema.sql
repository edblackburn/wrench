CREATE TABLE streams (
    stream_id STRING(MAX) NOT NULL,
    created_on TIMESTAMP NOT NULL OPTIONS (allow_commit_timestamp=true),
    metadata STRING(MAX),
    stream_name STRING(MAX) NOT NULL,
) PRIMARY KEY (stream_id);

CREATE TABLE messages (
    stream_id STRING(MAX) NOT NULL,
    version INT64 NOT NULL,
    causation_id BYTES(16) NOT NULL,
    message STRING(MAX) NOT NULL,
    message_id BYTES(16) NOT NULL,
    message_type STRING(50) NOT NULL,
    metadata STRING(MAX),
    stamp TIMESTAMP NOT NULL OPTIONS (allow_commit_timestamp=true),
    tx_ordinal INT64 NOT NULL,
) PRIMARY KEY (stream_id, version),
INTERLEAVE IN PARENT streams ON DELETE CASCADE;

CREATE INDEX message_stamp 
ON messages (
    stream_id,
    stamp DESC
), INTERLEAVE IN streams;

CREATE INDEX message_tx_ordinal 
ON messages (
    stream_id,
    tx_ordinal DESC
), INTERLEAVE IN streams;
