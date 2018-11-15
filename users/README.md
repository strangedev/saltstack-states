# `users` state

## Description

A state which ensures users are present and assigned to the correct groups.

## Compatibility

- Linux

## Pillars

### `users`

Used to configure which users exists and what groups they should be
assigned to.

### `groupnames`

Used to configure how generic group names like `sudo` translate
to different distros.

## See also

`ssh` state: For configuring ssh access to the user accounts.
