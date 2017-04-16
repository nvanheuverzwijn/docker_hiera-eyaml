[![Build Status](https://travis-ci.org/halberom/docker_hiera-eyaml.svg?branch=master)](https://travis-ci.org/halberom/docker_hiera-eyaml)

Example run

    $ docker run -it --rm --name eyaml halberom/hiera-eyaml version
    [hiera-eyaml-core] hiera-eyaml (core): 2.1.0

Create keys

    $ mkdir ~/eyaml-keys
    $ docker run -v ~/eyaml-keys/:/keys/ -it --rm --name eyaml halberom/hiera-eyaml createkeys
    [hiera-eyaml-core] Keys created OK
    $ ls -l ~/eyaml-keys/
    -rw------- 1 root root 1675 16 avr 12:00 private_key.pkcs7.pem
    -rw-r--r-- 1 root root 1050 16 avr 12:00 public_key.pkcs7.pem

Reuse the keys to encrypt/decrypt

    $ docker run -v ~/eyaml-keys/:/keys/ -it --rm --name eyaml halberom/hiera-eyaml encrypt -s test
    string: ENC[PKCS...
    $ docker run -v ~/eyaml-keys/:/keys/ -it --rm --name eyaml halberom/hiera-eyaml decrypt -s ENC[PKCS...
    test

Use a bash function or similar to make it easy

    eyaml(){
        docker run -v ~/eyaml-keys/:/keys/ -it --rm --name eyaml halberom/hiera-eyaml "$@"
    }
