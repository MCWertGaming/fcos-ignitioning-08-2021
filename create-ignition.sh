docker run --interactive --rm --security-opt label=disable \
       --volume ${PWD}:/pwd --workdir /pwd quay.io/coreos/butane:release \
       --pretty --strict test-install.bu > test-install.ign


# download iso
coreos-installer download --decompress --platform metal --format iso

# create ignition
butane --pretty --strict test-install.bu > test-install.ign

# embed ignition
coreos-installer iso ignition embed --ignition-file test-install.ign fedora-coreos-34.20210725.3.0-live.x86_64.iso
