lib LibC
  ifdef linux
    @[ThreadLocal]
    $errno : Int32
  else
    $errno : Int32
  end

  fun strerror(errnum : Int32) : UInt8*
end

class Errno < Exception
  def initialize(message)
    super "#{message}: #{String.new(LibC.strerror(LibC.errno))}"
  end
end
