begin
  require 'rdoc/task'

  RDoc::Task.new rdoc: 'doc', clobber_rdoc: 'doc:clobber', rerdoc: 'doc:force' do |t|
    t.main = 'API.rdoc'
    t.markup = 'markdown'
    t.rdoc_files = `git ls-files`.split("\n").select { |f| f =~ /\Aapp\/controllers|API.rdoc/ }
    t.rdoc_dir = 'doc'
  end
end
