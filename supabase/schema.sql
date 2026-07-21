-- À exécuter dans Supabase → SQL Editor

create table if not exists signups (
  id bigint generated always as identity primary key,
  prenom text not null,
  email text not null,
  ville text not null,
  group_size text not null default '',
  already_done text not null default '',
  interested_count integer not null check (interested_count >= 1),
  event_name text not null default 'Toulouse Triathlon 2026',
  distance text not null default 'XS (Super Sprint)',
  preferred_date text default 'Dimanche 4 octobre 2026',
  created_at timestamptz not null default now()
);

create index if not exists signups_created_at_idx on signups (created_at desc);
create index if not exists signups_email_idx on signups (email);

alter table signups enable row level security;

create policy "Allow public insert"
  on signups for insert
  to anon
  with check (true);

-- Si tu as déjà créé la table avant, exécute plutôt supabase/migration-event.sql
