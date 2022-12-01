SELECT 
    us.nome AS usuario,
    COUNT(hist.cancoes_id) AS 'qt_de_musicas_ouvidas',
    (ROUND(SUM(duracao) / 60, 2) ) AS total_minutos
FROM
    SpotifyClone.usuario AS us
        INNER JOIN
    SpotifyClone.historico AS hist ON us.usuario_id = hist.usuario_id
        INNER JOIN
    SpotifyClone.cancoes AS c ON hist.cancoes_id = c.cancoes_id
GROUP BY usuario
ORDER BY usuario;