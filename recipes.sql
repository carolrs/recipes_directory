DROP TABLE IF EXISTS "public"."recipes";

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

-- Table Definition
CREATE TABLE "public"."recipes" (
    "id" SERIAL,
    "name" text,
    "average_time" text,
    "rating" int4,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."recipes" ("id", "name", "average_time","rating") VALUES
(1, 'Pancakes', '15', 5),
(2, 'Meat pie', '45', 4),
(3, 'Carbonara', '30',5);
