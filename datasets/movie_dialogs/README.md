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
1. `./download.sh`
2. `./movie_dialogs.sh`

## Examples
### Streaming Expressions
#### InnerJoin
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
### Calcite/Avatica
#### Join
```sql
select distinct movie_title,character_name from movie_dialogs_movie_titles_metadata a join movie_dialogs_movie_lines b on a.movieID=b.movieID order by movie_title
```
