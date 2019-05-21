
=begin
Curso.create(nome:'Teste')


User.create(email:'adm@gmail.com', username:'Administrador',password:'123456', administrador:true, perfil:1, curso_id:1)
User.create(email:'admin2@admin.com.br', username:'Administrador', password:'123456', administrador:true, perfil:1, curso_id:1)
User.create(email:'admi4@admin.com.br',  username:'Usuario',password:'123456', administrador:false,perfil:1, curso_id:1)
User.create(email:'admin5@admin.com.br',  username:'Usuario',password:'123456', administrador:false,perfil:1, curso_id:1)
 

Semestre.create(ano:2018, codigo:1)
Semestre.create(ano:2018, codigo:2)
Semestre.create(ano:2019, codigo:1)
Semestre.create(ano:2019, codigo:2)

Itemavaliacao.create(item:'Competencia Tecnica(habilidade em  desenvolver as aulas de demonstrar dominio dos conteudos da disciplina)')
Itemavaliacao.create(item:'Competência Relacional(capacidade em se relacionar com os alunos e propiciar um clima adequado para aprendizagem)')

Restricao.create(palavra:'idiot')
Restricao.create(palavra:'idiotinh')
Restricao.create(palavra:'idiotã')

Tag.create(tag:'respeitoso')
Tag.create(tag:'inspirador')
Tag.create(tag:'boa didatica')
Tag.create(tag:'falta demais')
=end
Tag.create(tag:'trabalho extra')
Tag.create(tag:'faz exercicios')
Tag.create(tag:'teste1')
Tag.create(tag:'teste2')
Tag.create(tag:'teste3')

