SELECT 
    nome AS artista,
    alb.album AS album,
    COUNT(seg.artista_id) AS seguidores
FROM
    SpotifyClone.artista AS art
        INNER JOIN
    SpotifyClone.album AS alb ON art.artista_id = alb.artista_id
        INNER JOIN
    SpotifyClone.seguindo_artistas AS seg ON seg.artista_id = alb.artista_id
GROUP BY artista , album
ORDER BY seguidores DESC , artista, album
;