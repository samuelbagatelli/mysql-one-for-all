SELECT art.artist AS artista,
alb.album
FROM SpotifyClone.artists art
INNER JOIN SpotifyClone.albuns alb
ON art.artist_id = alb.artist_id
WHERE artist = "Elis Regina";