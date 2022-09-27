SELECT COUNT(DISTINCT artist_id) AS artistas,
	COUNT(DISTINCT album_id) AS albuns,
  COUNT(song_id) AS cancoes
  FROM SpotifyClone.songs;