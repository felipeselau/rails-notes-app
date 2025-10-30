# Notes App

Sleek, macOS-inspired dark-mode Rails app for organizing Lists, Notes, and Tasks.

## Features

- **Lists**: Group your notes and tasks.
- **Notes**: Title + content, related to a list; connected to tasks via HABTM.
- **Tasks**: Title, content, due date, status, and priority; related to a list; linked to notes.
- **Modern UI**: macOS-style dark theme, sticky header, cards, badges, and buttons.
- **Smart UX**: Creating a note/task from a list preselects that list. Lists page shows related notes and tasks. Thoughtful empty states.

## Tech Stack

- Ruby on Rails 7 (Propshaft, Importmap)
- SQLite (dev/test)
- Minitest
- Stimulus (ready), Turbo (default Rails)
- Optional: Docker, Kamal deploy

## Getting Started

### Prerequisites

- Ruby (see `.ruby-version`)
- Bundler
- Node + Yarn not required (Importmap)

### Setup

```bash
bin/setup
# or
bundle install
bin/rails db:setup
```

### Run the app

```bash
bin/dev   # if Procfile/dev setup exists
# or
bin/rails server
```

Visit `http://localhost:3000`.

## Data Model

- `List` has_many `notes`, has_many `tasks`
- `Note` belongs_to `list`, HABTM `tasks`
- `Task` belongs_to `list`, HABTM `notes`, enum status: `pending`, `in_progress`, `completed`, `cancelled`

### Migrations

See `db/migrate/` for table definitions including the join table `notes_tasks`.

## Usage Highlights

- Lists index shows each list with its related notes and tasks.
- “New note” / “New task” links from a list auto-assign the list.
- Empty state on Lists: “start using the app by creating a list”.
- Dark theme is default; styles live in `app/assets/stylesheets/application.css`.

## Tests

```bash
bin/rails test
bin/rails test:system
```

## Lint & Security (optional helpers)

```bash
bin/rubocop
bin/brakeman
bin/bundler-audit
```

## API/Routes

Standard RESTful routes for Lists, Notes, Tasks. See `config/routes.rb`.

## Configuration Notes

- CSP and Importmap are configured out-of-the-box.
- PWA manifest is present but commented in layout; enable by uncommenting in `app/views/layouts/application.html.erb` and routes if you want installable behavior.

## Docker (optional)

```bash
docker build -t notes-app .
docker run --rm -p 3000:3000 notes-app
```

## Deploy (Kamal - optional)

Project includes a `bin/kamal` helper and `config/deploy.yml`. Configure your registry and servers, then:

```bash
bin/kamal setup
bin/kamal deploy
```

## Troubleshooting

- DB locked or schema mismatch: `bin/rails db:drop db:create db:migrate`
- Asset changes not showing: ensure `stylesheet_link_tag "application"` in layout and restart the server.
- Status nil error: handled in task view with a default to `pending`.

## License

MIT
