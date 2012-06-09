Feature: CLI options

    In order to see help and version message
    As a user
    I want to use command line options

    Scenario Outline: see help message
        When I run `<command>`
        Then the output should contain "Usage:"
        Then the output should match /\s+smartdict-gtk          \s+run the application/
        Then the output should match /\s+smartdict-gtk --help   \s+see help message/
        Then the output should match /\s+smartdict-gtk --version\s+see version/

        Scenarios: see help message
            |command             |
            |smartdict-gtk -h    |
            |smartdict-gtk --help|
            |smartdict-gtk help  |


    Scenario Outline: see version message
        When I run `<command>`
        Then the output should match /Smartdict GUI\(gtk\) v\d{1,2}\.\d{1,2}\.\d{1,2}/
        Then the output should match /Smartdict core v\d{1,2}\.\d{1,2}\.\d{1,2}/
        Then the output should contain "Author: Sergey Potapov"
        Then the output should contain "URL: http://smartdict.net"

        Scenarios: see version message
            |command                |
            |smartdict-gtk -v       |
            |smartdict-gtk --version|
            |smartdict-gtk version  |
