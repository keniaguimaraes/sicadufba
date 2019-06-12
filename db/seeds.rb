
Curso.create(nome:'Teste')

Tipoperfil.create(perfil:'Sem Perfil')
Tipoperfil.create(perfil:'Moderador 1')
Tipoperfil.create(perfil:'Moderador 2')

User.create(email:'adm@gmail.com', username:'Administrador',password:'123456', administrador:true,  curso_id:1,  tipoperfil_id:1, bloqueio:false)
User.create(email:'adm2@gmail.com', username:'Estudante', password:'123456', administrador:false, curso_id:1, tipoperfil_id:1,bloqueio:false)

Semestre.create(ano:2018, codigo:1)
Semestre.create(ano:2018, codigo:2)
Semestre.create(ano:2019, codigo:1)

Restricao.create(palavra:'idiot')
Restricao.create(palavra:'idiotinh')
Restricao.create(palavra:'idiotã')

Tag.create(tag:'Respeitoso')
Tag.create(tag:'Inspirador')
Tag.create(tag:'Boa didatica')
Tag.create(tag:'Trabalho Extra')
Tag.create(tag:'Faz Exercicios')
Tag.create(tag:'Resolve provas')
Tag.create(tag:'Faz chamada')



