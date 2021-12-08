\c host_agent
CREATE TABLE if not exists PUBLIC.host_info (
    id SERIAL primary key NOT NULL,
    hostname VARCHAR NOT NULL UNIQUE,
    cpu_number integer not null,
    cpu_architecture varchar not null,
    cpu_model varchar not null,
    cpu_mhz real not null,
    l2_cache integer not null,
    total_mem integer not null,
    "timestamp" timestamptz not null
  );
CREATE TABLE if not exists PUBLIC.host_usage (
    "timestamp" TIMESTAMP NOT NULL,
    host_id int NOT NULL,
    memory_free integer not null,
    cpu_idle integer not null,
    cpu_kernel integer not null,
    disk_io integer not null,
    disk_available integer not null,
    CONSTRAINT foreign_host_id FOREIGN KEY(host_id) REFERENCES host_info(id)
);

