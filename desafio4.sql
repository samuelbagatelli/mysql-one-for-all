SELECT DISTINCT username AS usuario,
IF(MAX(YEAR(h.history_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.users u
JOIN SpotifyClone.historys h
ON u.user_id = h.user_id
GROUP BY u.username
ORDER BY u.username;