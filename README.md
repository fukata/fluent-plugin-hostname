# fluent-plugin-hostname, a plugin for [Fluentd](http://fluentd.org)

Fluentd plugin put the hostname in the data.

## Configuration 

### HostnameOutput

    <match hoge.foo>
        type hostname
        key_name host
        add_prefix filtered
    </match>

    <match filterd.hoge.foo>
        ...
    </match>

Output messages like:

    {"field1": "value1", "field2": "value2", "host": "app01.hoge"}

## Copyright

Copyright (c) 2012 Tatsuya Fukata. See LICENSE.txt for
further details.

