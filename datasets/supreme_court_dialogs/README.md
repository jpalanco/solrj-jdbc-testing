# Supreme Court Dialogs

* Inspired by: https://confluence.cornell.edu/display/llresearch/Supreme+Court+Dialogs+Corpus
* Source: https://confluence.cornell.edu/download/attachments/172918779/supreme_court_dialogs_corpus_v1.01.zip?version=1&modificationDate=1351805307000&api=v2

## Description

* collection - fields
* `conversations` - `case_id`,`utterance_id`,`after_previous`,`speaker`,`is_justice`,`justice_vote`,`presentation_side`,`utterance`
* `outcome` - `case_id`,`winning_side`
* `votes` - `case_id`,`justice_name_side_voted_for_1`,`justice_name_side_voted_for_2`,`justice_name_side_voted_for_3`,`justice_name_side_voted_for_4`,`justice_name_side_voted_for_5`,`justice_name_side_voted_for_6`,`justice_name_side_voted_for_7`,`justice_name_side_voted_for_8`,`justice_name_side_voted_for_9`
* `gender` - `speaker`,`gender`

## Setup
1. `./download.sh`
2. Fix line 122 of supreme.votes to have 8 delimiters. Add ` +++$+++ NA::NA`
3. `./supreme_court_dialogs.sh`

