begin
  require 'rdoc/task'

  RDoc::Task.new rdoc: 'doc', clobber_rdoc: 'doc:clobber', rerdoc: 'doc:force' do |t|
    t.main = 'README.md'
    t.markup = 'markdown'
    t.rdoc_files = `git ls-files`.split("\n").select { |f| f =~ /\Aapp\/controllers/ }
    t.rdoc_dir = 'doc'
  end
end
