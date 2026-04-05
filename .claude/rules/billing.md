# Billing Rules

Rules Claude must follow when writing code that touches billing, payments, or subscriptions.

## Never Do
- Never log full credit card numbers, CVV, or raw PANs — even in debug logs
- Never store payment tokens in plaintext in the database
- Never expose billing amounts or customer plan details in client-side JavaScript
- Never skip idempotency keys on payment API calls (Stripe, etc.)
- Never retry a payment charge without checking if the previous attempt succeeded
- Never expose internal pricing logic or discount codes in API responses

## Always Do
- Use the payment provider's SDK (Stripe, Paddle, etc.) — never raw card processing
- Validate webhook signatures before processing billing events
- Use idempotency keys on all charge/subscription create calls
- Log billing events (subscription created, charge failed) for audit trails — without PII
- Handle `payment_intent.requires_action` for 3D Secure flows
- Wrap all billing mutations in database transactions

## Error Handling
- On charge failure: store the failure reason, notify user, do NOT retry automatically
- On webhook delivery failure: rely on provider retry — do not duplicate-process
- On subscription expiry: degrade gracefully, do not hard-block the user immediately

## Testing
- Always use test mode keys (Stripe `sk_test_*`) in development and CI
- Never use real card numbers even in tests — use provider test card numbers
- Mock the payment provider in unit tests; use sandbox in integration tests
