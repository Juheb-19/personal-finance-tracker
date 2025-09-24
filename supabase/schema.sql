-- Supabase schema for Personal Finance Tracker
create extension if not exists "uuid-ossp";

-- users
create table if not exists users (
  id uuid default uuid_generate_v4() primary key,
  name text,
  email text unique,
  phone text,
  created_at timestamptz default now()
);

-- categories
create table if not exists categories (
  id uuid default uuid_generate_v4() primary key,
  name text unique,
  parent_id uuid,
  created_at timestamptz default now()
);

-- transactions
create table if not exists transactions (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references users(id),
  amount numeric not null,
  currency text default 'INR',
  category_id uuid references categories(id),
  payee text,
  notes text,
  transaction_date date,
  transaction_type text, -- expense / income / transfer
  source text, -- whatsapp / telegram / email / manual
  metadata jsonb,
  created_at timestamptz default now()
);

-- budgets
create table if not exists budgets (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references users(id),
  category_id uuid references categories(id),
  amount numeric,
  period text, -- monthly / weekly
  start_date date,
  created_at timestamptz default now()
);

-- reports_cache
create table if not exists reports_cache (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references users(id),
  report_type text,
  payload jsonb,
  generated_at timestamptz default now()
);

-- audit_logs
create table if not exists audit_logs (
  id uuid default uuid_generate_v4() primary key,
  actor text,
  action text,
  entity text,
  before jsonb,
  after jsonb,
  created_at timestamptz default now()
);
