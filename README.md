# fluent-plugin-hostname

Fluentd plugin put the hostname in the data.

## Configuration 

### HostnameOutput

    <match hoge.foo>
        type hostname
        key_name host
    </match>

Output messages like:

    {"field1": "value1", "field2": "value2", "host": "app01.hoge"}

## Copyright

Copyright (c) 2012 Tatsuya Fukata. See LICENSE.txt for
further details.

