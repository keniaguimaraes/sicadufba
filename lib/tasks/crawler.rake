namespace :crawler do

  desc 'Crawl courses codes, names and curriculums'
  task :courses => :environment do
    puts '-----------------------------------------------------------------------'
    puts '-> Starting courses crawling...'

    require 'rubygems'
    require 'mechanize'

    agent = Mechanize.new
    page = agent.get 'https://alunoweb.ufba.br/SiacWWW/ListaCursosEmentaPublico.do?cdGrauCurso=01'

    courseAnchors = page.search('a')

    courseAnchors.each do |a|
      url = a.attribute('href').value

      codeIndex = url.index('cdCurso') + 8
      code = url[codeIndex..codeIndex + 5]

      curriculumIndex = url.index('nuPerCursoInicial') + 18
      curriculum = url[curriculumIndex..curriculumIndex + 4]

      course = Curso.find_by_sigla 'code'
      unless course
        course = Curso.new
        course.codigo = code
        course.nome = a.text
        course.curriculo = curriculum
        course.save
      end
    end
    puts '-> Finished courses crawling'
    puts '-----------------------------------------------------------------------'
  end

  desc 'Crawl the disciplines of every known course'
  task :disciplines => :environment do
    puts '-----------------------------------------------------------------------'
    puts '-> Starting disciplines crawling...'

    require 'rubygems'
    require 'mechanize'

    Curso.all.order(:nome).each do |course|
      puts "    Crawling #{course.nome}"

      agent = Mechanize.new
      hub = agent.get "https://alunoweb.ufba.br/SiacWWW/CurriculoCursoGradePublico.do?cdCurso=#{course.codigo}&nuPerCursoInicial=#{course.curriculo}"

      for i in 0..1
        page = hub.links[i].click

        table = page.search('table')[0]
        rows = table.css('tr')[2..-1]

        semester = nil
        next if rows.blank?
        rows.each do |row|
          columns = row.css('td')

          semester = columns[0].text.to_i unless columns[0].text.blank?
         # nature = columns[1].text
          code = columns[2].text
          name = columns[3].css('a').text.strip
          name = columns[3].text.strip if name == ""

          curriculum = nil
          discipline_link = columns[3].css('a')
          if discipline_link.size == 1 && discipline_link.first.attr('href') =~ /nuPerInicial=(\d+)/
            curriculum = $1
          end

          discipline = Disciplina.find_by_codigo code

          unless discipline
            discipline = Disciplina.new
            discipline.codigo = code
            discipline.nome = name
            #discipline.curriculo = curriculum
            discipline.save
          end

          course_discipline = Disciplinacurso.where(curso_id: course.id, disciplina_id: discipline.id)
          if course_discipline.blank?
            course_discipline = Disciplinacurso.new
            course_discipline.semestre = semester
            #course_discipline.nature = nature
            course_discipline.disciplina_id = discipline.id
            course_discipline.curso_id =  course.id
            course_discipline.save
          end
        end
      end
    end
    puts '-> Finished disciplines crawling'
    puts '-----------------------------------------------------------------------'
  end
  
  
  desc 'Crawl all courses class pages'
  task :professors => :environment do
    require 'nokogumbo'
    require 'rubygems'
    require 'mechanize'

    puts '-----------------------------------------------------------------------'
    puts '-> Starting classes crawling...'


    agent = Mechanize.new
    agent.open_timeout = 300
    agent.read_timeout = 300

    hub = agent.get 'https://supac.ufba.br/guia-matricula-graduacao'
    area_hubs = hub.search('#conteudo').css('a').map{ |a| agent.get a['href'] }

    area_hubs.each do |area_hub|
      guides_list = area_hub.search('div.field-item.even')
      guide_urls = guides_list.css('a').map{ |a| URI.join(area_hub.uri, a['href']).to_s }.delete_if{ |a| a.include? 'www2.supac.ufba.br' }
      guides = guide_urls.map { |url| Nokogiri::HTML5.get(url, {open_timeout: 300, read_timeout: 300}) }

      guides.each_with_index do |page, index|
        page.encoding = 'windows-1252'

     #   course_hash = {}
        course_code = guide_urls[index].split('/')[-1]
        course_code.slice! '.html'
        course_code.slice! '.htm'
        course_code = course_code.split('_')[0]
        
         body = page.search('body')
       #  course_name = body.css('font')[1].text.split(': ')[1]
         table = body.css('table')
         rows = table.css('tr')

   

          next if rows.blank?
          rows[7..-1].each do |row|
            columns = row.css('td')
            unless columns.blank?

              professor_name = columns[5].children[0].text.strip unless columns[5].children[0].text == ''
              professor = Professor.find_by_nome professor_name
              unless professor
                professor = Professor.new
                professor.nome = professor_name
                professor.save
              end
            end  
          end
      end      
    end 
    puts '-> Finished classes crawling'
    puts '-----------------------------------------------------------------------'
  end


end
