# `ntp` state

## Description

Ensures NTP is installed, an NTP server is configured and NTP time sync
is enabled.

## Compatibility

- Ubuntu >= 18.04
- Debian >= 9

## Data

### `ntp/ntp.conf`

Configuration for the NTP daemon. Default configuration uses the
`pool.ntp.org` pool and rejects all external requests.