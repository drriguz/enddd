create table events (
  event_id varchar(255) primary key,
  event_type varchar(255),
  event_data text(1000) not null,
  entity_type varchar(255) not null,
  entity_id varchar(255) not null,
  triggering_event varchar(255),
  metadata text(1000),
  published tinyint default 0
);

create index events_idx on events(entity_type, entity_id, event_id);
create index events_published_idx on events(published, event_id);

create table entities (
  entity_type varchar(255),
  entity_id varchar(255),
  entity_version varchar(255) not null,
  primary key(entity_type, entity_id)
);

create index entities_idx on events(entity_type, entity_id);

create table snapshots (
  entity_type varchar(255),
  entity_id varchar(255),
  entity_version varchar(255),
  snapshot_type varchar(255) not null,
  snapshot_json text(1000) not null,
  triggering_events varchar(255),
  primary key(entity_type, entity_id, entity_version)
);

create table cdc_monitoring (
  reader_id varchar(255) primary key,
  last_time bigint
);

create table message (
  id varchar(255) primary key,
  destination varchar(255) not null,
  headers varchar(255) not null,
  payload text(1000) not null,
  published smallint default 0,
  creation_time bigint
);

create index message_published_idx on message(published, id);

create table received_messages (
  consumer_id varchar(255),
  message_id varchar(255),
  primary key(consumer_id, message_id),
  creation_time bigint
);

create table offset_store(
  client_name varchar(255) not null primary key,
  serialized_offset varchar(255)
);

