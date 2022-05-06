create schema kanban;

create table kanban.board (
	id_board serial primary key,
	name text not null
);

create table kanban.column (
	id_column serial primary key,
	id_board integer references kanban.board (id_board),
	name text not null,
	has_estimative boolean not null default false
);

create table kanban.card (
	id_card serial primary key,
	id_board integer references kanban.board (id_board),
	id_column integer references kanban.column (id_column),
	title text not null,
	estimative integer not null
);

create table kanban.transition (
	id_transition serial primary key,
	id_card integer references kanban.card (id_card),
	id_column integer references kanban.column (id_column),
	date timestamp not null default now()
);
