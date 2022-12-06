SELECT count(cancoes_id) FROM SpotifyClone.historico AS hist
INNER JOIN SpotifyClone.usuario as us ON hist.usuario_id = us.usuario_id
WHERE us.nome = 'Barbara Liskov';