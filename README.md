<p align="center">
  <img src="https://raw.githubusercontent.com/Kasui92/omarell/refs/heads/main/applications/icons/Omarell.png" alt="Omarell Logo">
</p>

<h1 align="center">Omarell</h1>

Omarell is a customized fork of [Omakub](https://omakub.org) that offers additional personalizations for an even more refined Linux experience.

## What is Omarell?

The name "Omarell" is derived from the Italian term "umarell" (often spelled "omarell" in some dialects), which refers to retired elderly men who stand watching construction sites, often with their hands clasped behind their backs, offering unsolicited advice to workers. It's a popular cultural reference in Italy that embodies curious observation and gentle improvement suggestions.

In the spirit of its namesake, Omarell takes the base Omakub system—which transforms a fresh Ubuntu installation into a fully-configured, modern development environment with a single command—and adds its own improvements and extra customizations, watching over and enhancing the original work.

# Installation

To install Omarell, simply run the following command in your terminal:

```bash
eval "$(wget -qO- https://raw.githubusercontent.com/Kasui92/omarell/main/boot.sh)"
```

You can also install Omarell in its "development" version to experiment and/or contribute, but you accept all the risks involved (and a few coffees won't always be enough). This is the command, for the brave:

```bash
OMARELL_REF=dev
eval "$(wget -qO- https://raw.githubusercontent.com/Kasui92/omarell/main/boot.sh)"
```

## Key Features

- **All Omakub benefits**: the entire Omakub ecosystem remains intact, with all its tools and configurations
- **Lightweight base installation**: minimal core setup without suggested applications (most are optional)
- **Browser flexibility**: choice between multiple browsers (though Firefox is recommended!)
- **Enhanced GNOME customizations**: additional desktop tweaks and interesting enhancements
- **Theme selection**: option to choose your preferred theme during installation
- **Developer-focused**: maintains the developer-oriented approach of the original project while adding flexibility

## Documentation

For complete documentation of the core features, visit the [official Omakub manual](https://manual.omakub.org).

For Omarell-specific features, consult this repository.

## License

Omarell is released under the [MIT License](https://opensource.org/licenses/MIT), like the original Omakub project.

## Contributing

As a fork of Omakub, Omarell welcomes contributions that extend existing functionality without compromising compatibility with the base project.

If you want to contribute to Omakub core features, visit the [official Omakub repository](https://github.com/basecamp/omakub-site).