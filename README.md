Puppet simulate
========
Simulate various states and behaviours of Puppet Resources.

Parameters
----------

- **debug_only**
    Only simulate changed or failed events if this is a debug run. Defaults
    to false  Valid values are `true`, `false`.

- **message**
    The message to be sent to the log.

- **name**
    An arbitrary tag for your own reference; the name of the message.

- **state**
    The state that should be simulated by the declared enotify resource.
    Defaults to 'changed'.  Valid values are `unchanged`, `changed`,
    `failed`.

- **withpath**
    Whether to show the full object path. Defaults to false.  Valid values
    are `true`, `false`.

License
-------


Contact
-------

Tom Linkin <tom@puppetlabs.com>

Support
-------

Please log tickets and issues at our [Projects site](https://github.com/trlinkin/puppet-simulate/issues)
