--liquibase formatted sql

--changeset simon:workflow_v1.0.0_20241210_134800
CREATE TABLE "t_flow"
(
    id               BIGINT PRIMARY KEY,
    version          INTEGER DEFAULT 1,
    name             VARCHAR(255) NOT NULL,
    remark           VARCHAR(255) DEFAULT NULL,
    design_data      TEXT DEFAULT NULL,
    enabled          BOOLEAN NOT NULL,
    tenant_id        BIGINT NOT NULL,
    updated_user     BIGINT NOT NULL,
    user_id          BIGINT NOT NULL,
    created_at       BIGINT NOT NULL,
    updated_at       BIGINT NOT NULL
);

CREATE INDEX idx_flow_tenant_id ON "t_flow" (tenant_id);

CREATE TABLE "t_flow_history"
(
    id               BIGINT PRIMARY KEY,
    flow_id          BIGINT NOT NULL,
    version          INTEGER NOT NULL,
    design_data      TEXT DEFAULT NULL,
    user_id          BIGINT NOT NULL,
    created_at       BIGINT NOT NULL,

    CONSTRAINT uk_flow_history_flow_id_version UNIQUE (flow_id, version)
);

CREATE TABLE "t_flow_log"
(
    id              BIGINT PRIMARY KEY,
    flow_id         BIGINT NOT NULL,
    version         INTEGER NOT NULL,
    start_time      BIGINT NOT NULL,
    time_cost       INTEGER DEFAULT NULL,
    status          VARCHAR(31) DEFAULT NULL,
    tenant_id       BIGINT NOT NULL,
    user_id         BIGINT NOT NULL,
    created_at      BIGINT NOT NULL
);

CREATE INDEX idx_flow_log_tenant_id_flow_id ON "t_flow_log" (tenant_id, flow_id);

CREATE TABLE "t_flow_log_data"
(
    id              BIGINT PRIMARY KEY,
    data            TEXT DEFAULT NULL,
    created_at      BIGINT NOT NULL
);

CREATE TABLE "t_flow_entity_relation"
(
    id                      BIGINT PRIMARY KEY,
    entity_id               BIGINT NOT NULL,
    flow_id                 BIGINT NOT NULL,
    created_at              BIGINT NOT NULL
);

CREATE INDEX idx_flow_entity_relation_entity_id ON "t_flow_entity_relation" (entity_id);
CREATE INDEX idx_flow_entity_relation_flow_id ON "t_flow_entity_relation" (flow_id);
