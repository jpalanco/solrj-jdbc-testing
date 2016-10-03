#!/usr/bin/env bash

wget -qO- -O tmp.zip http://www.mpi-sws.org/~cristian/data/cornell_movie_dialogs_corpus.zip && unzip -j tmp.zip 'cornell movie-dialogs corpus/*' && rm tmp.zip

