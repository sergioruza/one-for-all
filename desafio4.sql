SELECT 
    us.nome AS usuario,
    IF(YEAR(MAX(hist.data_hist)) >= 2021,
        'Usuário ativo',
        'Usuário inativo') AS 'status_usuario'
FROM
    SpotifyClone.usuario AS us
        INNER JOIN
    SpotifyClone.historico AS hist ON us.usuario_id = hist.usuario_id
GROUP BY us.nome
ORDER BY nome
;