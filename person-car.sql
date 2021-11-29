CREATE TABLE person (
    id                  BIGSERIAL NOT NULL PRIMARY KEY,
    email               VARCHAR(100),
    inventory_id        BIGINT REFERENCES inventory (id),
    UNIQUE(inventory_id)
);

CREATE TABLE inventory (
    id                  BIGSERIAL NOT NULL PRIMARY KEY,
);

CREATE TABLE store (
    id                  BIGSERIAL NOT NULL PRIMARY KEY,
    store_description   VARCHAR(255),
    store_tags          TEXT[],
    inventory_id        BIGSERIAL NOT NULL
    CONSTRAINT fk_inventory FOREIGN KEY(inventory_id) REFERENCES inventory(id)
);

CREATE TABLE item (
    id                  BIGSERIAL NOT NULL PRIMARY KEY,
    item_tags           TEXT[],
    item_name           VARCHAR(125),
    item_description    VARCHAR(255),
    item_quantity       SMALLINT,
    item_image          TEXT,
    store_id            BIGINT NOT NULL
    CONSTRAINT fk_store FOREIGN KEY(store_id) REFERENCES store(id)

)