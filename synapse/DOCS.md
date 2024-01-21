# Home Assistant Add-on: Synapse Matrix homeserver

This add-on runs [Synapse](https://github.com/matrix-org/synapse), which is the main homeserver of [matrix].

[Matrix] is an open protocol for decentralised, secure communications.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "Synapse Matrix homeserver" add-on.
1. Check the logs of the "Synapse Matrix homeserver" add-on to see if everything went well.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
data_dir: /config/addons_config/synapse
server_name: example.com
report_stats: false
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `data_dir`

Defines the path where the addon data will be stored.

### Option: `server_name`

Set the hostname of your Matrix homeserver

### Option: `report_stats`

Allow user to choose if synapse will report server metrics

## Changelog & Releases

This repository keeps a change log on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## License

MIT License

Copyright (c) 2023-2024 Delson Lima

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[matrix]: https://matrix.org
[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=0e98ce4c-synapse&repository_url=https%3A%2F%2Fgithub.com%2Fdelsonlima%2Fhassio-addons
[semver]: https://semver.org/spec/v2.0.0
