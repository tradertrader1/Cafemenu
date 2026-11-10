-- Run this complete script in Supabase > SQL Editor > New query.
-- Public visitors can read the menu. Only signed-in Supabase users can change it.

create table if not exists public.cafe_menu (
  id integer primary key check (id = 1),
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.cafe_menu enable row level security;

-- Remove policies with these names first so this script can safely be run again.
drop policy if exists "Anyone can read the cafe menu" on public.cafe_menu;
drop policy if exists "Signed-in admins can insert the cafe menu" on public.cafe_menu;
drop policy if exists "Signed-in admins can update the cafe menu" on public.cafe_menu;

create policy "Anyone can read the cafe menu"
  on public.cafe_menu for select
  to anon, authenticated
  using (true);

create policy "Signed-in admins can insert the cafe menu"
  on public.cafe_menu for insert
  to authenticated
  with check (true);

create policy "Signed-in admins can update the cafe menu"
  on public.cafe_menu for update
  to authenticated
  using (true)
  with check (true);

grant select on public.cafe_menu to anon, authenticated;
grant insert, update on public.cafe_menu to authenticated;
