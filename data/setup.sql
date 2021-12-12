create table users (
    id serial primary key,
    uuid varchar(64) not null unique,
    firstName varchar(255),
    lastName varchar(255),
    email varchar(255) not null unique,
    password varchar(255) not null,
    created_at timestamp not null
);

create table tasks (
    id serial primary key,
    uuid varchar(64) not null unique,
    title varchar(255) not null,
    completed boolean,
    deadline timestamp,
    colorTag varchar(64),
    user_id integer references users(id),
    created_at timestamp not null,
    updated_at timestamp not null
);

create table subtasks (
    id serial primary key,
    uuid varchar(64) not null unique,
    title varchar(255) not null,
    completed boolean,
    task_id integer references tasks(id),
    created_at timestamp not null,
    updated_at timestamp not null
);

-- psql -U gwp -f setup.sql -d gwp