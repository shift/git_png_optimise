# Install hook code here
require 'fileutils'

if File.exists? '.git/hooks/pre-commit'
  require 'readline'
  puts "A .git/hooks/pre-commit already exists, awnser no to backup your pre-commit hook"
  responce = Readline::readline 'Overwrite [y/n]: '
  Readline::HISTORY.push(responce)
  File.rename('.git/hooks/pre-commit', '.git/hooks/pre-commit.backup') if responce =~ /^n.*/
end

FileUtils.copy('vendor/plugins/git_png_optimise/examples/pre-commit', '.git/hooks/pre-commit')
hook = File.open('.git/hooks/pre-commit')
hook.chmod 0755
