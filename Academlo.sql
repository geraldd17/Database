CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "las_name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "gender" varchar,
  "role_id" serial
);

CREATE TABLE "course_user" (
  "id" uuid,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "level" varchar,
  "teacher" varchar,
  "duration" varchar,
  "categorie_id" uuid,
  "course_video_id" uuid
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "duration" int
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "categories" int
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "course_user" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "course_user" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("course_video_id") REFERENCES "courses_videos" ("id");

INSERT INTO public.categories
(id, categories)
VALUES('7a10cc30-989d-4982-b01d-a67fc622d694'::uuid, 'action');
INSERT INTO public.categories
(id, categories)
VALUES('5f10a74f-81de-43fe-8d1d-cf6e71216ee9'::uuid, 'comedy');

INSERT INTO public.course_user
(id, user_id, course_id)
VALUES('5c163e40-eede-4da5-a252-6a0b7fbf72a7'::uuid, 'e88199f4-7e5b-4264-aaf9-c97c25a56317'::uuid, '4200e11a-93ec-407c-a6a9-c4a0a2f5e981'::uuid);
INSERT INTO public.course_user
(id, user_id, course_id)
VALUES('d3f89fd8-6f7c-47b7-8a88-bc5a5eb74110'::uuid, 'f94cc3b0-bf3e-45f5-8ad2-a1da124a4e11'::uuid, '6720ae7d-3a68-45ef-a57c-16ff1f1eb411'::uuid);

INSERT INTO public.courses
(id, title, description, "level", teacher, duration, categorie_id, course_video_id)
VALUES('4200e11a-93ec-407c-a6a9-c4a0a2f5e981'::uuid, 'Programming Fundamentals', 'html, ccs y js', 'beginner', 'Jesús', '120', '7a10cc30-989d-4982-b01d-a67fc622d694'::uuid, 'ae689dd1-ae0a-4f80-bbae-a72599d986b8'::uuid);
INSERT INTO public.courses
(id, title, description, "level", teacher, duration, categorie_id, course_video_id)
VALUES('6720ae7d-3a68-45ef-a57c-16ff1f1eb411'::uuid, 'React', 'Axios, Hook', 'intermediate', 'Benjamin', '120', '7a10cc30-989d-4982-b01d-a67fc622d694'::uuid, 'ae689dd1-ae0a-4f80-bbae-a72599d986b8'::uuid);

INSERT INTO public.courses_videos
(id, title, url, duration)
VALUES('ae689dd1-ae0a-4f80-bbae-a72599d986b8'::uuid, 'React', 'https://es.wikipedia.org/wiki/The_Avengers_(pel%C3%ADcula_de_2012)', 120);
INSERT INTO public.courses_videos
(id, title, url, duration)
VALUES('f512c995-e2dd-40a2-bda5-be1645a32000'::uuid, 'JavaScript', 'https://es.wikipedia.org/wiki/Iron_Man', 125);

INSERT INTO public.roles
(id, "name")
VALUES(1, 'Teacher');
INSERT INTO public.roles
(id, "name")
VALUES(2, 'Estudents');
INSERT INTO public.roles
(id, "name")
VALUES(3, 'Administrador');

INSERT INTO public.users
(id, first_name, las_name, email, "password", age, gender, role_id)
VALUES('e88199f4-7e5b-4264-aaf9-c97c25a56317'::uuid, 'Gerald', 'Astacio', 'g.astacio@academlo.com', 'root', 32, 'M', 2);
INSERT INTO public.users
(id, first_name, las_name, email, "password", age, gender, role_id)
VALUES('8a423955-4859-4921-bc51-fa1c1aea2e23'::uuid, 'Anibal', 'Alvarez', 'a.alvarez@academlo.com', '1326', 41, 'M', 1);
INSERT INTO public.users
(id, first_name, las_name, email, "password", age, gender, role_id)
VALUES('f94cc3b0-bf3e-45f5-8ad2-a1da124a4e11'::uuid, 'Kelvin', 'Peralta', 'k.peralta@academlo.com', 'k001', 30, 'M', 2);
