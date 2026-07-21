-- À exécuter si tu avais déjà créé la table signups (ancienne version)

alter table signups add column if not exists event_name   text not null default 'Toulouse Triathlon 2026';
alter table signups add column if not exists distance      text not null default 'XS (Super Sprint)';
alter table signups add column if not exists preferred_date text         default 'Dimanche 4 octobre 2026';
