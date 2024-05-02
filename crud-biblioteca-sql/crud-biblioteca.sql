/*

USE biblioteca_murilo;

select emprestimo.data_retirada, emprestimo.data_devolucao, usuario.nome_usuario, livro.titulo
from emprestimo
inner join livro on emprestimo.fk_livro = livro.ISBN
inner join usuario on emprestimo.fk_usuario = usuario.id_usuario;

select * from livro where ISBN = '1';

select nome_autor, data_nascimento FROM autor where year(data_nascimento) > 1965;

select biografia, nome_autor from autor where nome_autor = 'Emily White';

select usuario.nome_usuario, associacao.associacao
from usuario 
inner join associacao on usuario.fk_associacao = associacao.id_associacao
where fk_associacao = 2;

select titulo from livro where ISBN = 6;

SELECT nome_autor FROM autor WHERE nome_autor LIKE 'J%';

select email_usuario from usuario where id_usuario = 5;

select * from livro WHERE titulo LIKE '%Aventuras%';

select  usuario.nome_usuario, usuario.data_registro from usuario WHERE nome_usuario = 'Murilo';

select fk_livro from emprestimo;

select usuario.id_usuario, usuario.nome_usuario FROM usuario WHERE email_usuario = "joao@gmail.com";

select * from usuario WHERE DATE(data_registro) > '2024-01-30'; 

select * from autor WHERE YEAR(data_nascimento) >= '2000';

select * from usuario WHERE DATE(data_registro) between '2024-01-01' and '2024-03-31';

select * from usuario WHERE email_usuario = '';

select livro.titulo from livro WHERE length(descricao) > 50;

*/
