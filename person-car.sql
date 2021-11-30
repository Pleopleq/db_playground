CREATE TABLE inventory (
    id                  BIGSERIAL NOT NULL PRIMARY KEY,
    inventory_name      VARCHAR(100)
);

CREATE TABLE person (
    id                  BIGSERIAL NOT NULL PRIMARY KEY,
    email               VARCHAR(100)
);

CREATE TABLE person_inventories (
    inventory_id BIGINT,
    person_id BIGINT,
    PRIMARY KEY (inventory_id, person_id),
    CONSTRAINT fk_inventory FOREIGN KEY(inventory_id) REFERENCES inventory(id),
    CONSTRAINT fk_person FOREIGN KEY(person_id) REFERENCES person(id)
)

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
    item_price          NUMERIC NOT NULL DEFAULT 0
    item_image          TEXT,
    store_id            BIGINT NOT NULL
    CONSTRAINT fk_store FOREIGN KEY(store_id) REFERENCES store(id)

)

INSERT INTO person (email) VALUES ('email@email.com');
INSERT INTO person (email) VALUES ('email01@email.com');
INSERT INTO person (email) VALUES ('email02@email.com');

INSERT INTO inventory (inventory_name) VALUES ('Computer Store');
INSERT INTO inventory (inventory_name) VALUES ('Bodega');

INSERT INTO person_inventories (inventory_id, person_id) VALUES (1, 1);
