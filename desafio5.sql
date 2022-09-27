SELECT s.song_name AS cancao,
COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.songs s
JOIN SpotifyClone.historys h
ON h.song_id = s.song_id
GROUP BY h.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;