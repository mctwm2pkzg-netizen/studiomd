-- StudioMD: tabelle e regole di sicurezza. Da eseguire UNA volta in Supabase: SQL Editor -> New query -> Run.
-- Ogni riga appartiene a un utente; le regole (RLS) fanno sì che ognuno veda e modifichi solo le proprie.

create table if not exists public.studiomd_decks (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  id text not null,
  data jsonb not null default '{}'::jsonb,
  t bigint not null default 0,
  deleted boolean not null default false,
  primary key (user_id, id)
);
create table if not exists public.studiomd_progress (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  deck_id text not null,
  data jsonb not null default '{}'::jsonb,
  t bigint not null default 0,
  primary key (user_id, deck_id)
);
create table if not exists public.studiomd_meta (
  user_id uuid primary key default auth.uid() references auth.users on delete cascade,
  data jsonb not null default '{}'::jsonb,
  t bigint not null default 0
);
create table if not exists public.studiomd_images (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  key text not null,
  h text,
  data text not null,
  t bigint not null default 0,
  primary key (user_id, key)
);

alter table public.studiomd_decks    enable row level security;
alter table public.studiomd_progress enable row level security;
alter table public.studiomd_meta     enable row level security;
alter table public.studiomd_images   enable row level security;

drop policy if exists "solo i propri dati" on public.studiomd_decks;
drop policy if exists "solo i propri dati" on public.studiomd_progress;
drop policy if exists "solo i propri dati" on public.studiomd_meta;
drop policy if exists "solo i propri dati" on public.studiomd_images;
create policy "solo i propri dati" on public.studiomd_decks    for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "solo i propri dati" on public.studiomd_progress for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "solo i propri dati" on public.studiomd_meta     for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "solo i propri dati" on public.studiomd_images   for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
