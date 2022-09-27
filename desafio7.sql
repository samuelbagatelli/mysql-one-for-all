SELECT art.artist AS artista,
alb.album,
COUNT(f.user_id) AS seguidores
FROM SpotifyClone.artists art
INNER JOIN SpotifyClone.albuns alb
ON art.artist_id = alb.artist_id
INNER JOIN SpotifyClone.follow f
ON art.artist_id = f.artist_id
GROUP BY art.artist, alb.album
ORDER BY seguidores DESC, artista, album;