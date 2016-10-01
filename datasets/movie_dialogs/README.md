# Cornell Movie Dialogs

* Inspired by: http://www.mpi-sws.org/~cristian/Cornell_Movie-Dialogs_Corpus.html
* Source: http://www.mpi-sws.org/~cristian/data/cornell_movie_dialogs_corpus.zip

## Description

* collection - fields
* `movie_titles_metadata` - `movieID`,`movie_title`,`movie_year`,`IMDB_rating`,`num_IMDB_votes`,`genres`
* `movie_characters_metadata` - `characterID`,`character_name`,`movieID`,`movie_title`,`gender`,`credits_pos`
* `movie_lines` - `lineID`,`characterID`,`movieID`,`character_name`,`line`
* `movie_conversations` - `characterID1`,`characterID2`,`movieID`,`utterances`
* `raw_script_urls` - `movieID`,`movie_title`,`url`

## Setup
1. `./movie_dialogs.sh`

## Streaming Expression Examples
### InnerJoin
```
select(
  innerJoin(
    search(movie_dialogs_movie_titles_metadata, q=*:*, fl="movieID,movie_title", sort="movieID asc"),
    search(movie_dialogs_movie_lines, q=*:*, fl="movieID,character_name,line", sort="movieID asc"),
    on="movieID"
  ),
  movie_title,
  character_name,
  line
)
```