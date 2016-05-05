Example run

    $ docker run -it --rm --name eyaml halberom/hiera-eyaml version
    [hiera-eyaml-core] hiera-eyaml (core): 2.1.0

Use a bash function or similar to make it easy

    eyaml(){
        docker run -it --rm --name eyaml halberom/hiera-eyaml "$@"
    }

