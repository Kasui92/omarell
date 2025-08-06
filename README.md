<p align="center">
  <img src="https://raw.githubusercontent.com/Kasui92/omarell/refs/heads/main/applications/icons/Omarell.png" alt="Omarell Logo" height="200" width="200">
</p>

<h1 align="center">Omarell</h1>

Omarell is a personalized fork of [Omakub](https://omakub.org), the one-liner tool that turns a fresh Ubuntu install into a modern development environment. It builds on Omakub with targeted tweaks for a more streamlined and opinionated Linux setup.

The name comes from umarell, the Italian archetype of a retiree watching construction sites with a critical eye. Likewise, Omarell keeps tabs on the evolving [Omarchy project](https://omarchy.org), selectively adopting useful changes while staying grounded on a stable, proven base.

[Omarell](https://github.com/user-attachments/assets/d3eaf4d6-bb14-4553-8250-29bd90c3d8cc)

## Installation

Omarell is designed to transform a fresh **Ubuntu Server LTS** installation into a complete development environment. Make sure you have:

- A fresh Ubuntu Server LTS installation (24.04)
- A stable internet connection (the setup downloads packages and extensions)
- At least 30 minutes for the complete installation process

To install Omarell, simply run the following command in your terminal:

```bash
curl -sSL https://omakasui.org/omarell | bash
```

You can also install Omarell in its "development" version to experiment and/or contribute, but you accept all the risks involved (and a few coffees won't always be enough). This is the command, for the brave:

```bash
curl -sSL https://omakasui.org/omarell-dev | bash
```

> [!NOTE]
>
> ### Still want to use the old version?
>
> If you're looking for the stable Ubuntu Desktop-based version (v1.x), you can find it in the [`legacy`](https://github.com/KAsui92/omarell/tree/legacy) branch.
>
> Run: `eval "$(wget -qO- https://raw.githubusercontent.com/Kasui92/omarell/legacy/boot.sh)"`

## Key Features

- **Built on Ubuntu Server**: A lean and stable LTS foundation, stripped of superfluous services and packages.
- **Minimal yet GNOME-powered**: Only the essential GNOME components, with Wayland as the default session and no unnecessary bloat.
- **No Snaps. Ever.**: Snap is completely removed. Applications are sourced from Flatpak or directly from trusted packages.
- **Smart window management**: Pre-configured tiling with Forge extension, 6 workspaces, and keyboard-driven workflow optimizations.
- **Silent post-install magic**: The setup continues automatically after reboot—fully hands-off, zero interaction required.
- **Umarell spirit, Omakub roots**: Forked from Omakub, driven by the same passion for usability, but with the hands-on curiosity and practical eye of an Umarell.

## Documentation

For Omarell-specific features, consult the [Omarell manual](https://manuals.omakasui.org/omarell).

To learn about the project it comes from and the key features it has inherited, visit the [official Omakub manual](https://manuals.omamix.org/1/read).

## License

Omarell is released under the [MIT License](https://opensource.org/licenses/MIT), like the original Omakub project.

## Contributing

As a fork of Omakub, Omarell welcomes contributions that extend existing functionality without compromising compatibility with the base project.

If you want to contribute to Omakub core features, visit the [official Omakub repository](https://github.com/basecamp/omakub).
