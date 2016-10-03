#!/usr/bin/env bash

wget -qO- -O tmp.zip "https://confluence.cornell.edu/download/attachments/172918779/supreme_court_dialogs_corpus_v1.01.zip?version=1&modificationDate=1351805307000&api=v2" && unzip -j tmp.zip 'supreme_court_dialogs_corpus_v1.01/*' && rm tmp.zip

