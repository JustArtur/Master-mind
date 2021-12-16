class Decryptor

  $code = nil

  def self.make_step
    print "\n Enter the estimated colors, separated by commas: "
    $code = gets.chomp.split(",")
    begin
      if $code.length != 4 then raise "ValueError"; end
    rescue
      puts "You need to enter 4 keys"
      make_step
    end
  end
end

