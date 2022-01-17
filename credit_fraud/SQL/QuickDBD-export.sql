-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/SfzGzb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "card_holder" (
    "card_holder_id" Serial   NOT NULL,
    "full_name" varchar(300)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "card_holder_id"
     )
);

CREATE TABLE "credit_card" (
    "card_holder_id" int   NOT NULL,
    "card_number" varchar(300)   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card_number"
     )
);

CREATE TABLE "merchant_category" (
    "merchant_category_id" Serial   NOT NULL,
    "merchant_category_name" varchar(300)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "merchant_category_id"
     )
);

CREATE TABLE "merchant" (
    "merchant_id" Serial   NOT NULL,
    "merchant_category_id" int   NOT NULL,
    "merchant_name" varchar(300)   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "merchant_id"
     )
);

CREATE TABLE "transaction" (
    "transaction_id" Serial   NOT NULL,
	"transaction_date" timestamp   NOT NULL,
	"amount" int   NOT NULL,
    "card_number" varchar(300)   NOT NULL,
    "merchant_id" int   NOT NULL, 
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "transaction_id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_card_holder_id" FOREIGN KEY("card_holder_id")
REFERENCES "card_holder" ("card_holder_id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_merchant_category_id" FOREIGN KEY("merchant_category_id")
REFERENCES "merchant_category" ("merchant_category_id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card_number" FOREIGN KEY("card_number")
REFERENCES "credit_card" ("card_number");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "merchant" ("merchant_id");

