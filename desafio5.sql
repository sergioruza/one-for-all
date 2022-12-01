SELECT 
    nome AS 'cancao', COUNT(hist.cancoes_id) AS 'reproducoes'
FROM
    SpotifyClone.cancoes AS c
        LEFT JOIN
    SpotifyClone.historico AS hist ON c.cancoes_id = hist.cancoes_id
GROUP BY nome
ORDER BY reproducoes DESC , nome
LIMIT 2
;