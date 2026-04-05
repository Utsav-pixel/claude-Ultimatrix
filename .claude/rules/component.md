# Component Rules

Rules Claude must follow when writing UI components (React, Vue, Svelte, etc.).

## Structure
- One component per file — no multi-component files
- Components should do one thing; split when a component has more than ~150 lines of JSX/template
- Props in, events out — components do not reach up into parent state
- No direct DOM manipulation inside components — use refs sparingly and only when unavoidable

## Naming
- PascalCase for component files and exports: `UserCard.tsx`, not `user-card.tsx`
- Prefix context/provider components with their domain: `AuthProvider`, `ThemeProvider`
- Boolean props use `is` / `has` prefix: `isLoading`, `hasError`, `isDisabled`

## State
- Lift state to the lowest common ancestor — not always to the top
- Server state (API data) belongs in a cache layer (React Query, SWR, Pinia) — not in useState
- Form state belongs in the form component or a form library (react-hook-form) — not in global store
- Do not put UI state (modal open/closed) in global store — keep it local

## Accessibility
- Interactive elements must have accessible labels (`aria-label`, `aria-labelledby`, or visible text)
- Use semantic HTML first (`<button>` not `<div onClick>`, `<nav>` not `<div className="nav">`)
- Keyboard navigation must work for all interactive elements
- Color alone must not convey meaning — pair with text or icon

## Performance
- Memoize expensive computations with `useMemo` / `computed` — but only when profiling shows a need
- Avoid creating new objects/arrays in render — causes unnecessary re-renders
- Lazy-load route-level components and heavy libraries
- Images must have explicit `width` and `height` to prevent layout shift

## Testing
- Test behavior, not implementation — what the user sees and does, not internal state
- Use `getByRole` and `getByLabelText` selectors over `getByTestId`
- Snapshot tests are allowed only for design-system primitives that rarely change
