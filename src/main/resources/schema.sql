DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
CREATE TABLE categories (
id BIGSERIAL PRIMARY KEY,
name VARCHAR(60) NOT NULL UNIQUE
);
CREATE TABLE items (
id BIGSERIAL PRIMARY KEY,
category_id BIGINT NOT NULL REFERENCES categories(id) ON DELETE RESTRICT,
name VARCHAR(120) NOT NULL,
description VARCHAR(255),
price NUMERIC(12,2) NOT NULL,
created_at TIMESTAMPTZ DEFAULT NOW(),
updated_at TIMESTAMPTZ DEFAULT NOW(),
CONSTRAINT uq_items_category_name UNIQUE (category_id, name)
);
CREATE INDEX idx_items_name ON items(name);
CREATE INDEX idx_items_category ON items(category_id);