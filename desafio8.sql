SELECT 
    nome AS artista, alb.album
FROM
    SpotifyClone.artista AS art
        RIGHT JOIN
    SpotifyClone.album AS alb ON alb.artista_id = art.artista_id
WHERE
    nome = 'Elis Regina'
ORDER BY album
;