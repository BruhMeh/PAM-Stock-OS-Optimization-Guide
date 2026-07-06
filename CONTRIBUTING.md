# CONTRIBUTING.md

# Contributing

Thank you for your interest in improving the **PAM Stock OS Optimization Guide**.

The goal of this repository is to preserve Uri's original optimization guide while improving its readability, organization and long-term maintainability.

Please read these guidelines before submitting changes.

---

# Project Principles

Every contribution should follow these principles.

1. Preserve the original technical recommendations.
2. Improve documentation without changing intent.
3. Prefer clarity over complexity.
4. Prefer structure over verbosity.
5. Keep explanations concise.

---

# Editorial Guidelines

Documentation should explain:

* What the optimization does.
* When it should be applied.
* Any important caveats.

Documentation should **not**:

* Explain Android internals in detail.
* Add unrelated optimization advice.
* Introduce personal preferences as facts.
* Repeat information unnecessarily.

---

# Writing Style

Keep explanations short.

Prefer one or two concise paragraphs instead of long blocks of text.

Example:

✅ Good

```text
Restricts background execution while preserving normal application functionality.
```

❌ Avoid

```text
This optimization works by changing the Android Activity Manager...
```

Explain the observable behavior rather than the implementation.

---

# Command Formatting

ADB commands must always be copied exactly as tested.

Never:

* Reformat commands.
* Change parameters.
* Wrap long commands.
* Simplify commands.

If a command appears incorrect, open an Issue instead of modifying it directly.

---

# Screenshots

Screenshots should:

* Match the current section.
* Be cropped appropriately.
* Use descriptive filenames.
* Include a short caption.

Example:

```text
grant-shizuku-permission.png
```

---

# Author Recommendations

Recommendations from the original author should be preserved using GitHub callouts.

Example:

```markdown
> [!TIP]
> **Uri's Recommendation**
>
> Recommendation text.
```

---

# Grammar and Formatting

Contributors are encouraged to improve:

* Grammar
* Spelling
* Markdown formatting
* Heading consistency
* OCR mistakes

These improvements do not require changing the technical content.

---

# Technical Changes

Changes that affect:

* ADB commands
* Package names
* Optimization recommendations
* Performance claims

should be supported by testing or confirmed by the original author whenever possible.

---

# Pull Requests

Before submitting a Pull Request, verify:

* [ ] Markdown renders correctly.
* [ ] Commands were not modified unintentionally.
* [ ] Grammar has been reviewed.
* [ ] Headings follow the existing style.
* [ ] No unnecessary text was added.
* [ ] The original intent has been preserved.

---

# Code of Conduct

Be respectful.

Constructive feedback is always welcome.

Remember that the purpose of this project is to preserve valuable community knowledge while making it easier to understand and maintain.
