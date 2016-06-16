module BirstInterface	
	def self.new_session
		birst_settings_file =  File.expand_path('~/.birstcl')
		Birst_Command.load_settings_from_file(birst_settings_file)

		Birst_Command::Session.new do |bc|
			p "New Birst session started => #{bc}"
			return bc
		end
	end
end