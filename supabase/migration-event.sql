-- À exécuter si tu avais déjà créé la table signups (ancienne version)

alter table signups add column if not exists event_name text not null default 'Toulouse Triathlon 2026';
