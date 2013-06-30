
class YardMiniTestSpecDescribeHandler < YARD::Handlers::Ruby::Base
  VERSION = YardMiniTestSpec::VERSION
  handles method_call(:describe)
  
  def process
    objname = statement.parameters.first.jump(:string_content).source
    if statement.parameters[1]
      src = statement.parameters[1].jump(:string_content).source
      objname += (src[0] == "#" ? "" : "::") + src
    end
    obj = {:spec => owner ? (owner[:spec] || "") : ""}
    obj[:spec] += objname
    parse_block(statement.last.last, owner: obj)
  rescue YARD::Handlers::NamespaceMissingError
  end
end

class YardMiniTestSpecItHandler < YARD::Handlers::Ruby::Base
  VERSION = YardMiniTestSpec::VERSION
  handles method_call(:it)
  
  def process
    return if owner.nil?
    obj = P(owner[:spec])
    return if obj.is_a?(Proxy)
    # ignore comments etc
    if statement.last.last.source.chomp.size > 0
      (obj[:specifications] ||= []) << {
        name: statement.parameters.first.jump(:string_content).source,
        file: statement.file,
        line: statement.line,
        source: statement.last.last.source.chomp
      }
    end
  end
end
