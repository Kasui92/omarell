<p align="center">
  <img src="https://raw.githubusercontent.com/Kasui92/omarell/refs/heads/main/applications/icons/Omarell.png" alt="Omarell Logo" height="200" width="200">
</p>

<h1 align="center">Omarell</h1>

Omarell is a personalized fork of [Omakub](https://omakub.org), the one-liner tool that turns a fresh Ubuntu install into a modern development environment. It builds on Omakub with targeted tweaks for a more streamlined and opinionated Linux setup.

The name comes from umarell, the Italian archetype of a retiree watching construction sites with a critical eye. Likewise, Omarell keeps tabs on the evolving [Omarchy project](https://omarchy.org), selectively adopting useful changes while staying grounded on a stable, proven base.

[Omarell](https://github.com/user-attachments/assets/d3eaf4d6-bb14-4553-8250-29bd90c3d8cc)

## ⚠️ Warning

Omarell is currently undergoing a major rewrite.

The upcoming version 2.0 (in development) is based on **Ubuntu Server** and targets users who want a minimal, clean, and highly customizable Gnome setup.

The `dev` branch is where active development is happening for v2.

The `main` branch currently reflects the latest v1.x state, but it is **no longer the reference** for that version and will soon be updated.

If you're looking for the stable Ubuntu Desktop-based version (v1.x), you can find it in the [`legacy`](https://github.com/KAsui92/omarell/tree/legacy) branch.

### Still want to use the old version?

Run:

```bash
eval "$(wget -qO- https://raw.githubusercontent.com/Kasui92/omarell/legacy/boot.sh)"
```

## Installation

To install Omarell, simply run the following command in your terminal:

```bash
curl -sSL https://omakasui.org/omarell | bash
```

You can also install Omarell in its "development" version to experiment and/or contribute, but you accept all the risks involved (and a few coffees won't always be enough). This is the command, for the brave:

```bash
curl -sSL https://omakasui.org/omarell-dev | bash
```

## Key Features

- **All Omakub benefits...**: the base is Omakub and that remains, solid and proven
- **...with Omarchy approach**: With the philosophy and vibes of Omarchy, in its themes and in the way of managing the desktop.
- **Lightweight base installation**: minimal core setup without suggested applications (most are optional) and initial theme selection
- **Updated menu system**: reorganized, cleaned up, and enhanced system menus for better organization and usability
- **A CLI for terminal people**: it's still based on the Menu, but without the effort of interaction. Clean and simple.
- **Enhanced GNOME customizations**: additional desktop tweaks and interesting enhancements, like GDM background sync, Forge Extension for a WM desktop and consistency fixes
- **No Snaps!**: removed snap and replaced all applications with Flatpak or from sources

## Documentation

For complete documentation of the core features, visit the [official Omakub manual](https://manuals.omamix.org/1/read).

For Omarell-specific features, consult the [Omarell manual](https://manuals.omakasui.org/omarell).

## License

Omarell is released under the [MIT License](https://opensource.org/licenses/MIT), like the original Omakub project.

## Contributing

As a fork of Omakub, Omarell welcomes contributions that extend existing functionality without compromising compatibility with the base project.

If you want to contribute to Omakub core features, visit the [official Omakub repository](https://github.com/basecamp/omakub).
