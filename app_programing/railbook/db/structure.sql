CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "books" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "isbn" varchar, "title" varchar, "price" integer, "publisher" varchar, "published" date, "dl" boolean, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE UNIQUE INDEX "index_books_on_isbn" ON "books" ("isbn");
CREATE TABLE IF NOT EXISTS "authors_books" ("author_id" integer NOT NULL, "book_id" integer NOT NULL);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar, "password_digest" varchar, "email" varchar, "dm" boolean, "roles" varchar, "reviews_count" integer DEFAULT 0, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "authors" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "name" varchar, "birth" date, "address" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_46e884287b"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_authors_on_user_id" ON "authors" ("user_id");
CREATE TABLE IF NOT EXISTS "reviews" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "book_id" integer NOT NULL, "user_id" integer NOT NULL, "status" integer DEFAULT 0 NOT NULL, "body" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_924a0b30ca"
FOREIGN KEY ("book_id")
  REFERENCES "books" ("id")
, CONSTRAINT "fk_rails_74a66bd6c5"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_reviews_on_book_id" ON "reviews" ("book_id");
CREATE INDEX "index_reviews_on_user_id" ON "reviews" ("user_id");
CREATE TABLE IF NOT EXISTS "fan_comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "author_no" integer, "name" varchar, "body" text, "deleted" boolean, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "memos" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "memoable_type" varchar, "memoable_id" integer, "body" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "members" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "lock_version" integer DEFAULT 0, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "delayed_jobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "priority" integer DEFAULT 0 NOT NULL, "attempts" integer DEFAULT 0 NOT NULL, "handler" text NOT NULL, "last_error" text, "run_at" datetime(6), "locked_at" datetime(6), "failed_at" datetime(6), "locked_by" varchar, "queue" varchar, "created_at" datetime(6), "updated_at" datetime(6));
CREATE INDEX "delayed_jobs_priority" ON "delayed_jobs" ("priority", "run_at");
CREATE TABLE IF NOT EXISTS "active_storage_attachments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" bigint NOT NULL, "blob_id" bigint NOT NULL, "created_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_c3b3935057"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id");
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id");
CREATE TABLE IF NOT EXISTS "active_storage_variant_records" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "blob_id" bigint NOT NULL, "variation_digest" varchar NOT NULL, CONSTRAINT "fk_rails_993965df05"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE UNIQUE INDEX "index_active_storage_variant_records_uniqueness" ON "active_storage_variant_records" ("blob_id", "variation_digest");
CREATE TABLE IF NOT EXISTS "action_text_rich_texts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "body" text, "record_type" varchar NOT NULL, "record_id" bigint NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE UNIQUE INDEX "index_action_text_rich_texts_uniqueness" ON "action_text_rich_texts" ("record_type", "record_id", "name");
CREATE TABLE IF NOT EXISTS "articles" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "published" date, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "action_mailbox_inbound_emails" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "status" integer DEFAULT 0 NOT NULL, "message_id" varchar NOT NULL, "message_checksum" varchar NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE UNIQUE INDEX "index_action_mailbox_inbound_emails_uniqueness" ON "action_mailbox_inbound_emails" ("message_id", "message_checksum");
CREATE TABLE IF NOT EXISTS "messages" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "topic" varchar, "name" varchar, "body" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "animals" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "gender" varchar, "type" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "entries" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "entryable_type" varchar, "entryable_id" integer, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "body" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "active_storage_blobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "service_name" varchar NOT NULL, "byte_size" bigint NOT NULL, "checksum" varchar, "created_at" datetime(6) NOT NULL);
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key");
INSERT INTO "schema_migrations" (version) VALUES
('20240812073028'),
('20240812073027'),
('20240812073026'),
('20240603092424'),
('20240603092200'),
('20240603081436'),
('20240327051128'),
('20240326063914'),
('20240326060821'),
('20240326055435'),
('20240324083548'),
('20240324060719'),
('20240312054731'),
('20240303224021'),
('20240303224011'),
('20240303224000'),
('20240303223948'),
('20240303223936'),
('20240303223922'),
('20240303223900');

