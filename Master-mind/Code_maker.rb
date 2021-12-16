class CodeMaker

  $secret_code = nil

  def self.create_code
    print "\n Enter four colors separated by commas: "
    $secret_code = gets.chomp.split(",")
    begin
      if $secret_code.length != 4 then raise "ValueError"; end
    rescue
      puts "You need to enter 4 keys"
      create_code
    end
    system('reset')
  end
end
