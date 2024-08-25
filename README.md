# `lustre_ssg` starter template

This is a dead simple demo repo to show you how to get started _today_ with
[`lustre`](https://hexdocs.pm/lustre/lustre.html) and [`lustre_ssg`](https://hexdocs.pm/lustre_ssg/index.html).

This template uses the markup syntax [`djot`](https://djot.net/) which is parsed with [`lustre_ssg/djot`](https://hexdocs.pm/lustre_ssg/lustre/ssg/djot.html) which is in turn powered by [`jot`](https://hexdocs.pm/jot/) to render content.

We use [PicoCSS](https://picocss.com/) as a sensible drop-in CSS framework.

![An example website created with this template.](./example.png)

## Getting started

Run `gleam run -m build` to generate the static HTML for your site. How you serve
it is up to you: everything you need to serve will be in the `dist/` directory.

## Adding pages

You can add new posts by creating another djot file inside `content/`, for example `content/your_new_post.dj`.
