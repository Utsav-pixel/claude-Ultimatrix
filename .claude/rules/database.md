# Database Rules

Rules Claude must follow when writing database queries, migrations, and data access code.

## Queries
- Always use parameterized queries / prepared statements — never string-interpolate user input into SQL
- Never use `SELECT *` in production code — always name the columns you need
- Add `LIMIT` to all queries that could return unbounded rows
- Use database-level constraints (NOT NULL, UNIQUE, FK) — don't rely on application logic alone
- Prefer reads from replicas for non-critical reads when replicas are available

## Migrations
- Migrations are one-way — write `up` and `down` migrations
- Never drop a column/table in the same migration that removes the application code using it
  - Step 1: deploy code that stops using the column
  - Step 2: then drop the column in a follow-up migration
- Never rename a column in one step — add new column, backfill, then drop old one
- Index columns used in WHERE, JOIN, and ORDER BY clauses
- Large table migrations (backfills) must be batched — never `UPDATE` millions of rows at once

## Transactions
- Use transactions for any multi-step write that must be atomic
- Keep transactions short — do not call external APIs inside a transaction
- Always handle rollback on error

## Sensitive Data
- Never log query results that contain PII (emails, names, payment info)
- Encrypt sensitive columns at rest (SSN, payment tokens, health data)
- Use row-level security where the database supports it for multi-tenant data

## Performance
- Explain-analyze slow queries before optimizing — don't guess
- N+1 queries are bugs — use eager loading / joins
- Cache invalidation must happen in the same transaction as the write
