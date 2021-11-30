CREATE TABLE inventory (
    inventory_id        BIGSERIAL NOT NULL PRIMARY KEY,
    inventory_name      VARCHAR(100)
);

CREATE TABLE person (
    person_id           BIGSERIAL NOT NULL PRIMARY KEY,
    email               VARCHAR(100)
);

CREATE TABLE person_inventories (
    inventory_id        BIGINT REFERENCES inventory,
    person_id           BIGINT REFERENCES person,
    PRIMARY KEY (inventory_id, person_id)
);

CREATE TABLE store (
    store_id            BIGSERIAL NOT NULL PRIMARY KEY,
    inventory_id        BIGINT NOT NULL,
    store_description   VARCHAR(255),
    store_tags          TEXT[],
    CONSTRAINT fk_inventory FOREIGN KEY(inventory_id) REFERENCES inventory(inventory_id)
);

CREATE TABLE item (
    item_id             BIGSERIAL NOT NULL PRIMARY KEY,
    item_tags           TEXT[],
    item_name           VARCHAR(125) NOT NULL,
    item_description    VARCHAR(255),
    item_quantity       SMALLINT,
    item_price          NUMERIC DEFAULT 0,
    item_image          TEXT,
    store_id            BIGINT NOT NULL,
    CONSTRAINT fk_store FOREIGN KEY(store_id) REFERENCES store(store_id)
);

INSERT INTO person (email) VALUES ('email@email.com');
INSERT INTO person (email) VALUES ('email01@email.com');
INSERT INTO person (email) VALUES ('email02@email.com');

INSERT INTO inventory (inventory_name) VALUES ('Computer Store');
INSERT INTO inventory (inventory_name) VALUES ('Bodega');

INSERT INTO person_inventories (inventory_id, person_id) VALUES (1, 1);
INSERT INTO person_inventories (inventory_id, person_id) VALUES (2, 1);
INSERT INTO person_inventories (inventory_id, person_id) VALUES (2, 1);

INSERT INTO store (store_description, store_tags, inventory_id) VALUES ('DESCRIPTION02', '{"IT", "Network"}', 1);
INSERT INTO store (store_description, store_tags, inventory_id) VALUES ('DESCRIPTIONDESCRIPTION', '{"Food", "Canned Food"}', 2);

INSERT INTO item (item_tags, item_name, item_quantity, store_id) VALUES ('{"IT", "Network"}', 'Router', 5, 1);
INSERT INTO item (item_tags, item_name, item_quantity, store_id) VALUES ('{"IT", "Network"}', 'Switch', 15, 1);