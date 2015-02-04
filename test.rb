
Dir['*.sh'].each { |file|
	print `ls -l #{file}`
}
