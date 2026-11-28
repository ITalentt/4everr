-- Let authenticated site administrators review applications without granting
-- candidates or employers access to other users' application records.
alter table public.applications enable row level security;
grant select on public.applications to authenticated;

-- Keep profile-detail reads compatible with projects that missed the earlier
-- optional contact-phone migration.
alter table public.profiles add column if not exists phone text;

drop policy if exists "site admins read applications" on public.applications;
create policy "site admins read applications"
  on public.applications
  for select
  to authenticated
  using (public.is_site_admin());

notify pgrst, 'reload schema';
