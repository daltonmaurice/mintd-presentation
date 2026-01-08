# Data Registry Framework Presentation Series

A three-session presentation series introducing the Cooper Lab's data registry framework, including mint CLI, data-registry, and best practices for reproducible research data management.

## Overview

### Session 1: Concepts & Motivation (45-60 minutes)
**Audience:** All lab members
**Goal:** Understand the why and what

- Pain points of current ad-hoc data management
- Benefits of centralized registry approach
- High-level architecture overview
- Findability, reproducibility, and access control
- Framework philosophy and vision

**Key Takeaway:** The registry solves real problems and makes researchers more productive.

### Session 2: Using the Framework with Stata (60-90 minutes)
**Audience:** Researchers who will use the framework
**Goal:** Learn practical workflows

- Creating data projects with mint
- Understanding generated project structure
- Standard workflow: ingest → clean → validate
- Version control with Git and DVC
- Discovering and using datasets from catalog
- Live demonstrations and hands-on exercises

**Key Takeaway:** Creating and using reproducible data projects is easy.

### Session 3: Advanced Topics & Adoption (60-90 minutes)
**Audience:** Data managers, infrastructure admins, power users
**Goal:** Master advanced capabilities

- Publishing derived datasets
- Enclave workflows for sensitive data
- Collaboration patterns and access control
- Migration strategies for existing projects
- Governance and organizational adoption
- Future roadmap

**Key Takeaway:** The framework handles complex scenarios and scales organizationally.

## Prerequisites

### Software Requirements

1. **Quarto** (for rendering presentations)
   ```bash
   # macOS
   brew install quarto

   # Or download from https://quarto.org/docs/get-started/
   ```

2. **Web browser** (for viewing presentations)
   - Chrome, Firefox, Safari, or Edge
   - RevealJS presentations run in the browser

3. **Optional: VS Code** with Quarto extension for live preview

### Repository Access

The presentations reference these repositories:
- `/Users/mad265/git-pub/cooper-lab/mint/` - mint CLI
- `/Users/mad265/git-pub/cooper-lab/mint-registry/` - registry framework
- `/Users/mad265/git-yale/cooper-lab/data-registry/` - actual registry instance

Ensure you have access to these paths for live demos.

## Building the Presentations

### Render All Presentations

```bash
# Render all three sessions
quarto render session1-concepts.qmd
quarto render session2-usage.qmd
quarto render session3-advanced.qmd

# Or render all at once
quarto render
```

This creates HTML files:
- `session1-concepts.html`
- `session2-usage.html`
- `session3-advanced.html`

### Render Single Presentation

```bash
quarto render session1-concepts.qmd
```

### Live Preview

```bash
quarto preview session1-concepts.qmd
```

Opens presentation in browser with auto-reload on changes.

## Presenting

### Opening Presentations

1. Open the HTML file in your web browser
2. Press `F` for fullscreen mode
3. Press `S` to open speaker notes in separate window
4. Use arrow keys or click to navigate slides

### RevealJS Keyboard Shortcuts

| Key | Action |
|-----|--------|
| Arrow keys | Navigate slides |
| Space | Next slide |
| Shift + Space | Previous slide |
| F | Fullscreen mode |
| S | Speaker notes window |
| O | Slide overview mode |
| B | Blank screen (pause) |
| ? | Show help menu |
| Esc | Exit fullscreen/overview |

### Speaker Notes

Each slide includes speaker notes to guide presentation. To view:

1. Press `S` to open speaker notes window
2. Notes window shows:
   - Current slide
   - Next slide preview
   - Speaker notes
   - Timer

**Tip:** Use two monitors - presentation on projector, notes on laptop screen.

### Slide Overview

Press `O` to see all slides in grid view. Useful for:
- Navigating to specific slides quickly
- Seeing presentation structure
- Answering non-linear questions

## Live Demonstrations

### Session 2 Demo Preparation

Session 2 includes live demonstrations. Prepare beforehand:

#### Demo 1: Creating a Data Project

```bash
# Prepare clean workspace
cd ~/demo-workspace
rm -rf data_medicare_claims  # Clean up any previous demo

# During presentation, run:
mint create data --name medicare_claims --lang stata --register
```

**Backup:** If live demo fails, have screenshots ready in `demo-screenshots/` folder.

#### Demo 2: Exploring the Catalog

```bash
# Pre-clone the registry
git clone git@github.com:cooper-lab-yale/data-registry.git ~/demo-registry

# During presentation:
cd ~/demo-registry
grep -r "medicare" catalog/
# Or use GitHub web interface search
```

#### Demo 3: Complete Workflow

Create a simple workflow demonstration:

1. Have sample CSV data ready: `sample_data.csv`
2. Show ingestion, cleaning, validation
3. Demonstrate DVC tracking
4. Show git commit workflow

**Backup:** Pre-record a screencast of the workflow in case of technical issues.

### Technical Failure Contingency

If live demos fail:

1. **Network issues:** Use pre-prepared offline examples
2. **Git/GitHub issues:** Show catalog browsing via local clone
3. **Complete failure:** Rely on code blocks in slides and verbal explanation
4. **Time constraints:** Skip hands-on exercise, offer office hours instead

## Customization

### Editing Content

Presentations are written in Quarto Markdown (`.qmd` files):

- Regular Markdown syntax for content
- Mermaid diagrams for flowcharts (enclosed in ` ```{mermaid}` blocks)
- Speaker notes in `::: {.notes}` blocks
- Code blocks with language-specific syntax highlighting

### Modifying Theme

Edit `custom.scss` to change:

- Colors (search for `$primary-color`, `$secondary-color`, etc.)
- Typography (modify `$font-family-sans-serif`)
- Layout spacing
- Code block styling

After editing, re-render presentations:

```bash
quarto render
```

### Adding Slides

Insert new slides by adding `## Slide Title` headers:

```markdown
## New Slide Title

Content goes here.

::: {.notes}
Speaker notes for this slide.
:::

---

## Next Slide
```

The `---` separator is optional between `##` headers.

### Adding Diagrams

Use Mermaid for architecture diagrams:

````markdown
```{mermaid}
flowchart LR
    A[Start] --> B[Process]
    B --> C[End]
```
````

Mermaid supports:
- Flowcharts (`flowchart`)
- Sequence diagrams (`sequenceDiagram`)
- Gantt charts (`gantt`)
- Class diagrams (`classDiagram`)

Documentation: https://mermaid.js.org/

## Tips for Effective Delivery

### Session 1: Concepts

- **Start with empathy:** Acknowledge current pain points
- **Use real examples:** Reference actual lab experiences
- **Keep it visual:** Rely on diagrams, minimize text bullets
- **End with inspiration:** Show the vision of better workflows

### Session 2: Usage

- **Go slow on demos:** Explain each command as you type
- **Encourage questions:** Pause frequently for clarification
- **Show mistakes:** If you make an error, show how to fix it (builds confidence)
- **Provide hands-on time:** Let people try it themselves if time permits

### Session 3: Advanced

- **Know your audience:** Adjust depth based on who attends
- **Focus on use cases:** Emphasize when you'd use advanced features
- **Be honest about limitations:** Framework isn't perfect, acknowledge gaps
- **Gather feedback:** This session should shape future development priorities

## Post-Presentation Follow-Up

After each session:

1. **Share resources:**
   - Email slide deck
   - Link to documentation
   - Office hours schedule

2. **Provide hands-on opportunities:**
   - Schedule follow-up workshops
   - Offer one-on-one assistance
   - Create practice exercises

3. **Gather feedback:**
   - Survey what worked/didn't work
   - Ask for feature requests
   - Identify adoption blockers

4. **Document questions:**
   - Create FAQ from common questions
   - Update documentation based on confusion points
   - Plan future training on weak areas

## Files in This Repository

```
mint-presentation/
├── session1-concepts.qmd      # Session 1 source
├── session2-usage.qmd         # Session 2 source
├── session3-advanced.qmd      # Session 3 source
├── custom.scss                # Custom RevealJS theme
├── README.md                  # This file
├── SPEC.md                    # Original specification
├── session1-concepts.html     # Rendered presentation (after quarto render)
├── session2-usage.html        # Rendered presentation (after quarto render)
├── session3-advanced.html     # Rendered presentation (after quarto render)
└── demo-screenshots/          # Backup images for demos (create as needed)
```

## Troubleshooting

### Quarto not found

```bash
# Install Quarto
brew install quarto  # macOS
# Or download from https://quarto.org
```

### Mermaid diagrams not rendering

Ensure you're viewing the HTML file in a web browser, not a plain text viewer. Mermaid requires JavaScript.

### Speaker notes not showing

Press `S` to open speaker notes window. Ensure pop-ups are not blocked in your browser.

### Custom theme not applied

Verify `custom.scss` is in the same directory as the `.qmd` files. Check the YAML frontmatter includes:

```yaml
format:
  revealjs:
    theme: [default, custom.scss]
```

### Presentations look different than expected

Clear browser cache and refresh. RevealJS sometimes caches styles.

## Additional Resources

- **Quarto Documentation:** https://quarto.org/docs/presentations/revealjs/
- **RevealJS Documentation:** https://revealjs.com/
- **Mermaid Documentation:** https://mermaid.js.org/
- **mint CLI README:** `/Users/mad265/git-pub/cooper-lab/mint/README.md`
- **data-registry README:** `/Users/mad265/git-yale/cooper-lab/data-registry/README.md`

## Contributing

Improvements to these presentations are welcome:

1. Edit the `.qmd` source files
2. Test with `quarto preview`
3. Commit changes with descriptive messages
4. Share feedback on what works well or needs improvement

## License

These presentations are internal Cooper Lab materials. Adapt as needed for lab use.

## Contact

Questions or suggestions:
- GitHub Issues on data-registry repository
- Lab Slack: #data-infrastructure
- Email: infrastructure-admins@cooper-lab
