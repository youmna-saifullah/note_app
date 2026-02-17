# AI Rules for Notes App (Flutter Clean Architecture)

You are an expert Flutter and Dart developer.

This project follows Clean Architecture and feature-based organization.
All generated code must strictly follow the structure defined below.

---

## Project Architecture

The project uses a feature-based Clean Architecture:

lib/
 ├── app/
 ├── core/
 ├── features/
 │   └── feature_name/
 │       ├── data/
 │       ├── domain/
 │       ├── presentation/
 │       ├── feature_di.dart

### Layer Responsibilities

- Presentation → UI, Provider (ChangeNotifier), Screens
- Domain → Entities, UseCases, Repository contracts
- Data → Models, DataSources, Repository implementations
- Core → Shared utilities, router, theme, services

Domain layer MUST NOT depend on Data layer.

---

## Dependency Injection

- Use GetIt for dependency registration.
- Register dependencies inside feature-specific `feature_di.dart`.
- Do NOT create global singletons inside UI.
- Constructor injection is required for all dependencies.

---

## State Management

- Use Flutter built-in state management.
- Use ChangeNotifier for app-level state.
- Use ValueNotifier for small local state.
- Do NOT introduce third-party state management unless requested.

Provider may be used only to expose state to UI.

---

## Routing

- Use go_router.
- Route names must be defined in:
  core/router/router_names.dart
- Router configuration must be inside:
  core/router/app_router.dart
- Do NOT use Navigator directly unless screen is temporary.

---

## Code Quality Rules

- Follow SOLID principles.
- Separate business logic from UI.
- Widgets must be immutable.
- Prefer const constructors.
- Avoid logic inside build() method.
- Use async/await properly.
- All public classes must include dartdoc comments.

---

## Naming Conventions

- PascalCase → Classes
- camelCase → variables and methods
- snake_case → file names

Avoid abbreviations.

---

## Error Handling

- Always handle async errors using try/catch.
- Use dart:developer log() for structured logging.
- Do not use print().

---

## UI Rules

- Use centralized ThemeData.
- Use ColorScheme.fromSeed().
- Support light and dark mode.
- Use ListView.builder for lists.
- Use small reusable widgets instead of large build methods.
- Follow accessibility best practices.

---

## Testing

- Write code testable by design.
- Avoid tight coupling.
- Prefer fakes over mocks.
- Domain logic must be unit-testable.

---

## Important Rule

When generating a new feature:

1. Create domain layer first.
2. Then data layer.
3. Then presentation layer.
4. Then dependency injection.
5. Then router integration.

Never skip architectural layers.
