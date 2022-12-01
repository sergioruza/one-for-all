SELECT 
    MIN(valor) AS faturamento_minimo,
    MAX(valor) AS faturamento_maximo,
    FORMAT(AVG(valor), 2) AS faturamento_medio,
    SUM(valor) AS faturamento_total
FROM
    SpotifyClone.usuario AS us,
    SpotifyClone.planos AS pl
WHERE
    us.planos_id = pl.planos_id
;