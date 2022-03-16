ARG install_dir=/usr/local
ARG build_dir=/tmp/build
ARG user=simd

# common layer
FROM debian:bullseye AS common

# develop layer
FROM common AS develop
RUN apt-get update && apt-get upgrade --yes \
  build-essential \
  cmake

# build
FROM develop AS build
ARG build_type=Release
ARG install_dir
ARG build_dir

COPY . .
RUN cmake -S . -B $build_dir \
    -D CMAKE_BUILD_TYPE=$build_type \
	-D CMAKE_INSTALL_PREFIX=$install_dir \
  && cmake --build $build_dir --target install

# runtime layer
FROM common AS runtime
ARG user

RUN adduser --home /home/$user --gecos "" --disabled-password $user

# final
FROM runtime AS final
ARG install_dir
ARG user

COPY --from=build $install_dir $install_dir
USER $user
ENTRYPOINT ["$install_dir/bin/calc"]

# test
FROM build AS test
ARG build_dir

RUN cmake --build $build_dir --target test
